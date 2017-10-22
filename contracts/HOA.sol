pragma solidity ^0.4.4;

contract HOA {

  address owner;

  function HOA() {
    owner = msg.sender;
  }

  struct member {
    string name;
    address userAddress;
  }

  enum proposalState {
    pending, 
    approved, 
    denied, 
    expired
  }
  
  struct proposalData {
    uint256 id;
    address sponsor;
    string title;
    proposalState state;
    uint256 voteScore;
    uint creationTimestamp;
    bytes32[] voters; //List of members who have already voted for the proposal
  }

  address sponsor;
  mapping (address => member ) members;
  uint[] proposals;

  /// Get members
  function getMembers() public returns (address[16]) {
    return members;
  }

  /// Create a new proposal
  function proposal(string title, uint cost) public {
    if (!members[msg.sender]) {
      return;
    }
    sponsor = msg.sender;
  }

  /// Give a single vote to proposal $(toProposal).
  function vote(uint8 toProposal, uint8 voteWeight) public {
      if (toProposal >= proposals.length || !members[msg.sender]) { //check to see if sender voted
        return;
      }

  }

  function winningProposal() public constant returns (uint8 _winningProposal) {
    uint256 winningVoteCount = 0;
      for (uint8 prop = 0; prop < proposals.length; prop++) {
        if (proposals[prop].voteCount > winningVoteCount) {
            winningVoteCount = proposals[prop].voteCount;
            _winningProposal = prop;
        }
      }
  }
}