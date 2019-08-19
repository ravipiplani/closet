import 'package:flutter/material.dart';

class Master extends StatelessWidget {
  final Widget child;
  final bool showGradient;

  Master({this.child, this.showGradient = true});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: true,
      body: Container(
        decoration: BoxDecoration(
          gradient: showGradient ? LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            stops: [0, 1],
            colors: [
              const Color(0xFF21D0FD).withOpacity(0.6),
              const Color(0xFFEE4DB9).withOpacity(0.6)
            ],
          ) : null,
          image: DecorationImage(
            image: AssetImage("assets/images/bg.png"),
            fit: BoxFit.cover,
            // colorFilter: new ColorFilter.mode(Colors.white.withOpacity(0.8), BlendMode.dstATop)
          ),
        ),
        child: this.child
      )
    );
  }
}