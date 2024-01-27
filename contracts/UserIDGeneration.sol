// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.9.0;

contract UserIDGeneration {
    struct User {
        address userAddress;
        string userInfo;
        uint256 timestamp;
    }

    User[] public users;

    event UserIDGenerated(address indexed userAddress, string userInfo, uint256 timestamp);

    function generateUserID(string memory _userInfo) public {
        User memory newUser = User({
            userAddress: msg.sender,
            userInfo: _userInfo,
            timestamp: block.timestamp
        });

        users.push(newUser);

        emit UserIDGenerated(msg.sender, _userInfo, block.timestamp);
    }

    function getUserCount() public view returns (uint256) {
        return users.length;
    }
}
