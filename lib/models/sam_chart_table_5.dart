class SamChartTable5 {
  DateTime? dateOfDischarge;
  String? exitIndicator;
  String? supplementarySuckingTechnique; // Yes/No/NA
  String? outcomeOfSST; // Successful/Not Successful/NA
  int? durationOfStay; // In days
  double? dischargeWeightKg;
  int? dischargeWeightGms;
  String? dischargeWHZScore;
  int? dischargeMUAC;
  double? averageWeightGainPerDay;

  SamChartTable5({
    this.dateOfDischarge,
    this.exitIndicator,
    this.supplementarySuckingTechnique,
    this.outcomeOfSST,
    this.durationOfStay,
    this.dischargeWeightKg,
    this.dischargeWeightGms,
    this.dischargeWHZScore,
    this.dischargeMUAC,
    this.averageWeightGainPerDay,
  });

  // Converts JSON to SamChartTable5 object
  factory SamChartTable5.fromJson(Map<String, dynamic> json) {
    return SamChartTable5(
      dateOfDischarge: json['dateOfDischarge'] != null
          ? DateTime.parse(json['dateOfDischarge'])
          : null,
      exitIndicator: json['exitIndicator'],
      supplementarySuckingTechnique: json['supplementarySuckingTechnique'],
      outcomeOfSST: json['outcomeOfSST'],
      durationOfStay: json['durationOfStay'],
      dischargeWeightKg: json['dischargeWeightKg'],
      dischargeWeightGms: json['dischargeWeightGms'],
      dischargeWHZScore: json['dischargeWHZScore'],
      dischargeMUAC: json['dischargeMUAC'],
      averageWeightGainPerDay: json['averageWeightGainPerDay'],
    );
  }

  // Converts SamChartTable5 object to JSON
  Map<String, dynamic> toJson() {
    return {
      'dateOfDischarge':
          dateOfDischarge != null ? dateOfDischarge!.toIso8601String() : null,
      'exitIndicator': exitIndicator,
      'supplementarySuckingTechnique': supplementarySuckingTechnique,
      'outcomeOfSST': outcomeOfSST,
      'durationOfStay': durationOfStay,
      'dischargeWeightKg': dischargeWeightKg,
      'dischargeWeightGms': dischargeWeightGms,
      'dischargeWHZScore': dischargeWHZScore,
      'dischargeMUAC': dischargeMUAC,
      'averageWeightGainPerDay': averageWeightGainPerDay,
    };
  }
}
