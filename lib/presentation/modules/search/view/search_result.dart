import 'package:flutter/material.dart';

import '../../../../utils/Properties.dart';

class ResultsPage extends StatelessWidget {
  final String location;

  ResultsPage({required this.location});

  @override
  Widget build(BuildContext context) {
    final filteredProperties =
        properties.where((p) => p.location == location).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Results'),
      ),
      body: ListView.builder(
        itemCount: filteredProperties.length,
        itemBuilder: (context, index) {
          final property = filteredProperties[index];
          return ListTile(
            title: Text(property.title),
            subtitle: Text(property.rent),
            leading: Image.asset(property.image),
            onTap: () {
              // Handle item tap
            },
          );
        },
      ),
    );
  }
}
