// SPDX-License-Identifier: MIT
pragma solidity ^0.8.1;

// A contract to manage mobile subscribers
contract SubscriberManager {
    
    // Define a struct to represent a subscriber
    struct Subscriber {
        uint256 id;          // Unique ID for the subscriber
        uint256 amount;      // Amount owed by the subscriber
        bool isPaid;         // Payment status (true if paid, false if not)
    }

    // Mapping to store subscribers by their ID
    mapping(uint256 => Subscriber) public subscribers;

    // Event declaration  - Event to log when a new subscriber is added
    event SubscriberAdded(uint256 indexed id, uint256 amount, bool isPaid);

    // Function to add a new subscriber
    function addSubscriber(uint256 _id, uint256 _amount) public {
        // Create a new subscriber and store it in the mapping
          subscribers[_id] = Subscriber(_id,_amount,false);

        // Emit the SubscriberAdded event
        emit SubscriberAdded(_id, _amount, false);
    }


    // Function to mark a subscriber as paid
    function markAsPaid(uint256 _id) public {
        require(subscribers[_id].id != 0, "Subscriber does not exist");
        // Update payment status to Paid
        subscribers[_id].isPaid = true;
        // Emit the SubscriberAdded event with updated status
        emit SubscriberAdded(_id, subscribers[_id].amount, true);
    }
    // Function to get details of a specific subscriber by ID
    function getSubscriber(uint256 _id) public view returns (uint256, uint256, bool) {
        require(subscribers[_id].id != 0, "Subscriber does not exist");
        Subscriber memory sub = subscribers[_id];//retrieve from the map and display
        return (sub.id, sub.amount, sub.isPaid);
    }
}
