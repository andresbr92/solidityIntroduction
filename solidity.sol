// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract CrowdFunding {
	enum FundraisingState { Opened, Closed }
    struct Project {
        string id;
        string name;
        string description;
        address payable author;
				FundraisingState state;
        uint256 fundraisingGoal;
        uint256 funds;
    }
    Project public project;

    event ProjectFunded(string projectId, uint256 value);

    event ProjectStateChanged(string id, string state);

    error projectClosed(uint256 unit);

    error projectSameState(uint256 unit);

    error fundEqualToCero(uint256 unit);

    constructor(
        string memory _id,
        string memory _name,
        string memory _description,
        uint256 _fundraisingGoal
    ) {
        project = Project(
            _id,
            _name,
            _description,
            payable(msg.sender),
            FundraisingState.Opened,
            0,
            _fundraisingGoal
        );
    }

    modifier isAuthor() {
        require(
            project.author == msg.sender,
            "You need to be the project author"
        );
        _;
    }

    modifier isNotAuthor() {
        require(
            project.author != msg.sender,
            "As author you can not fund your own project"
        );
        _;
    }

    function fundProject() public payable isNotAuthor {
        if (project.state == FundraisingState.Opened) {
            require(msg.value != 0, "You can not fund a project with 0 ether");
            project.author.transfer(msg.value);
            project.funds += msg.value;
            emit ProjectFunded(project.id, msg.value);
        } else if (project.state == FundraisingState.Closed) {
            revert projectClosed(0);
        }
    }

    function changeProjectState(FundraisingState newState) public isAuthor {
        if (project.state == newState) {
            revert projectSameState(0);
        } else {
            project.state = newState;
            emit ProjectStateChanged(project.id, "state");
        }
    }
}
