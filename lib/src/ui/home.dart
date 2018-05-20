import 'package:flutter/material.dart';

import '../launch_library.dart';
import 'launch_card.dart';

class HomeScreen extends StatelessWidget {
  final LaunchLibrary launchLibrary = LaunchLibrary();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Text("Launches".toUpperCase()),
        centerTitle: true,
        textTheme: Theme.of(context).textTheme.copyWith(
              title: Theme.of(context).textTheme.title.copyWith(
                    color: Colors.black,
                    fontSize: 30.0,
                    letterSpacing: 2.5,
                  ),
            ),
      ),
      body: Container(
        child: FutureBuilder(
          future: launchLibrary.getNextLaunches(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState != ConnectionState.done &&
                !snapshot.hasError)
              return Center(child: RefreshProgressIndicator());
            if (snapshot.hasError)
              return Center(
                child: Text("Error"),
              );
            return RefreshIndicator(
              onRefresh: () async => print("todo"),
              child: ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return LaunchCard(
                    launchName: snapshot.data[index].launchName,
                    agencyName: snapshot.data[index].agencyName,
                    locationName: snapshot.data[index].locationName,
                    dateTime: snapshot.data[index].dateTime.toString(),
                    status: snapshot.data[index].status,
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
