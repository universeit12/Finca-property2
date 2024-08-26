import 'package:flutter/material.dart';
import 'package:universe_it_project/presentation/modules/profile/widgets/dashboard_container.dart';
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
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 5, vertical: 15.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(width: 0.2)),
                    child: Wrap(
                      children: [
                        DashboardContainer(
                            text: 'Total Property',
                            number: '452',
                            color: Colors.blueAccent),
                        DashboardContainer(
                            text: 'Accepted Property',
                            number: '75',
                            color: Colors.amber),
                        DashboardContainer(
                            text: 'Pending Property',
                            number: '2',
                            color: Colors.greenAccent),
                        DashboardContainer(
                            text: 'Total Visitors',
                            number: '745',
                            color: Colors.blueGrey),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
