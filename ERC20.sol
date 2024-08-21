// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract ERC20 {
    uint public totalSupply;
    mapping(address => uint) public balanceOf;
    mapping(address => mapping(address => uint)) public allowance;
    string public name = "Solidity by Example";
    string public symbol = "SOLBYEX";
    uint8 public decimals = 18;

    mapping(address => string) public characterOf;

    event Transfer(address indexed from, address indexed to, uint value);
    event Approval(address indexed owner, address indexed spender, uint value);
    event CharacterSwitched(address indexed player, string newCharacter);

    function transfer(address recipient, uint amount) external returns (bool) {
        require(balanceOf[msg.sender] >= amount, "Insufficient balance");
        balanceOf[msg.sender] -= amount;
        balanceOf[recipient] += amount;
        emit Transfer(msg.sender, recipient, amount);
        return true;
    }

    function approve(address spender, uint amount) external returns (bool) {
        allowance[msg.sender][spender] = amount;
        emit Approval(msg.sender, spender, amount);
        return true;
    }

    function transferFrom(
        address sender,
        address recipient,
        uint amount
    ) external returns (bool) {
        require(balanceOf[sender] >= amount, "Insufficient balance");
        require(allowance[sender][msg.sender] >= amount, "Allowance exceeded");
        allowance[sender][msg.sender] -= amount;
        balanceOf[sender] -= amount;
        balanceOf[recipient] += amount;
        emit Transfer(sender, recipient, amount);
        return true;
    }

    function mint(address account, uint amount) external {
        require(msg.sender == account, "You are not allowed to mint tokens for other accounts");
        balanceOf[account] += amount;
        totalSupply += amount;
        emit Transfer(address(0), account, amount);
    }

    function burn(uint amount) external {
        require(balanceOf[msg.sender] >= amount, "Insufficient balance");
        balanceOf[msg.sender] -= amount;
        totalSupply -= amount;
        emit Transfer(msg.sender, address(0), amount);
    }

    string public playerName;
    uint256 public playerScore;

    function setPlayerInfo(string memory _playerName, uint256 _playerScore) public {
        playerName = _playerName;
        playerScore = _playerScore;
    }

    function getPlayerAchievement(string memory _name) public view returns (string memory) {
    string memory achievement;
    
    if (playerScore >= 1000) {
        achievement = "Master Gamer";
    } else if (playerScore >= 500) {
        achievement = "Advanced Gamer";
    } else if (playerScore >= 100) {
        achievement = "Intermediate Gamer";
    } else {
        achievement = "Beginner Gamer";
    }

    return string(abi.encodePacked("Congratulations ", _name, "! You've achieved the title of '", achievement, "'."));
}


}


