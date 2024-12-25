// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract EventOrganizer
{

    // Events struct
    struct Events
    {
        string name;
    }

    // Event and Attendees list
    Events[] public allEvents;

    // Mapping to track if an event exists
    mapping(string => bool) public eventExists;

    // Nested mapping to track RSVP status by event and attendee
    mapping(string => mapping(string => bool)) public eventToRSVP;


    // Function to create events
    function createEvent(string memory _name) public 
    {
        require(!eventExists[_name], "Event already exists!");
        allEvents.push(Events(_name));
        eventExists[_name] = true;
    }

    // function to rsvp
    function rsvpToEvent(string memory _eventName, string memory _attendeeName) public 
    {
        require(eventExists[_eventName], "Event does not exist!");
        require(!eventToRSVP[_eventName][_attendeeName], "Already RSVP'd!");
        eventToRSVP[_eventName][_attendeeName] = true;
    }
    
    // Function to check RSVP status
    function checkRSVP(string memory _eventName, string memory _attendeeName) public view returns (bool) 
    {
        require(eventExists[_eventName], "Event does not exist!");
        return eventToRSVP[_eventName][_attendeeName];
    }

}