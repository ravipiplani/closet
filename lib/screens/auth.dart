import 'package:closet/components/home_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Auth extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          // gradient: LinearGradient(
          //   begin: Alignment.topRight,
          //   end: Alignment.bottomLeft,
          //   stops: [0, 1],
          //   colors: [
          //     const Color(0xFF21D0FD).withOpacity(0.2),
          //     const Color(0xFFEE4DB9).withOpacity(0.2)
          //   ],
          // ),
          image: DecorationImage(
            image: AssetImage("assets/images/bg.png"),
            fit: BoxFit.cover,
            colorFilter: new ColorFilter.mode(Colors.white.withOpacity(0.8), BlendMode.dstATop)
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 100,
                    margin: EdgeInsets.only(top: 160),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/icon.png"),
                        fit: BoxFit.fill
                      )
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Text(
                      'Closet',
                      style: TextStyle(
                        color: Color(0xff1e3b65).withOpacity(0.8),
                        // color: Colors.white70,
                        fontSize: 40,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Diavlo'
                      ),
                    )
                  ),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        HomeButton('LOG IN'),
                        HomeButton('NEW ACCOUNT')   
                      ],
                    )
                  )
                ],
              )
            )
          ]
        )
      )
    );
  }
}