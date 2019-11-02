import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:vastram/actions/auth_actions.dart';
import 'package:vastram/components/auth/home_button.dart';
import 'package:vastram/components/decorated_container.dart';
import 'package:vastram/models/app_state.dart';

class Profile extends StatefulWidget {
  Profile({Key key}) : super(key: key);

  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DecoratedContainer(
        showImage: false,
        child: StoreConnector<AppState, VoidCallback>(
          converter: (store) {
            return () => store.dispatch(LogOut());
          },
          builder: (context, callback) => HomeButton(
            text: 'Log Out',
            whiteTheme: false,
            handler: callback,
          ),
        ),
      )
    );
  }
}