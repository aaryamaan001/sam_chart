class SamChartTable8 {
  String? breastFeedingAtPresent; // Yes/No
  String? anyOtherMilk; // Yes/No
  String? whichMilk; // If Yes
  String? complementaryFeeds; // Yes/No
  String? ageOfIntroduction; // If Yes
  String? frequencyOfComplementaryFeeding;
  String? dietaryDiversity;

  SamChartTable8({
    this.breastFeedingAtPresent,
    this.anyOtherMilk,
    this.whichMilk,
    this.complementaryFeeds,
    this.ageOfIntroduction,
    this.frequencyOfComplementaryFeeding,
    this.dietaryDiversity,
  });

  // Converts JSON to SamChartTable8 object
  factory SamChartTable8.fromJson(Map<String, dynamic> json) {
    return SamChartTable8(
      breastFeedingAtPresent: json['breastFeedingAtPresent'],
      anyOtherMilk: json['anyOtherMilk'],
      whichMilk: json['whichMilk'],
      complementaryFeeds: json['complementaryFeeds'],
      ageOfIntroduction: json['ageOfIntroduction'],
      frequencyOfComplementaryFeeding: json['frequencyOfComplementaryFeeding'],
      dietaryDiversity: json['dietaryDiversity'],
    );
  }

  // Converts SamChartTable8 object to JSON
  Map<String, dynamic> toJson() {
    return {
      'breastFeedingAtPresent': breastFeedingAtPresent,
      'anyOtherMilk': anyOtherMilk,
      'whichMilk': whichMilk,
      'complementaryFeeds': complementaryFeeds,
      'ageOfIntroduction': ageOfIntroduction,
      'frequencyOfComplementaryFeeding': frequencyOfComplementaryFeeding,
      'dietaryDiversity': dietaryDiversity,
    };
  }
}
