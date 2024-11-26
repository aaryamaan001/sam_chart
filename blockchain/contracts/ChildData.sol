// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

contract ChildData {
    struct Child {
        string name;
        uint256 weightOnAdmission;
        uint256 weightOnDischarge;
    }

    mapping(uint256 => Child) public children;
    uint256 public childCount;

    function addChild(string memory _name, uint256 _weightOnAdmission, uint256 _weightOnDischarge) public {
        children[childCount] = Child(_name, _weightOnAdmission, _weightOnDischarge);
        childCount++;
    }

    function getChild(uint256 _index) public view returns (string memory, uint256, uint256) {
        require(_index < childCount, "Index out of bounds");
        Child memory child = children[_index];
        return (child.name, child.weightOnAdmission, child.weightOnDischarge);
    }
}
