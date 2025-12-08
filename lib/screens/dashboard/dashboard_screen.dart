import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xFFFFf5EE),
      ),
      child: Padding(
          padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
          child: Row(
            children: [
              Flexible(
                flex: 63,
                child: Container(
                  color: Colors.blue,
                  child: Center(child: Text('63%')),
                ),
              ),
              Flexible(
                flex: 37,
                child: Container(
                  color: Colors.green,
                  child: Center(child: Text('37%')),
                ),
              ),
            ],
          )
      ),
    );
  }
}
