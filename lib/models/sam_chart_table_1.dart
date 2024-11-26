class SamChartTable1 {
  String childName; // required
  String? samNumber;
  String? fatherName;
  String? motherName;
  DateTime? dateOfBirth;
  int? ageYears;
  int? ageMonths;
  String? gender;
  String? caste; // General / SC / ST / Other
  String? socioEconomicStatus; // BPL / APL / Others
  String? address;
  String? contactNumber;

  // Constructor with auto age calculation if dateOfBirth is provided
  SamChartTable1({
    required this.childName,
    this.samNumber,
    this.fatherName,
    this.motherName,
    DateTime? dob,
    this.gender,
    this.caste,
    this.socioEconomicStatus,
    this.address,
    this.contactNumber,
  }) {
    if (dob != null) {
      setDateOfBirth(dob); // Automatically calculate age if dob is not null
    }
  }

  // Private method to calculate age from dateOfBirth
  void _calculateAge() {
    if (dateOfBirth != null) {
      final currentDate = DateTime.now();
      final difference = currentDate.difference(dateOfBirth!).inDays;
      ageYears = difference ~/ 365;
      ageMonths = (difference % 365) ~/ 30;
    }
  }

  // Method to set date of birth and automatically calculate age
  void setDateOfBirth(DateTime dob) {
    dateOfBirth = dob;
    _calculateAge(); // Calculate the age once dob is set
  }
}
