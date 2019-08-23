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
      // backgroundColor: Color(0xFF00B9FF).withOpacity(0.7),
      backgroundColor: Theme.of(context).primaryColor,
      centerTitle: true,
      leading: Container(
        padding: EdgeInsets.all(10),
        child: Image(
          image: AssetImage("assets/images/icon.png"),
          color: Colors.white,
        )
      ),
      title: Container(
        padding: EdgeInsets.all(10),
        child: Container(
          width: 40.0,
          height: 40.0,
          // padding: EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            shape: BoxShape.circle,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Image(
              image: AssetImage("assets/images/closeup.jpg"),
              fit: BoxFit.scaleDown,
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