class SamChartTable2 {
  String? district;
  String? block;
  String? facilityName;
  String? facilityType;
  String? toiletFacilityAvailable;
  String? waterSource;
  String? referredFrom;
  String? referredReason;

  SamChartTable2({
    this.district,
    this.block,
    this.facilityName,
    this.facilityType,
    this.toiletFacilityAvailable,
    this.waterSource,
    this.referredFrom,
    this.referredReason,
  });

  factory SamChartTable2.fromJson(Map<String, dynamic> json) {
    return SamChartTable2(
      district: json['district'],
      block: json['block'],
      facilityName: json['facilityName'],
      facilityType: json['facilityType'],
      toiletFacilityAvailable: json['toiletFacilityAvailable'],
      waterSource: json['waterSource'],
      referredFrom: json['referredFrom'],
      referredReason: json['referredReason'],
    );
  }

  // Method to convert FacilityData to JSON
  Map<String, dynamic> toJson() {
    return {
      'district': district,
      'block': block,
      'facilityName': facilityName,
      'facilityType': facilityType,
      'toiletFacilityAvailable': toiletFacilityAvailable,
      'waterSource': waterSource,
      'referredFrom': referredFrom,
      'referredReason': referredReason,
    };
  }
}
