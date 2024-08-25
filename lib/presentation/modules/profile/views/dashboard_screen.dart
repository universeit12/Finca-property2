import 'package:flutter/material.dart';
import 'package:universe_it_project/widgets/back_app_bar.dart';

class DeshboardScreen extends StatelessWidget {
  const DeshboardScreen({super.key});
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: Backappbar(
        title: 'Dashboard',
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
        child: ListView.builder(
            itemCount: 4,
            itemBuilder: (_, index) {
              return Container(
                height: 100,
                width: double.infinity,
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                    border: Border.all(width: 0.1),
                    borderRadius: BorderRadius.circular(8.0)),
                child: Center(
                  child: Text(
                    'Item $index',
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
