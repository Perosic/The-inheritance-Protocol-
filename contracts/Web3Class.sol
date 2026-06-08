//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Web3Class {
    struct Web3Class {
    string ClassName;
    string TutorName;
                            uint256 TotalNumberOfStudents;
                                    bool AreStudentsPresent;
                                            uint256 NumberOfStudentsAbsent;
                                                }

                                                    Web3Class public web3class;

                                                        function setWeb3Class(
                                                                string memory _ClassName,
                                                                        string memory _TutorName,
                                                                                uint256 _TotalNumberOfStudents,
                                                                                        bool _AreStudentsPresent,
                                                                                                uint256 _NumberOfStudentsAbsent
                                                                                                    ) public {
                                                                                                            web3class = Web3Class(
                                                                                                                        _ClassName,
                                                                                                                                    _TutorName,
                                                                                                                                                _TotalNumberOfStudents,
                                                                                                                                                            _AreStudentsPresent,
                                                                                                                                                                        _NumberOfStudentsAbsent
                                                                                                                                                                                );
                                                                                                                                                                                    }

                                                                                                                                                                                        function getWeb3Class() public view returns (
                                                                                                                                                                                                string memory,
                                                                                                                                                                                                        string memory,
                                                                                                                                                                                                                uint256,
                                                                                                                                                                                                                        bool,
                                                                                                                                                                                                                                uint256
                                                                                                                                                                                                                                    ) {
                                                                                                                                                                                                                                            return (
                                                                                                                                                                                                                                                        web3class.ClassName,
                                                                                                                                                                                                                                                                    web3class.TutorName,
                                                                                                                                                                                                                                                                                web3class.TotalNumberOfStudents,
                                                                                                                                                                                                                                                                                            web3class.AreStudentsPresent,
                                                                                                                                                                                                                                                                                                        web3class.NumberOfStudentsAbsent
                                                                                                                                                                                                                                                                                                                );
                                                                                                                                                                                                                                                                                                                    }

                                                                                                                                                                                                                                                                                                                        // Class activities as part of the same contract
                                                                                                                                                                                                                                                                                                                            uint256[3] public ClassActiveDays = [1, 3, 5];
                                                                                                                                                                                                                                                                                                                                string[] public ClassActivitiesList = [
                                                                                                                                                                                                                                                                                                                                        "Questioning",
                                                                                                                                                                                                                                                                                                                                                "Answering",
                                                                                                                                                                                                                                                                                                                                                        "coding",
                                                                                                                                                                                                                                                                                                                                                                "web3fundamentals"
                                                                                                                                                                                                                                                                                                                                                                    ];
                                                                                                                                                                                                                                                                                                                                                                    }