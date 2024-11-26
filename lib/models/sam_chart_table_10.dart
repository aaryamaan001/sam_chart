class SamChartTable10 {
  double? hemoglobin;
  double? bloodGlucose;
  int? totalLeucocyteCount;
  String? differentialLeucocyteCount;
  String? urineTest;
  String? testForTB;
  String? serumElectrolytes;
  String? otherTests;

  SamChartTable10({
    this.hemoglobin,
    this.bloodGlucose,
    this.totalLeucocyteCount,
    this.differentialLeucocyteCount,
    this.urineTest,
    this.testForTB,
    this.serumElectrolytes,
    this.otherTests,
  });

  // Converts JSON to SamChartTable10 object
  factory SamChartTable10.fromJson(Map<String, dynamic> json) {
    return SamChartTable10(
      hemoglobin: json['hemoglobin']?.toDouble(),
      bloodGlucose: json['bloodGlucose']?.toDouble(),
      totalLeucocyteCount: json['totalLeucocyteCount'],
      differentialLeucocyteCount: json['differentialLeucocyteCount'],
      urineTest: json['urineTest'],
      testForTB: json['testForTB'],
      serumElectrolytes: json['serumElectrolytes'],
      otherTests: json['otherTests'],
    );
  }

  // Converts SamChartTable10 object to JSON
  Map<String, dynamic> toJson() {
    return {
      'hemoglobin': hemoglobin,
      'bloodGlucose': bloodGlucose,
      'totalLeucocyteCount': totalLeucocyteCount,
      'differentialLeucocyteCount': differentialLeucocyteCount,
      'urineTest': urineTest,
      'testForTB': testForTB,
      'serumElectrolytes': serumElectrolytes,
      'otherTests': otherTests,
    };
  }
}
