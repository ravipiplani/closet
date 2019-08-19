import 'package:closet/components/auth/home_button.dart';
import 'package:closet/components/logo.dart';
import 'package:flutter/material.dart';

class Walkthrough extends StatefulWidget {
  @override
  _WalkthroughState createState() => _WalkthroughState();
}

class _WalkthroughState extends State<Walkthrough> {
  final _controller = PageController();
  List<Map> _walkthroughPages = [
    {
      "icon": Icons.check_box,
      "title": "Take control of your Closet"
    },
    {
      "icon": Icons.add_a_photo,
      "title": "Create Outfits"
    },
    {
      "icon": Icons.style,
      "title": "Be a Style Icon"
    }
  ];
  static const _kDuration = const Duration(milliseconds: 300);
  static const _kCurve = Curves.ease;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            stops: [0, 1],
            colors: [
              const Color(0xFF21D0FD),
              const Color(0xFFEE4DB9)
            ],
          )
        ),
        child: Column(
          children: <Widget>[
            Flexible(
              child: PageView.builder(
                controller: _controller,
                itemCount: _walkthroughPages.length,
                itemBuilder: (BuildContext context, int index) {
                  return createPage(
                    context: context,
                    title: _walkthroughPages[index % _walkthroughPages.length]['title'],
                    icon: _walkthroughPages[index % _walkthroughPages.length]['icon']
                  );
                },
              ),
            ),
            Container(
              color: Colors.transparent,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(
                    child: HomeButton(
                      text: 'Back',
                      whiteTheme: true,
                      icon: false,
                      handler: () {
                        _controller.previousPage(duration: _kDuration, curve: _kCurve);
                      },
                    ),
                  ),
                  Expanded(
                    child: HomeButton(
                      text: 'Next',
                      whiteTheme: true,
                      icon: false,
                      leftBorder: true,
                      handler: () {
                        if (_controller.page == 2.0) {
                          Navigator.of(context).pushNamed('auth');
                          return;
                        }
                        _controller.nextPage(duration: _kDuration, curve: _kCurve);
                      },
                    )
                  )
                ],
              ),
            )
          ],
        )
      )
    );
  }

  Widget createPage({BuildContext context, String title, IconData icon}) {
    return Container(
      child: Column(
        children: <Widget>[
          Logo(
            position: 120,
            showLabel: false,
            smallLogo: true,
          ),
          Container(
            margin: EdgeInsets.only(top: 80),
            child: Icon(icon, size: 200, color: Colors.white54,),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            padding: EdgeInsets.symmetric(horizontal: 32),
            child: Text(
              title,
              style: Theme.of(context).textTheme.display2.copyWith(color: Colors.white),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}