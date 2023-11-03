pragma solidity >=0.4.22 <0.9.0;

contract Smarthealthcaresystem {
    // State Variables
    string public ContractName;
    // uint public countPatients;
    // uint public countDoctors;
    // uint public countInsurer;
    // uint public countPolicy;
    address[] public patients;
    address[] public doctors;
    address[] public Insurers;
    Policy[] public policies;
    mapping (address => patientInfo) public patientData;
    mapping (address => doctorInfo) public doctorData;
    mapping (address => insurerInfo) public insurerData;
    mapping (string => address) public emailToUserAddress;
    mapping (string => uint) public emailToUserRole;
    struct patientInfo {
        string fullname;
        string emailaddress;
        uint age;
        string medicalrecord;
        bool exists;
        bool hasActivePolicy;
        InsurancePolicy activePolicy;
        address[] alloweddoctors;
    }
    struct doctorInfo {
        string fullname;
        string emailaddress;
        bool exists;
        address[] allowedpatiens;
    }
    struct insurerInfo {
        string fullname;
        string emailaddress;
        bool exists;
        Policy[] policies;
        address[] patients;
    }
    struct InsurancePolicy {
    uint policyId;
    address insurerAddress;
    string policyName;
    uint coverageAmount;
    uint policyDuration;
    uint premiumAmount;
    }
    constructor(){
        name = "Smarthealthcare";
    }
    function register(string memory _fullName, uint _age, uint _designation, string memory _email, string memory _medicalRecord) public {       
        require(msg.sender != address(0), "Invalid sender address");
        require(bytes(_fullName).length > 0, "Full name cannot be empty");
        require(bytes(_email).length > 0, "Email address cannot be empty");
        require(emailToUserAddress[_email] == address(0), "Email address is already registered");
        require(emailToUserRole[_email] == 0, "Designation already set for this email");
        address userAddress = msg.sender;
        require(!patients[userAddress].exists && !doctors[userAddress].exists && !insurers[userAddress].exists, "User already registered");

        if (_designation == 1) {
            require(_age > 0, "Invalid age");
            require(bytes(_medicalRecord).length > 0, "Medical record cannot be empty");
            PatientInfo storage patientInfo = patients[userAddress];
            patientInfo.fullName = _fullName;
            patientInfo.emailAddress = _email;
            patientInfo.age = _age;
            patientInfo.medicalRecord = _medicalRecord;
            patientInfo.exists = true;
            patientInfo.allowedDoctors;
            patientList.push(userAddress);
            emailToUserAddress[_email] = userAddress;
            emailToUserRole[_email] = _designation;
        } 
        else if (_designation == 2) {
            DoctorInfo storage doctorInfo = doctors[userAddress];
            doctorInfo.fullName = _fullName;
            doctorInfo.emailAddress = _email;
            doctorInfo.exists = true;
            doctorInfo.assignedPatients;
            doctorList.push(userAddress);
            emailToUserAddress[_email] = userAddress;
            emailToUserRole[_email] = _designation;
        } 
        else if (_designation == 3) {
            InsurerInfo storage insurerInfo = insurers[userAddress];
            insurerInfo.fullName = _fullName;
            insurerInfo.emailAddress = _email;
            insurerInfo.exists = true;
            insurerInfo.insuredPolicies;
            insurerInfo.coveredPatients;
            insurerList.push(userAddress);
            emailToUserAddress[_email] = userAddress;
            emailToUserRole[_email] = _designation;
        } 
        else {
            revert("Invalid designation");
       }
    }
    function login(address _userAddress) view public returns (uint) {
        require(_userAddress != address(0), "Invalid address");
        if (patients[_userAddress].exists) {
            return 1; // Patient
        } 
        else if (doctors[_userAddress].exists) {
            return 2; // Doctor
        } 
        else if (insurers[_userAddress].exists) {
            return 3; // Insurer
        } 
        else {
            return 0; // Unknown user
        }
    }
    function getPatientDoctorList(address _patientAddress) view public returns (address[] memory) {
        require(_patientAddress != address(0), "Invalid patient address");
        require(patients[_patientAddress].exists, "Patient not found");
        return patients[_patientAddress].allowedDoctors;
    }
    function getDoctorPatientList(address _doctorAddress) view public returns (address[] memory) {
        require(_doctorAddress != address(0), "Invalid doctor address");
        require(doctors[_doctorAddress].exists, "Doctor not found");
        return doctors[_doctorAddress].assignedPatients;
    }
    function getInsurerPolicyList(address _insurerAddress) view public returns (InsurancePolicy[] memory) {
        require(_insurerAddress != address(0), "Invalid insurer address");
        require(insurers[_insurerAddress].exists, "Insurer not found");
        return insurers[_insurerAddress].insuredPolicies;
    }
