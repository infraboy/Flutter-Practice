import 'package:flutter/material.dart';

class StagerredAnimation extends StatelessWidget {
  StagerredAnimation({Key? key, required this.animationController})
      : widthTweenAnimation =
            Tween<double>(begin: 0, end: 200).animate(CurvedAnimation(
          //here curved animation is used to provide interval upto which this particular animation will stay active
          parent: animationController,
          curve: Interval(0, 0.5),
        )),
        heightTweenAnimation =
            Tween<double>(begin: 50, end: 200).animate(CurvedAnimation(
          parent: animationController,
          curve: Interval(0.5, 1),
        )),
        super(key: key);

  final AnimationController animationController;
  final Animation<double> widthTweenAnimation;
  final Animation<double> heightTweenAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (context, __) {
        return Container(
          color: Colors.red,
          height: heightTweenAnimation.value,
          width: widthTweenAnimation.value,
        );
      },
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    _animationController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: StagerredAnimation(
          animationController: _animationController,
        ),
      ),
    );
  }
}
