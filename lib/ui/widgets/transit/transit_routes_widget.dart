import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransitRoutesWidget extends StatelessWidget {
  final List<Map<String, dynamic>> transitRoutes;
  final formatter = DateFormat("yyyy-MM-dd HH:mm");
  TransitRoutesWidget(this.transitRoutes);
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Card(
            margin: EdgeInsets.only(top: 16.0, bottom: 16.0),
            child: Container(
                padding: EdgeInsets.all(12.0),
                child: ListView.separated(
                    itemBuilder: (BuildContext context, int index) {
                      final route = transitRoutes[index];
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
                    itemCount: transitRoutes.length))));
  }
}
