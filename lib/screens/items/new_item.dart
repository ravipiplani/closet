import 'package:vastram/components/auth/home_button.dart';
import 'package:vastram/components/camera.dart';
import 'package:vastram/components/decorated_container.dart';
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
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        // backgroundColor: Color(0xFF00B9FF).withOpacity(0.7),
        backgroundColor: Theme.of(context).primaryColor,
        title: Text('New Item')
      ),
      body: DecoratedContainer(
        showImage: false,
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView(
                children: <Widget>[
                  Camera(),
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
        Padding(
          padding: const EdgeInsets.only(left: 3, bottom: 4.0),
          child: TextField(
            controller: nameController,
            onChanged: (v) => nameController.text = v,
            decoration: InputDecoration(
              labelText: 'Color',
            )
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 3, bottom: 4.0),
          child: TextField(
            controller: countryController,
            onChanged: (v) => countryController.text = v,
            decoration: InputDecoration(
              labelText: "Type",
            )
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 3),
          child: TextField(
            controller: abvController,
            onChanged: (v) => abvController.text = v,
            decoration: InputDecoration(
              labelText: 'Season',
            )
          ),
        )
      ],
    );
  }
}