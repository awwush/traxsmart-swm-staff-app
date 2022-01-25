import 'dart:math';
import 'dart:ui';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:flutter/cupertino.dart';
import 'package:traxsmart_swm_staff_app/theme/app_theme.dart';
import 'package:traxsmart_swm_staff_app/theme/custom_theme.dart';
import 'package:flutter_swipe_button/flutter_swipe_button.dart';

class AttendanceRoute extends StatefulWidget {
  AttendanceRoute({Key? key}) : super(key: key);

  @override
  AttendanceRouteState createState() => AttendanceRouteState();
}

class AttendanceRouteState extends State<AttendanceRoute> {
  late List<DateTime> _blackoutDates;
  late ThemeData theme;
  late CustomTheme customTheme;

  List<DateTime> _getBlackoutDates() {
    final List<DateTime> dates = <DateTime>[];
    final DateTime startDate =
        DateTime.now().subtract(const Duration(days: 500));
    final DateTime endDate = DateTime.now().add(const Duration(days: 500));
    final Random random = Random();
    for (DateTime date = startDate;
        date.isBefore(endDate);
        date = date.add(Duration(days: random.nextInt(25)))) {
      dates.add(date);
    }

    return dates;
  }

  @override
  void initState() {
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
    _blackoutDates = _getBlackoutDates();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final Widget cardView = Card(
      elevation: 10,
      child: Container(
        padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
        child: Theme(data: Theme.of(context), child: _getBlackoutDatePicker()),
      ),
    );
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.fromLTRB(24, 50, 24, 24),
        children: [
          Container(
            height: 320,
            child: cardView,
          ),
          SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                child: SwipeButton.expand(
                    elevation: 15,
                    width: 150,
                    height: 50,
                    thumb: Icon(
                      Icons.double_arrow_rounded,
                      color: Colors.white,
                    ),
                    child: Text(
                      "Present",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    activeThumbColor: customTheme.medicarePrimary,
                    activeTrackColor: Colors.grey.shade400,
                    onSwipe: () {
                      _startTimer();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("I am Present"),
                          backgroundColor: customTheme.medicarePrimary,
                        ),
                      );
                    }),
              ),
              Container(
                child: timer(),
              ),
            ],
          ),
          SizedBox(
            height: 40,
          ),
          Center(
              child: Column(children: [
            _eventCard(title: 'Sunday', date: '23'),
            SizedBox(
              height: 4,
            ),
            _eventCard(title: 'Republic Day', date: '26'),
            SizedBox(
              height: 4,
            ),
            _eventCard(title: 'Sunday', date: '30'),
            SizedBox(
              height: 4,
            ),
          ])),
        ],
      ),
    );
  }

  SfDateRangePicker _getBlackoutDatePicker() {
    return SfDateRangePicker(
        view: DateRangePickerView.month,
        selectionColor: customTheme.medicarePrimary,
        monthCellStyle: DateRangePickerMonthCellStyle(
          blackoutDateTextStyle: TextStyle(
            color: Colors.red,
            decoration: TextDecoration.lineThrough,
          ),
          todayTextStyle: TextStyle(
            color: customTheme.medicarePrimary,
            fontWeight: FontWeight.w400,
          ),
          todayCellDecoration: BoxDecoration(
              border: Border.all(
                color: customTheme.medicarePrimary,
                width: 1,
              ),
              shape: BoxShape.circle),
        ),
        monthViewSettings: DateRangePickerMonthViewSettings(
            showTrailingAndLeadingDates: true, blackoutDates: _blackoutDates),
        showNavigationArrow: false);
  }

  int _counter = 0;
  Timer? _timer = null;
  int time = 0;
  int hours = 00;
  int mins = 00;
  int secs = 00;

  Widget timer() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          (_counter <= 0)
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: 25,
                      height: 30,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 2,
                          color: customTheme.medicarePrimary,
                        ),
                        borderRadius: BorderRadius.circular(5.5),
                      ),
                      child: Text(
                        '0',
                        style: TextStyle(
                          color: Colors.grey.shade500,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 2,
                    ),
                    Text(
                      ':',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: customTheme.medicarePrimary,
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(
                      width: 2,
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: 25,
                      height: 30,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 2,
                          color: customTheme.medicarePrimary,
                        ),
                        borderRadius: BorderRadius.circular(5.5),
                      ),
                      child: Text(
                        '0',
                        style: TextStyle(
                          color: Colors.grey.shade500,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 2,
                    ),
                    Text(
                      ':',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: customTheme.medicarePrimary,
                      ),
                    ),
                    SizedBox(
                      width: 2,
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: 25,
                      height: 30,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 2,
                          color: customTheme.medicarePrimary,
                        ),
                        borderRadius: BorderRadius.circular(5.5),
                      ),
                      child: Text(
                        '0',
                        style: TextStyle(
                          color: Colors.grey.shade500,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "On Duty!",
                      style: TextStyle(
                        color: customTheme.medicarePrimary,
                        fontWeight: FontWeight.bold,
                        fontSize: 10,
                      ),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          width: 25,
                          height: 30,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 2,
                              color: customTheme.medicarePrimary,
                            ),
                            borderRadius: BorderRadius.circular(5.5),
                          ),
                          child: Text(
                            '$hours',
                            style: TextStyle(
                              color: Colors.grey.shade500,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Text(
                          ':',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: customTheme.medicarePrimary,
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: 25,
                          height: 30,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 2,
                              color: customTheme.medicarePrimary,
                            ),
                            borderRadius: BorderRadius.circular(5.5),
                          ),
                          child: Text(
                            '$mins',
                            style: TextStyle(
                              color: Colors.grey.shade500,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Text(
                          ':',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: customTheme.medicarePrimary,
                          ),
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: 25,
                          height: 30,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 2,
                              color: customTheme.medicarePrimary,
                            ),
                            borderRadius: BorderRadius.circular(5.5),
                          ),
                          child: Text(
                            '$secs',
                            style: TextStyle(
                              color: Colors.grey.shade500,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
        ],
      ),
    );
  }

  void _startTimer() {
    if (_timer != null) {
      _timer?.cancel();
    }

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_counter >= 0) {
          time = _counter;
          hours = (time ~/ 3600);
          time = time % 3600;
          mins = (time ~/ 60);
          time = time % 60;
          secs = time;
          _counter++;
          print('$hours : $mins : $secs');
        } else {
          _timer?.cancel();
        }
      });
    });
  }

  Widget _eventCard({String? date, String? title}) {
    return Card(
      elevation: 10,
      child: SizedBox(
        width: 500,
        height: 50,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(children: [
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                color: customTheme.medicarePrimary,
                borderRadius: BorderRadius.circular(3),
              ),
              child: Center(
                child: RichText(
                  text: TextSpan(
                      text: date,
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      )),
                ),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              title!,
              style: TextStyle(
                fontSize: 15,
                color: customTheme.medicarePrimary,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.5,
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
