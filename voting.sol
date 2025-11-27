// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Voting {
    // Struktur untuk menyimpan data kandidat
    struct Candidate {
        uint id;
        string name;
        uint voteCount;
    }

    mapping(uint => Candidate) public candidates;
    mapping(address => bool) public voters; // Mencatat siapa yang sudah vote agar tidak vote 2x
    uint public candidatesCount;

    // Event agar frontend tahu ada vote masuk
    event votedEvent (
        uint indexed _candidateId
    );

    constructor() {
        addCandidate("Kandidat A");
        addCandidate("Kandidat B");
    }

    function addCandidate (string memory _name) private {
        candidatesCount ++;
        candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
    }

    function vote (uint _candidateId) public {
        // Syarat 1: Pemilih belum pernah memilih sebelumnya
        require(!voters[msg.sender], "Anda sudah memilih!");

        // Syarat 2: ID Kandidat harus valid
        require(_candidateId > 0 && _candidateId <= candidatesCount, "ID Kandidat tidak valid");

        // Catat bahwa pengirim (msg.sender) sudah memilih
        voters[msg.sender] = true;

        // Tambahkan suara ke kandidat
        candidates[_candidateId].voteCount ++;

        // Trigger event
        emit votedEvent(_candidateId);
    }
}