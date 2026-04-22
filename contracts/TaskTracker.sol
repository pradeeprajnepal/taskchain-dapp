// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract TaskTracker {

    struct Mission {
        uint id;
        string title;
        string priority; // Low, Medium, High
        bool completed;
        address creator;
    }

    uint public missionCount = 0;

    mapping(uint => Mission) public missions;

    event MissionCreated(uint id, string title, string priority, address creator);
    event MissionCompleted(uint id);

    function createMission(string memory _title, string memory _priority) public {
        missionCount++;

        missions[missionCount] = Mission(
            missionCount,
            _title,
            _priority,
            false,
            msg.sender
        );

        emit MissionCreated(missionCount, _title, _priority, msg.sender);
    }

    function completeMission(uint _id) public {
        Mission storage m = missions[_id];
        require(m.creator == msg.sender, "Not your mission");
        require(!m.completed, "Already completed");

        m.completed = true;

        emit MissionCompleted(_id);
    }
}