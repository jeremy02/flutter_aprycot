import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        // color: Color(0xFFFFF8ED),
        color: Color(0xFFFFF8ED),
      ),
      child: Row(
        children: [
          Flexible(
            flex: 40,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.red,
            ),
          ),
          const SizedBox(width: 10),
          Flexible(
            flex: 60,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              // color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
