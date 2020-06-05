import 'package:flutter/material.dart';

class CircularProgress extends StatefulWidget {
  @override
  _CircularProgressState createState() => _CircularProgressState();
}

class _CircularProgressState extends State<CircularProgress> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.transparent,
        height: double.infinity,
        width: double.infinity,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
