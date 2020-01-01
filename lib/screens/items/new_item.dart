import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:strings/strings.dart';
import 'package:vastram/components/auth/home_button.dart';
import 'package:vastram/components/camera.dart';
import 'package:vastram/components/decorated_container.dart';
import 'package:flutter/material.dart';
import 'package:vastram/models/color.dart' as vastram;
import 'package:vastram/utils/constants.dart';

class NewItem extends StatefulWidget {
  NewItem({Key key}) : super(key: key);

  _NewItemState createState() => _NewItemState();
}

class _NewItemState extends State<NewItem> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  bool _showCamera;
  String _imagePath;
  vastram.Color _selectedColor;
  String _selectedSeason;
  int _selectedCategoryIndex;

  List<vastram.Color> _colors;
  List<String> _seasons;

  List<Map> _categories = ITEM_CATEGORIES;

  @override
  void initState() {
    super.initState();
    setState(() {
      _showCamera = true;
      _imagePath = "";
      _selectedColor = null;
      _selectedSeason = null;
      _selectedCategoryIndex = 0;
    });
    _getColors().then((data) {
      setState(() {
        _colors = data;
      });
    });
    _getSeasons().then((data) {
      setState(() {
        _seasons = data;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        // backgroundColor: Color(0xFF00B9FF).withOpacity(0.7),
        backgroundColor: Theme.of(context).primaryColor,
        title: Text('New Item')
      ),
      body: _showCamera ? Camera(callback: pictureClicked) : DecoratedContainer(
        showImage: false,
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 32),
                    child: inputsWidget(),
                  )
                ],
              ),
            ),
            Visibility(
              visible: false,
              child: HomeButton(
                icon: true,
                text: 'Add',
                handler: () {
                  Navigator.of(context).pop();
                }
              ),
            )
          ],
        ),
      )
    );
  }

  Widget inputsWidget() {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List<Widget>.generate(_categories.length, (int index) {
              return _categoryBadge(index);
            }),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 40),
          child: DropdownButton<vastram.Color>(
            isExpanded: true,
            onChanged: (vastram.Color newValue) {
              setState(() {
                _selectedColor = newValue;
              });
            },
            value: _selectedColor,
            hint: Container(
              padding: EdgeInsets.only(bottom: 20),
              child: Text("Select Color", style: TextStyle(color: Theme.of(context).primaryColor))
            ),
            icon: Container(
              padding: EdgeInsets.only(bottom: 20),
              child: Icon(Icons.arrow_drop_down, color: Theme.of(context).primaryColor)
            ),
            iconSize: 24,
            underline: Container(
              height: 1,
              color: Theme.of(context).primaryColor,
            ),
            items: _colors != null ? _colors.map<DropdownMenuItem<vastram.Color>>((vastram.Color color) {
              return DropdownMenuItem<vastram.Color>(
                value: color,
                child: Container(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          color: Color(int.parse('FF' + color.value, radix: 16)),
                          borderRadius: BorderRadius.circular(50.0)
                        ),
                        margin: EdgeInsets.only(right: 10),
                      ),
                      Text(color.name, style: TextStyle(color: Color(int.parse('FF' + color.value, radix: 16))))
                    ],
                  )
                )
              );
            }).toList() : null,
          ),
        ),
        Container(
          child: DropdownButton<String>(
            isExpanded: true,
            onChanged: (String newValue) {
              setState(() {
                _selectedSeason = newValue;
              });
            },
            value: _selectedSeason,
            hint: Container(
              padding: EdgeInsets.only(bottom: 20),
              child: Text("Select Season", style: TextStyle(color: Theme.of(context).primaryColor))
            ),
            icon: Container(
              padding: EdgeInsets.only(bottom: 20),
              child: Icon(Icons.arrow_drop_down, color: Theme.of(context).primaryColor)
            ),
            iconSize: 24,
            underline: Container(
              height: 1,
              color: Theme.of(context).primaryColor,
            ),
            items: _seasons != null ? _seasons.map<DropdownMenuItem<String>>((String season) {
              return DropdownMenuItem<String>(
                value: season,
                child: Container(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Text(season)
                )
              );
            }).toList() : null,
          ),
        )
      ],
    );
  }

  Future<List<vastram.Color>> _getColors() async {
    List<vastram.Color> colors;
    QuerySnapshot snapshot = await Firestore.instance.collection('colors').getDocuments();
    colors = snapshot.documents.map((documentSnapshot) {
      return vastram.Color.fromJson(documentSnapshot.data);
    }).toList();
    return colors;
  }

  Future<List<String>> _getSeasons() async {
    List<String> seasons;
    QuerySnapshot snapshot = await Firestore.instance.collection('seasons').getDocuments();
    seasons = snapshot.documents.map((documentSnapshot) {
      return camelize(documentSnapshot.data['name'].toString());
    }).toList();
    return seasons;
  }

  Widget _categoryBadge (index) {
    return Container(
      margin: EdgeInsets.only(bottom: 0, top: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: InkWell(
        child: Container(
          child: Image(
            image: AssetImage("assets/images/" + _categories[index]['image']),
            height: 40,
            color: _selectedCategoryIndex == index ? Theme.of(context).accentColor : Colors.grey.shade500
          ),
          decoration: BoxDecoration(
            color: _selectedCategoryIndex == index ? Theme.of(context).accentColor.withOpacity(0.2) : Colors.white,
            border: Border.all(width: 1, color: _selectedCategoryIndex == index ? Theme.of(context).accentColor.withOpacity(0.4) : Colors.grey.shade400),
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
        onTap: () {
          setState(() {
            _selectedCategoryIndex = index;
          });
        },
      )
    );
  }

  void pictureClicked({String imagePath}) {
    setState(() {
      _showCamera = false;
      _imagePath = imagePath;
    });
  }
}