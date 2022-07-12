import 'package:animations_hero/pages/test.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Animations")),
      body: Center(
        child: Hero(
          tag: "cont",
          child: Container(
            height: 100,
            width: 100,
            color: Colors.red,
            child: GestureDetector(
              onTap: () => Navigator.of(context).push(PageRouteBuilder(
                reverseTransitionDuration: Duration(seconds: 3),
                transitionDuration: Duration(seconds: 3),
                pageBuilder: (context, animation, secondaryAnimation) => Test(),
              )),
            ),
          ),
        ),
      ),
    );
  }
}
