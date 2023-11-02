pragma solidity ^0.8.0;

contract HealthRecords {
    struct PatientRecord {
        string patientName;
        uint256 age;
        string medicalHistory;
    }

    mapping(address => PatientRecord) private records;

    event NewPatientRecord(address indexed patientAddress, string patientName);

    function addPatientRecord(string memory name, uint256 age, string memory history) public {
        require(bytes(name).length > 0, "Patient name cannot be empty");
        require(bytes(history).length > 0, "Medical history cannot be empty");

        require(records[msg.sender].age == 0, "Patient record already exists");

        records[msg.sender] = PatientRecord(name, age, history);
        emit NewPatientRecord(msg.sender, name);
    }

    function getPatientRecord() public view returns (string memory, uint256, string memory) {
        PatientRecord memory patient = records[msg.sender];
        return (patient.patientName, patient.age, patient.medicalHistory);
    }
}
