import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _curve;
  late Animation<double> _sizeAnimation;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    _curve =
        CurvedAnimation(parent: _animationController, curve: Curves.bounceOut);
    _sizeAnimation = Tween<double>(begin: 0, end: 200).animate(_curve);
    _colorAnimation =
        ColorTween(begin: Colors.deepPurple[700], end: Colors.red[700])
            .animate(_animationController);
    _animationController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animations"),
      ),
      body: Center(
        child: BoxAnimation(
          sizeAnimation: _sizeAnimation,
          colorAnimation: _colorAnimation,
        ),
      ),
    );
  }
}

class BoxAnimation extends StatelessWidget {
  const BoxAnimation(
      {Key? key, required this.sizeAnimation, required this.colorAnimation})
      : super(key: key);
  final Animation<double> sizeAnimation;
  final Animation<Color?> colorAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: sizeAnimation,
      builder: (context, child) {  //child is recieved if it is passed as parameter in Animated Builder
        return Container(
          height: sizeAnimation.value,
          width: sizeAnimation.value,
          color: colorAnimation.value,
        );
      },
    );
  }
}
