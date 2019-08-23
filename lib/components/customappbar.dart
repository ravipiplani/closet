import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  CustomAppBar({Key key}) : preferredSize = Size.fromHeight(kToolbarHeight), super(key: key);

  @override
  final Size preferredSize;

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build (BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xFF00B9FF).withOpacity(0.7),
      // backgroundColor: Colors.white,
      centerTitle: true,
      leading: Container(
        padding: EdgeInsets.all(10),
        child: Image(
          image: AssetImage("assets/images/icon.png"),
        )
      ),
      title: Container(
        padding: EdgeInsets.all(10),
        child: Container(
          width: 40.0,
          height: 40.0,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage("assets/images/icon.png")
              )
          )
        )
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.settings, color: Theme.of(context).primaryColor,),
          onPressed: () {

          },
        ),
      ],
    );
  }
}