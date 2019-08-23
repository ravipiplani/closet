import 'package:closet/components/camera.dart';
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
        body: Camera(),
      ),
    );
  }
}