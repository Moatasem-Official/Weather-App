import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class InitialStateSeachWidget extends StatelessWidget {
  const InitialStateSeachWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height - 300,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              'https://img.freepik.com/free-vector/404-error-with-robot-concept-illustration_335657-2330.jpg?w=2000',
              width: 300,
              height: 300,
            ),
            const Text(
              'Welcome, Search For A City',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Text(
              'Or Use The Search Bar Above',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
