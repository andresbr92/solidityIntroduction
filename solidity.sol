// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract CrowdFunding {
		struct Project {
			string id;
			string name;
			string description;
			address payable author;
			uint state;
			uint256 fundraisingGoal;
			uint256 funds;
		}
		Project public project;
		

    string public id;
    string public name;
    string public description;
    address payable public author;
    uint public state = 0;
    uint256 public funds;
    uint256 public fundraisingGoal;

    event ProjectFunded(string projectId, uint256 value);

    event ProjectStateChanged(string id, string state);

		error projectClosed(uint unit);

		error projectSameState(uint unit);

		error fundEqualToCero(uint unit);

    constructor(
        string memory _id,
        string memory _name,
        string memory _description,
        uint256 _fundraisingGoal
    ) {
			project = Project(_id, _name, _description, payable(msg.sender), 0, 0, _fundraisingGoal);
    }

    modifier isAuthor() {
        require(author == msg.sender, "You need to be the project author");
        _;
    }

    modifier isNotAuthor() {
        require(
            author != msg.sender,
            "As author you can not fund your own project"
        );
        _;
    }

    function fundProject() public payable isNotAuthor {
			
			if(state == 1) {
				require(msg.value != 0, "You can not fund a project with 0 ether");
        project.author.transfer(msg.value);
        project.funds += msg.value;
        emit ProjectFunded(project.id, msg.value);

			} else if (state == 0) {
				revert projectClosed(state);

			}
			
    }

    function changeProjectState(uint newState) public isAuthor {
			if(state == newState) {
				revert projectSameState(newState);


			} else {
        project.state = newState;
        emit ProjectStateChanged(id, 'state');
			}
    }
}
