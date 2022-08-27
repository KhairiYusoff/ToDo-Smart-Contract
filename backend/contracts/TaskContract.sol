// SPDX-License-Identifier: MIT
pragma solidity 0.8.15;


contract TaskContract {

  event AddTask (address recipient, uint taskId);
  event DeleteTask (uint taskId, bool isDeleted);

  struct Task {
    uint id;
    string taskText;
    bool isDeleted;
  }

 Task[] private tasks;

 mapping (uint256 => address) taskToOwner;

 function addTask (string memory taskText, bool isDeleted) external {
  uint taskId = tasks.length;
  tasks.push(Task(id, taskText, isDeleted));
  taskToOwner[taskId] = msg.sender;
  emit AddTask(msg.sender, taskId);
 }

  function getMyTasks () external view returns (Task[] memory) {
    
  }

}
