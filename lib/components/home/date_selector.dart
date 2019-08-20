import 'package:closet/components/decorated_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DateSelector extends StatefulWidget {
  DateSelector({Key key}) : super(key: key);

  _DateSelectorState createState() => _DateSelectorState();
}

class _DateSelectorState extends State<DateSelector> {
  @override
  Widget build(BuildContext context) {
    return DecoratedContainer(
      padding: EdgeInsets.symmetric(vertical: 24, horizontal: 24),
      borderBottom: true,
      showGradient: false,
      showImage: false,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Icon(Icons.keyboard_arrow_left, size: 40, color: Colors.white60,),
          Expanded(
            child: Column(
              children: <Widget>[
                Text('August 17',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.display2.copyWith(color: Colors.white, fontWeight: FontWeight.w200)
                ),
                Container(
                  margin: EdgeInsets.only(top: 8),
                  child: Text('SATURDAY',
                    style: Theme.of(context).textTheme.body1.copyWith(color: Colors.white54)
                  ),
                )
              ],
            )
          ),
          Icon(Icons.keyboard_arrow_right, size: 40, color: Colors.white60,)
        ],
      ),
    );
  }
}