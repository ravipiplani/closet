import 'package:vastram/screens/home/home_index.dart';
import 'package:vastram/screens/home/profile.dart';
import 'package:vastram/screens/home/styles.dart';
import 'package:vastram/screens/home/whats_hot.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
    //   // statusBarColor: Colors.red,
    // ));
    final List<Widget> _children = [
      HomeIndex(),
      Styles(),
      null,
      WhatsHot(),
      Profile()
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: true,
      appBar: null,
      body: _children[_currentIndex],
      bottomNavigationBar: bottomNavigationBar,
    );
  }

  Widget get bottomNavigationBar {
    return BottomNavigationBar(
      onTap: onTabTapped,
      iconSize: 22,
      type: BottomNavigationBarType.fixed,
      currentIndex: _currentIndex,
      backgroundColor: Colors.white,
      selectedItemColor: Theme.of(context).accentColor,
      selectedIconTheme: IconThemeData(color: Theme.of(context).accentColor),
      unselectedIconTheme: IconThemeData(color: Theme.of(context).primaryColor),
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Container(height: 0,)
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.style),
          title: Container(height: 0,)
        ),
        BottomNavigationBarItem(
          icon: IconButton(icon: Icon(Icons.add_box), onPressed: _addOptions,),
          title: Container(height: 0,)
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.whatshot),
          title: Container(height: 0,)
        ),
        BottomNavigationBarItem(
          icon: Container(
            padding: EdgeInsets.all(8),
            child: Container(
              width: 22.0,
              height: 22.0,
              padding: EdgeInsets.all(0),
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
          title: Container(height: 0,)
        ),
      ],
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _addOptions() {
    showDialog<Null>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          elevation: 0,
          backgroundColor: Colors.white,
          title: Text(''),
          titlePadding: EdgeInsets.all(0),
          titleTextStyle: TextStyle(height: 0),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                child: FlatButton.icon(
                  icon: Icon(Icons.add, color: Theme.of(context).primaryColor,),
                  label: Text('Add Cloth', style: Theme.of(context).textTheme.subhead.copyWith(color: Theme.of(context).primaryColor),),
                  onPressed: () {
                    Navigator.of(context).pushNamed('new_item');
                  },
                ),
              ),
              Container(
                child: FlatButton.icon(
                  icon: Icon(Icons.mode_edit, color: Theme.of(context).primaryColor,),
                  label: Text('Create Outfit', style: Theme.of(context).textTheme.subhead.copyWith(color: Theme.of(context).primaryColor),),
                  onPressed: () {},
                ),
              ),
              Container(
                child: FlatButton.icon(
                  icon: Icon(Icons.whatshot, color: Theme.of(context).accentColor,),
                  label: Text('Post my Look', style: Theme.of(context).textTheme.subhead,),
                  onPressed: () {},
                ),
              )
            ],
          ),
          actions: null,
        );
      },
    );
  }
} 