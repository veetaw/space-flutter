import 'package:flutter/material.dart';

class LaunchCard extends StatelessWidget {
  LaunchCard({
    this.launchName,
    this.agencyName,
    this.locationName,
    this.dateTime,
    this.status,
  });

  final String launchName;
  final String agencyName;
  final String locationName;
  final String dateTime;
  final int status;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200.0,
      child: Card(
        color: Theme.of(context).cardColor,
        margin: EdgeInsets.all(8.0),
        elevation: 8.0,
        child: Container(
          padding: EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                width: double.infinity,
                child: Text(
                  launchName,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 28.0,
                    letterSpacing: -.3,
                    color: Theme.of(context).textTheme.title.color,
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                child: Text(
                  agencyName,
                  maxLines: 1,
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 16.0,
                    color: Theme.of(context).textTheme.title.color,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Icon(
                    Icons.location_on,
                    color: Colors.blue[800],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                  ),
                  Text(
                    locationName,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14.0,
                      color: Colors.blue[700],
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  RoundChip(
                    color: dateTime == "TBD" ? Colors.red : Colors.indigo,
                    child: Text(
                      dateTime == "TBD" ? "Unknown time" : dateTime,
                      maxLines: 1,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                  ),
                  dateTime == "TBD"
                      ? Container()
                      : RoundChip(
                          color: status % 2 == 1 ? Colors.green : Colors.red,
                          child: Text(
                            status % 2 == 1 ? "OK" : "Fail",
                            maxLines: 1,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RoundChip extends StatelessWidget {
  RoundChip({
    this.color,
    this.child,
  });

  final Color color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
        color: color,
      ),
      child: child,
    );
  }
}
