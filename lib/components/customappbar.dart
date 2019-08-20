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
                  image: NetworkImage(
                      "https://scontent.fdel1-2.fna.fbcdn.net/v/t1.0-9/44948711_1889594157791030_4634322003610828800_o.jpg?_nc_cat=107&_nc_oc=AQmFoMHisU1XCe4Q2XV-itnctog9jATYMOvModuUhUi69J-z1zojQaG0t_EOQd9gjkE&_nc_ht=scontent.fdel1-2.fna&oh=534fd3c1f560f0636f804dcf6642cf9b&oe=5DCF08C9")
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