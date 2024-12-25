// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract ToDoList 
{
    //Tasks struct
    struct Tasks
    {
        string task;
        bool completed;
    }

    //Mapping task to completion
    mapping(string => bool) taskToCompletion;

    // Tasks list
    Tasks[] public allTasks;

    //Function to create tasks
    function createTask(string memory _task) public
    {
        taskToCompletion[_task] = false;
        allTasks.push(Tasks(_task, false));
    }

    //Function to update tasks
    function updateTask(string memory _task, bool _completed) public 
    {
        // Ensure the task exists in the mapping
        require(taskToCompletion[_task] != false || bytes(_task).length > 0, "Task does not exist!");

        // Update the mapping to reflect the new completion status
        taskToCompletion[_task] = _completed;

        // Update the status in the allTasks array
        for (uint256 i = 0; i < allTasks.length; i++) 
        {
            if (keccak256(abi.encodePacked(allTasks[i].task)) == keccak256(abi.encodePacked(_task))) 
            {
                allTasks[i].completed = _completed;
                break;
            }
        }
    }

    //Function delete
    function deleteTask(string memory _task) public {
    // Ensure the task exists
    require(taskToCompletion[_task] || bytes(_task).length > 0, "Task does not exist!");

    // Remove from the mapping
    delete taskToCompletion[_task];

    // Remove from the array
    for (uint256 i = 0; i < allTasks.length; i++) {
        if (keccak256(abi.encodePacked(allTasks[i].task)) == keccak256(abi.encodePacked(_task))) {
            // Swap with the last element and pop for gas efficiency
            allTasks[i] = allTasks[allTasks.length - 1];
            allTasks.pop();
            break;
        }
    }
}

}