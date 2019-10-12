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
      // leading: Container(
      //   padding: EdgeInsets.all(10),
      //   child: Image(
      //     image: AssetImage("assets/images/icon.png"),
      //     color: Theme.of(context).accentColor,
      //   )
      // ),
      leading: Container(
        padding: EdgeInsets.all(10),
        child: Container(
          width: 40.0,
          height: 40.0,
          padding: EdgeInsets.all(2),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50.0),
            child: Image(
              image: AssetImage("assets/images/icon.png"),
              color: Theme.of(context).primaryColor,
              fit: BoxFit.scaleDown,
            )
          )
        )
      ),
      title: Text('Closet', style: Theme.of(context).textTheme.title.copyWith(color: Colors.white, fontFamily: 'Diavlo', fontWeight: FontWeight.w300),),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.settings, color: Colors.white54,),
          onPressed: () {

          },
        ),
      ],
    );
  }
}