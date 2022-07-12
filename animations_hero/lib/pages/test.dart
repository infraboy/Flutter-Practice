import 'package:flutter/material.dart';

class Test extends StatelessWidget {
  const Test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Hero(
        tag: "cont",
        child: Container(
          height: 200,
          width: 200,
          color: Colors.red,
          child: GestureDetector(
            onTap: () => Navigator.of(context).pop(),
          ),
        ),
      ),
    );
  }
}
