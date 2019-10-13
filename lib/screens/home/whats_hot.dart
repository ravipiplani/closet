import 'package:vastram/components/decorated_container.dart';
import 'package:flutter/material.dart';

class WhatsHot extends StatefulWidget {
  WhatsHot({Key key}) : super(key: key);

  _WhatsHotState createState() => _WhatsHotState();
}

class _WhatsHotState extends State<WhatsHot> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        titleSpacing: 0,
        title: TextField(
          decoration: InputDecoration(
            labelText: "Search",
            hintText: "Search",
            hasFloatingPlaceholder: false,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            prefixIcon: Icon(Icons.search, color: Theme.of(context).primaryColor),
            border: InputBorder.none,
            contentPadding: EdgeInsets.all(17)
          ),
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: 18,
          ),
          autocorrect: false,
        ),
        backgroundColor: Colors.white,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.photo_camera, color: Theme.of(context).primaryColor),
            onPressed: null,
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          )
        ],
      ),
      body: DecoratedContainer(
        showImage: false,
        padding: EdgeInsets.all(30),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: 6,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                    width: 16
                  )
                ),
                child: Image(
                  fit: BoxFit.fill,
                  image: AssetImage('assets/images/closeup.jpg'),
                ),
              )
            ),
            Expanded(
              flex: 2,
              child: Container(
                padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Chip(
                      label: Text('club'),
                      backgroundColor: Theme.of(context).accentColor.withOpacity(0.4),
                    ),
                    Text('Jan 13th, 2017', style: Theme.of(context).textTheme.display2.copyWith(fontFamily: 'IndieFlower')),
                  ],
                )
              )
            ),
            Expanded(
              flex: 2,
              child: Container(
                padding: EdgeInsets.all(32),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    FloatingActionButton(
                      child: Icon(Icons.thumb_up, color: Theme.of(context).primaryColor),
                      backgroundColor: Colors.white,
                      elevation: 3,
                      onPressed: null
                    ),
                    FloatingActionButton(
                      child: Icon(Icons.thumb_down, color: Theme.of(context).primaryColor),
                      backgroundColor: Colors.white,
                      elevation: 3,
                      onPressed: null,
                    )
                  ],
                ),
              )
            )
          ],
        ),
      )
    );
  }
}