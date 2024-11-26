class SamChartTable4 {
  DateTime? dateOfAdmission;
  double? admissionWeightKg;
  int? admissionWeightGms;
  double? admissionHeight;
  double? whzScore;
  int? muac; // Mid-Upper Arm Circumference in mm
  String? oedema; // Values can be: 0, +, ++, +++
  String? appetiteTest; // Pass or Fail
  String? complications; // Yes/No + details

  SamChartTable4({
    this.dateOfAdmission,
    this.admissionWeightKg,
    this.admissionWeightGms,
    this.admissionHeight,
    this.whzScore,
    this.muac,
    this.oedema,
    this.appetiteTest,
    this.complications,
  });
}
