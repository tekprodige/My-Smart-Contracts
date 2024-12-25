# My Smart Contracts

These are smart contracts I created to showcase my understanding of smart contracts and solidity. I've took the liberty of organizing them by skill level

## Smart Contracts

* Basic Voting System
  * Uses mappings to track votes for each candidate.
  * Created functions to cast a vote and view vote counts.
  * Used struct to define a candidate with properties like name and vote count.
  * Restricted vote casting using a boolean to ensure one vote per address.
* To-Do List
  * Used struct to define a task with a description and a completion status.
  * Stored tasks in an array or a mapping.
  * Added functions to create, mark as complete, and delete tasks.
* Counter
  * Used a simple uint variable as a counter.
  * Added functions to increment, decrement, and reset the counter.
  * Used view functions to check the counter value.
* Event Organizer
  * Used a struct for events with details like name, date, and list of attendees.
  * Used an array to store events and mappings for RSVP status.
  * Created functions to create events, RSVP, and view attendee lists.

### Try Smart Contracts

To examine or deploy one of the contracts simply:

1) Go to [remix]("https://remix.ethereum.org/")
2) Paste the code from smart contract
3) Hit compile
4) Hit deploy

# Thank You!!!!