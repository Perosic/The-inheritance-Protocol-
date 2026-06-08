// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
// first struct Contract 
contract Web3Class {
    struct ClassData {
         string ClassName;
         string TutorName;
         bool AreStudentsPresent;
         uint256 TotalNumberOfStudents;
    } 
    // the class setter function 
    ClassData public web3class;
    function setClassData (
        string memory _ClassName,
        string memory _TutorName,
        bool AreStudentsPresent,
        uint256 TotalNumberOfStudents
    ) public {
        web3class = ClassData (
            _ClassName,
            _TutorName,
            AreStudentsPresent,
            TotalNumberOfStudents
        );
    }
    // the struct getter function 
    function getClassData() public view returns (
        string memory,
        string memory,
        bool,
        uint256
  ) {
    return (
         web3class.ClassName,
         web3class.TutorName,
         web3class.AreStudentsPresent,
         web3class.TotalNumberOfStudents
    );
  }
}
// End of the first Struct and also end of first Contract 
// Begining of a new contract which has two structs combined (second and third structs )
contract School {
    // the second struct 
    struct StudentData {
    string studentName;
    uint256 studentId;
    bool isStudentPresent;
  }
  // the third struct
  struct TeacherData {
       string teacherName;
       uint256 teacherId;
       bool isTeacherPresent;
  }
    StudentData public student;
    TeacherData public teacher;
    // the setter function of the second struct 
function setStudent(
     string memory _studentName,
     uint256 _studentId,
     bool _isStudentPresent
) public {
    student = StudentData(
        _studentName, 
        _studentId,
        _isStudentPresent); 
}
// the setter function of the third struct 
function setTeacher(
    string memory _teacherName,
    uint256 _teacherId,
    bool _isTeacherPresent
 ) public {
     teacher = TeacherData(
        _teacherName,
        _teacherId, 
        _isTeacherPresent);
  } 
  // the getter function of the second struct 
  function getStudent() public view returns (
      string memory,
      uint256,
      bool
 ) {
     return (
          student.studentName,
          student.studentId,
          student.isStudentPresent
      );
}
// the setter function of the third struct 
function getTeacher() public view returns (
    string memory,
    uint256,
     bool
  ) {
    return (
         teacher.teacherName,
         teacher.teacherId,
         teacher.isTeacherPresent
    );
  }
 }
    














    
    



    






















