
import 'package:brofinance/mixins/navigatable.dart';
import 'package:brofinance/ui/views/landing_view.dart';
import 'package:flutter/material.dart';

class Coin extends StatefulWidget {

  //MARK: init

  const Coin({Key? key, required this.radius}) : super(key: key);

  //MARK: properties

  final double radius;

  @override
  _CoinState createState() => _CoinState();
}

class _CoinState extends State<Coin> with SingleTickerProviderStateMixin, Navigatable {

  AnimationController? _controller;

  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 5));
    _controller?.repeat();
    super.initState();
  }

  @override
  void dispose() {
    _controller?.dispose();
    _controller = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        pushRoute(context, LandingView());
      },
      child: Container(
        color: Colors.transparent,
        height: widget.radius,
        width: widget.radius,
        child: RotationTransition(
          turns: Tween(begin: 0.0, end: 1.0).animate(_controller!),
          child: Image.asset("assets/images/logo.png"),
        ),
      ),
    );
  }
}
