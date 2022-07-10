import 'dart:ffi';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  //tickermixin is always required for animation
  late AnimationController _animationController;
  late Animation<double> _curve;
  late Animation<double> _animation;

  @override
  void initState() {
    _animationController = AnimationController(
        //to control the animation i.e. to start stop reverse etc
        vsync: this,
        duration: Duration(seconds: 3));
    _animation = Tween<double>(begin: 0.0, end: 200.0)
        .animate(_animationController) //to specify what to animate
      ..addListener(() {
        //listener is executed everytime the animation value changes
        //necessary to use listener with setstate to update the changes
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _animationController.reverse();
        }
        if (status == AnimationStatus.dismissed) {
          _animationController.forward();
        }
      });
    _animationController.forward(); //starts the animation
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animations"),
      ),
      body: Center(
        child: Container(
          height: _animation.value, //value is taken from animation object
          width: _animation.value,
          color: Colors.green,
        ),
      ),
    );
  }
}
