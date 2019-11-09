import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:vastram/components/decorated_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:vastram/models/app_state.dart';

class HomeButton extends StatefulWidget {
  final String text;
  final bool whiteTheme;
  final bool icon;
  final bool leftBorder;
  final VoidCallback handler;
  final Color color;

  HomeButton({Key key, this.text, this.whiteTheme = false, this.icon = true, this.leftBorder = false, this.handler, this.color = Colors.transparent}) : super(key: key);

  @override
  _HomeButtonState createState() => _HomeButtonState();
}
class _HomeButtonState extends State<HomeButton> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ButtonViewModel>(
      converter: _ButtonViewModel.fromStore,
      builder: (BuildContext context, _ButtonViewModel vm) {
        return InkWell(
          onTap: vm.isLoading ? null : widget.handler,
          splashColor: Theme.of(context).primaryColor.withOpacity(0.5),
          child: buildButton(context)
        );
      },
    );
  }

  Widget buildButton(BuildContext context) {
    return DecoratedContainer(
      showGradient: false,
      showImage: false,
      borderTop: true,
      borderLeft: widget.leftBorder,
      padding: EdgeInsets.symmetric(vertical: 26),
      child: widget.icon != false ? Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Text(
            widget.text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              color: widget.whiteTheme ? Colors.white : Theme.of(context).primaryColor,
              fontWeight: FontWeight.w200
            ),
          ),
          Icon(Icons.chevron_right, size: 25, color: widget.whiteTheme ? Colors.white : Theme.of(context).primaryColor)
        ],
      ) : Text(
        widget.text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 18,
          color: widget.whiteTheme ? Colors.white : Theme.of(context).primaryColor,
          fontWeight: FontWeight.w200
        ),
      )
    );
  }
}

class _ButtonViewModel {
  final bool isLoading;

  _ButtonViewModel({this.isLoading});

  static _ButtonViewModel fromStore(Store<AppState> store) {
    return _ButtonViewModel(
      isLoading: store.state.isLoading
    );
  }
}