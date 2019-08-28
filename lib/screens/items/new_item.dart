import 'package:closet/components/camera.dart';
import 'package:closet/components/customappbar.dart';
import 'package:closet/components/decorated_container.dart';
import 'package:flutter/material.dart';

class NewItem extends StatefulWidget {
  NewItem({Key key}) : super(key: key);

  _NewItemState createState() => _NewItemState();
}

class _NewItemState extends State<NewItem> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  bool showCamera;
  //Inputs
  TextEditingController nameController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController abvController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return DecoratedContainer(
      showImage: false,
      child: Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          // backgroundColor: Color(0xFF00B9FF).withOpacity(0.7),
          backgroundColor: Theme.of(context).primaryColor,
          title: Text('New Item')
        ),
        body: ListView(
          children: <Widget>[
            Camera(),
            Container(
              padding: EdgeInsets.all(32),
              child: inputsWidget(),
            )
          ],
        ),
      ),
    );
  }

  Widget inputsWidget() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 3, bottom: 4.0),
          child: TextField(
              controller: nameController,
              onChanged: (v) => nameController.text = v,
              decoration: InputDecoration(
                labelText: 'Name the beer',
              )),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 3, bottom: 4.0),
          child: TextField(
              controller: countryController,
              onChanged: (v) => countryController.text = v,
              decoration: InputDecoration(
                labelText: "Country name",
              )),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 3),
          child: TextField(
              controller: abvController,
              onChanged: (v) => abvController.text = v,
              decoration: InputDecoration(
                labelText: 'ABV',
              )),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Builder(
            builder: (context) {
              return RaisedButton(
                onPressed: () => {},
                color: Colors.lightBlue,
                child: Text('Add beer'),
              );
            },
          ),
        ),
      ],
    );
  }
}