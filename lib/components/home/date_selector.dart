import 'package:closet/components/decorated_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart' show CalendarCarousel;

class DateSelector extends StatefulWidget {
  DateSelector({Key key}) : super(key: key);

  _DateSelectorState createState() => _DateSelectorState();
}

class _DateSelectorState extends State<DateSelector> {
  DateTime _currentDate;
  bool _showCalendar;

  @override
  void initState() {
    super.initState();
    this._currentDate = DateTime.now();
    this._showCalendar = false;
  }

  CalendarCarousel _calendarCarousel;

  @override
  Widget build(BuildContext context) {
    _calendarCarousel = CalendarCarousel(
      height: 280,
      showHeader: false,
      daysHaveCircularBorder: false,
      dayPadding: 0,
      todayButtonColor: Colors.transparent,
      todayBorderColor: Colors.transparent,
      daysTextStyle: TextStyle(color: Colors.white),
      weekdayTextStyle: TextStyle(color: Colors.white),
      weekendTextStyle: TextStyle(color: Colors.white),
      inactiveDaysTextStyle: TextStyle(color: Colors.white54),
      inactiveWeekendTextStyle: TextStyle(color: Colors.white54),
      prevDaysTextStyle: TextStyle(color: Colors.white54),
      nextDaysTextStyle: TextStyle(color: Colors.white54),
      selectedDateTime: _currentDate,
      onDayPressed: (DateTime date, List a) {
        this.setState(() {
          _currentDate = date;
          _showCalendar = false;
        });
      },
      selectedDayBorderColor: Colors.white,
      selectedDayButtonColor: Colors.transparent,
    );

    return DecoratedContainer(
      padding: EdgeInsets.symmetric(vertical: 24, horizontal: 24),
      borderBottom: true,
      showGradient: false,
      showImage: false,
      child: Column(
        children: <Widget>[
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.keyboard_arrow_left, size: 40, color: Colors.white60,),
                iconSize: 40,
                onPressed: _previousDate,
              ),
              Expanded(
                child: InkWell(
                  onTap: _openCalendar,
                  child: Column(
                    children: <Widget>[
                      Text(DateFormat.yMMMd().format(this._currentDate),
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.display2.copyWith(color: Colors.white, fontWeight: FontWeight.w200)
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 8),
                        child: Text(DateFormat.EEEE().format(this._currentDate).toUpperCase(),
                          style: Theme.of(context).textTheme.body1.copyWith(color: Colors.white54)
                        ),
                      )
                    ],
                  )
                )
              ),
              IconButton(
                icon: Icon(Icons.keyboard_arrow_right, size: 40, color: Colors.white60,),
                iconSize: 40,
                onPressed: _nextDate,
              )
            ],
          ),
          Visibility(
            visible: _showCalendar,
            maintainState: true,
            child: Container(
              margin: EdgeInsets.only(top: 24),
              child: _calendarCarousel,
            ),
          )
        ],
      ),
    );
  }

  void _openCalendar() {
    setState(() {
      _showCalendar = true;
    });
  }

  void _nextDate() {
    setState(() {
      _currentDate = _currentDate.add(Duration(days: 1));
    });
  }

  void _previousDate() {
    setState(() {
      _currentDate = _currentDate.subtract(Duration(days: 1));
    });
  }
}