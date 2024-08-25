import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class PracticePage extends StatelessWidget {
  const PracticePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 56, left: 24, right: 24, bottom: 24),
          child: Column(
            children: [
              TextFormField(
                validator: (value) => 'ERROR',
                decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.mobile), labelText: 'enter email'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
