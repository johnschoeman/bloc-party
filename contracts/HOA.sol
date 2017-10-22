pragma solidity ^0.4.4;

contract HOA {
  string name;
  address[10] members;
  address treasurer;

  function HOA(string _name, address[10] _members) {
    name = _name;
    members = [];
    treasurer = msg.sender;
  }

  struct Member {
    address userAddress;
  }
  
  struct Proposal {
    uint256 id;
    string title;
    string description;
    uint256 cost;
    uint256 voteScore;
    bytes32[] voters; //List of members who have already voted for the proposal
  }

  struct Ballot {
    uint256 id;
    string title;
  }

  address sponsor;
  Proposal[] proposals;

  // Create a new proposal
  function createProposal(string title, uint cost) public {
    Member storage sender = members[msg.sender];
    assert (members[sender].name != "");

    
  }

  // function removeProposal(uint id) {

  // }

  /// Give a single vote to proposal $(toProposal).
  // function vote(uint8 toProposal, uint8 voteWeight) public {
  //   Member storage sender = members[msg.sender];
  //   if (toProposal >= proposals.length || !members[msg.sender]) { //check to see if sender voted
  //     return;
  //   }

  // }

  function newBallot() {
    //Proposals persist only if they have a certain number of votes
    //Reset everything to empty
  }

  // function winningProposal() public constant returns (uint8 _winningProposal) {
  //   uint256 winningVoteCount = 0;
  //     for (uint8 prop = 0; prop < proposals.length; prop++) {
  //       if (proposals[prop].voteCount > winningVoteCount) {
  //           winningVoteCount = proposals[prop].voteCount;
  //           _winningProposal = prop;
  //       }
  //     }
  // }

  function payTreasurer(uint8 amount) {
    treasurer.send(amount);
  }

  function payDues () payable {}
}