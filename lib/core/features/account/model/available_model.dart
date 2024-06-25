class UpdateAvailableModel {
  final Day? monday;
  final Day? tuesday;
  final Day? wednesday;
  final Day? thursday;
  final Day? friday;
  final Day? saturday;
  final Day? sunday;

  UpdateAvailableModel({
    this.monday,
    this.tuesday,
    this.wednesday,
    this.thursday,
    this.friday,
    this.saturday,
    this.sunday,
  });

  factory UpdateAvailableModel.fromJson(Map<String, dynamic> json) =>
      UpdateAvailableModel(
        monday: json["monday"] == null ? null : Day.fromJson(json["monday"]),
        tuesday: json["tuesday"] == null ? null : Day.fromJson(json["tuesday"]),
        wednesday:
            json["wednesday"] == null ? null : Day.fromJson(json["wednesday"]),
        thursday:
            json["thursday"] == null ? null : Day.fromJson(json["thursday"]),
        friday: json["friday"] == null ? null : Day.fromJson(json["friday"]),
        saturday:
            json["saturday"] == null ? null : Day.fromJson(json["saturday"]),
        sunday: json["sunday"] == null ? null : Day.fromJson(json["sunday"]),
      );

  Map<String, dynamic> toJson() => {
        "monday": monday?.toJson(),
        "tuesday": tuesday?.toJson(),
        "wednesday": wednesday?.toJson(),
        "thursday": thursday?.toJson(),
        "friday": friday?.toJson(),
        "saturday": saturday?.toJson(),
        "sunday": sunday?.toJson(),
      };
}

class Day {
  final bool? morning;
  final bool? night;

  Day({
    this.morning,
    this.night,
  });

  factory Day.fromJson(Map<String, dynamic> json) => Day(
        morning: json["morning"],
        night: json["night"],
      );

  Map<String, dynamic> toJson() => {
        "morning": morning,
        "night": night,
      };
}
