import 'package:timeago/timeago.dart';

class LaunchEventModel {
  String launchName;
  String agencyName;
  String locationName;
  String dateTime;
  int status;

  LaunchEventModel({
    this.launchName,
    this.agencyName,
    this.locationName,
    this.dateTime,
    this.status,
  });

  final TimeAgo timeAgo = TimeAgo();

  LaunchEventModel.fromJson(Map json) {
    launchName = json["name"];
    agencyName = json["rocket"]["agencies"]
        .map(
          (j) => j["name"],
        )
        .toList()
        .join(", ");
    locationName = json["location"]["pads"][0]["name"];
    dateTime = json["tbddate"] == 1
        ? "TBD"
        : timeAgo.format(
            DateTime.parse(json["isonet"]),
            until: true,
          );
    status = json["status"];
  }
}
