import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransitRoutesWidget extends StatelessWidget {
  final Future<List<Map<String, dynamic>>> transitRoutes;
  final formatter = DateFormat("yyyy-MM-dd HH:mm");
  TransitRoutesWidget(this.transitRoutes);
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Card(
            margin:
                EdgeInsets.only(top: 32.0, bottom: 32.0, left: 8.0, right: 8.0),
            child: Container(
                padding: EdgeInsets.all(16.0),
                child: FutureBuilder(
                  future: transitRoutes,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      if (snapshot.hasError) {
                        // error info
                      }
                      return ListView.separated(
                          itemBuilder: (BuildContext context, int index) {
                            final route = snapshot.data[index];
                            return ListTile(
                              leading: route['transitType'],
                              title: Text('${route['from']} → ${route['to']}'),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(route['depart']),
                                  Text(route['arrive'])
                                ],
                              ),
                              trailing: Icon(Icons.more_vert),
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) =>
                              const Divider(),
                          itemCount: snapshot.data.length);
                    } else {
                      return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('Loading ...　'),
                            CircularProgressIndicator()
                          ]);
                    }
                  },
                ))));
  }
}
