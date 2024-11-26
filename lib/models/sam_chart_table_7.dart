class SamChartTable7 {
  String? diarrhoeaRemarks;
  String? vomitingRemarks;
  String? feverRemarks;
  String? hypothermiaRemarks;
  String? coughRemarks;
  String? lethargyRemarks;
  String? swellingRemarks;
  String? otherRemarks;
  String? immunizationHistory; // Example: "BCG, DPT-1, OPV-2"

  SamChartTable7({
    this.diarrhoeaRemarks,
    this.vomitingRemarks,
    this.feverRemarks,
    this.hypothermiaRemarks,
    this.coughRemarks,
    this.lethargyRemarks,
    this.swellingRemarks,
    this.otherRemarks,
    this.immunizationHistory,
  });

  // Converts JSON to SamChartTable7 object
  factory SamChartTable7.fromJson(Map<String, dynamic> json) {
    return SamChartTable7(
      diarrhoeaRemarks: json['diarrhoeaRemarks'],
      vomitingRemarks: json['vomitingRemarks'],
      feverRemarks: json['feverRemarks'],
      hypothermiaRemarks: json['hypothermiaRemarks'],
      coughRemarks: json['coughRemarks'],
      lethargyRemarks: json['lethargyRemarks'],
      swellingRemarks: json['swellingRemarks'],
      otherRemarks: json['otherRemarks'],
      immunizationHistory: json['immunizationHistory'],
    );
  }

  // Converts SamChartTable7 object to JSON
  Map<String, dynamic> toJson() {
    return {
      'diarrhoeaRemarks': diarrhoeaRemarks,
      'vomitingRemarks': vomitingRemarks,
      'feverRemarks': feverRemarks,
      'hypothermiaRemarks': hypothermiaRemarks,
      'coughRemarks': coughRemarks,
      'lethargyRemarks': lethargyRemarks,
      'swellingRemarks': swellingRemarks,
      'otherRemarks': otherRemarks,
      'immunizationHistory': immunizationHistory,
    };
  }
}
