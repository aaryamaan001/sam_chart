class SamChartTable9 {
  String? cyanosis;
  String? severeVisibleWasting;
  String? alteredSensorium;
  String? consciousness; // Alert, Irritable, Lethargic, etc.
  String? hairChanges; // Yes/No
  String? hairChangesDescription; // If yes, description
  String? skinChanges; // Yes/No
  String? skinChangesDescription; // If yes, description
  String? vitaminADeficiency; // Yes/No
  String? vitaminADeficiencyDescription; // If yes, description
  String? palmarPallor; // Yes/No
  String? pallorSeverity; // If yes: Some/Severe
  String? dehydration; // No/Some/Severe
  String? otherObservations;

  SamChartTable9({
    this.cyanosis,
    this.severeVisibleWasting,
    this.alteredSensorium,
    this.consciousness,
    this.hairChanges,
    this.hairChangesDescription,
    this.skinChanges,
    this.skinChangesDescription,
    this.vitaminADeficiency,
    this.vitaminADeficiencyDescription,
    this.palmarPallor,
    this.pallorSeverity,
    this.dehydration,
    this.otherObservations,
  });

  // Converts JSON to SamChartTable9 object
  factory SamChartTable9.fromJson(Map<String, dynamic> json) {
    return SamChartTable9(
      cyanosis: json['cyanosis'],
      severeVisibleWasting: json['severeVisibleWasting'],
      alteredSensorium: json['alteredSensorium'],
      consciousness: json['consciousness'],
      hairChanges: json['hairChanges'],
      hairChangesDescription: json['hairChangesDescription'],
      skinChanges: json['skinChanges'],
      skinChangesDescription: json['skinChangesDescription'],
      vitaminADeficiency: json['vitaminADeficiency'],
      vitaminADeficiencyDescription: json['vitaminADeficiencyDescription'],
      palmarPallor: json['palmarPallor'],
      pallorSeverity: json['pallorSeverity'],
      dehydration: json['dehydration'],
      otherObservations: json['otherObservations'],
    );
  }

  // Converts SamChartTable9 object to JSON
  Map<String, dynamic> toJson() {
    return {
      'cyanosis': cyanosis,
      'severeVisibleWasting': severeVisibleWasting,
      'alteredSensorium': alteredSensorium,
      'consciousness': consciousness,
      'hairChanges': hairChanges,
      'hairChangesDescription': hairChangesDescription,
      'skinChanges': skinChanges,
      'skinChangesDescription': skinChangesDescription,
      'vitaminADeficiency': vitaminADeficiency,
      'vitaminADeficiencyDescription': vitaminADeficiencyDescription,
      'palmarPallor': palmarPallor,
      'pallorSeverity': pallorSeverity,
      'dehydration': dehydration,
      'otherObservations': otherObservations,
    };
  }
}
