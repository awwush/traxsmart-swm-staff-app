import 'package:flutter/material.dart';
import 'package:traxsmart_swm_staff_app/routes/single_employee_screen.dart';
import 'package:traxsmart_swm_staff_app/theme/app_theme.dart';
import 'package:traxsmart_swm_staff_app/routes/employee.dart';

class EmployeeScreen extends StatefulWidget {
  @override
  _EmployeeScreenState createState() => _EmployeeScreenState();
}

class _EmployeeScreenState extends State<EmployeeScreen> {
  List<Employee> employeeList = [];
  late ThemeData theme;
  // String _employeeName = "Sam Thomas";
  // String _jobRole = "Driver";
  Color _status = Colors.green;
  late CustomTheme customTheme;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
    employeeList = Employee.employeeList();
  }

  List<String> _filterList = [
    "Drivers",
    "Supervisors",
    "Zonal Inspectors",
    "Health Inspectors",
    "CEO",
  ];

  _showDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) => ChoiceDialog(
              filterList: _filterList,
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.fromLTRB(24, 38, 24, 24),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: theme.colorScheme.onBackground.withAlpha(13),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    Icons.chevron_left,
                    color: theme.colorScheme.onBackground.withAlpha(160),
                    size: 24,
                  ),
                  padding: new EdgeInsets.all(5.0),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.tune_outlined),
                tooltip: 'Filter',
                onPressed: () {
                  _showDialog();
                },
                color: customTheme.medicarePrimary,
              )
            ],
          ),
          SizedBox(
            height: 25,
          ),
          Column(
            children: _buildEmployeeList(),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildEmployeeList() {
    List<Widget> list = [];

    for (int i = 0; i < employeeList.length; i++) {
      list.add(_buildSingleEmployee(employeeList[i]));
    }
    return list;
  }

  Widget _buildSingleEmployee(Employee employee) {
    return Container(
      child: InkWell(
        onTap: () {
          Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(
              builder: (context) => SingleEmployeeScreen(employee)));
        },
        child: Container(
          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: theme.colorScheme.onBackground.withAlpha(13),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(children: [
            Container(
              width: 72,
              height: 72,
              decoration: BoxDecoration(
                color: theme.colorScheme.onBackground.withAlpha(13),
                image: DecorationImage(
                  image: AssetImage('assets/images/avatar_4.jpg'),
                ),
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            SizedBox(
              width: 16,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      RichText(
                        text: TextSpan(
                          text: employee.name,
                          style: TextStyle(
                              fontSize: 15,
                              color: theme.colorScheme.onBackground,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.8),
                        ),
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: _status,
                        ),
                        width: 6,
                        height: 6,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  RichText(
                    text: TextSpan(
                      text: employee.category,
                      style: TextStyle(
                          fontSize: 12,
                          color: theme.colorScheme.onBackground.withAlpha(150),
                          letterSpacing: 0.5),
                    ),
                  ),
                  SizedBox(height: 12),
                  Row(
                    children: [
                      FxStarRating(
                        rating: employee.ratings,
                        showInactive: true,
                        size: 15,
                        inactiveColor:
                            theme.colorScheme.onBackground.withAlpha(180),
                      ),
                      RichText(
                        text: TextSpan(
                            text: ' ' +
                                employee.ratings.toString() +
                                ' | ' +
                                employee.reviews.toString() +
                                ' Reviews',
                            style: TextStyle(
                                color: theme.colorScheme.onBackground
                                    .withAlpha(150),
                                fontSize: 12,
                                letterSpacing: 0.5)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

class ChoiceDialog extends StatefulWidget {
  final List<String> filterList;

  const ChoiceDialog({Key? key, required this.filterList}) : super(key: key);

  @override
  _ChoiceDialogState createState() => _ChoiceDialogState();
}

class _ChoiceDialogState extends State<ChoiceDialog> {
  List<String> selectedChoices = [];

  late ThemeData themeData;

  _buildChoiceList() {
    List<Widget> choices = [];
    widget.filterList.forEach((item) {
      choices.add(Container(
        padding: EdgeInsets.all(4.0),
        child: ChoiceChip(
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          selectedColor: AppTheme.customTheme.medicarePrimary,
          label: RichText(
            text: TextSpan(
              text: item,
              style: TextStyle(
                  color: selectedChoices.contains(item)
                      ? Colors.white
                      : Colors.black),
            ),
          ),
          selected: selectedChoices.contains(item),
          onSelected: (selected) {
            setState(() {
              selectedChoices.contains(item)
                  ? selectedChoices.remove(item)
                  : selectedChoices.add(item);
            });
          },
        ),
      ));
    });
    return choices;
  }

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return AlertDialog(
      title: RichText(
        text: TextSpan(
          text: "Filter Roles",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: AppTheme.customTheme.medicarePrimary,
          ),
        ),
      ),
      content: Container(
        child: Wrap(
          children: _buildChoiceList(),
        ),
      ),
      actions: <Widget>[
        TextButton(
          style: TextButton.styleFrom(
            padding: const EdgeInsets.all(16.0),
            primary: Colors.deepPurpleAccent,
            textStyle: const TextStyle(fontSize: 15),
          ),
          onPressed: () => Navigator.of(context).pop(),
          child: const Text("APPLY"),
        )
      ],
    );
  }
}

class FxStarRating extends StatelessWidget {
  final double rating, size, spacing;
  final Color activeColor, inactiveColor;

  final bool inactiveStarFilled, showInactive;

  FxStarRating(
      {this.rating = 5,
      this.size = 16,
      this.spacing = 0,
      this.activeColor = Colors.yellow,
      this.inactiveColor = Colors.black,
      this.inactiveStarFilled = false,
      this.showInactive = true});

  @override
  Widget build(BuildContext context) {
    int ratingCount = rating.floor();
    bool isHalf = (ratingCount != rating);
    List<Widget> _stars = [];
    for (int i = 0; i < 5; i++) {
      if (i < ratingCount) {
        _stars.add(Icon(
          Icons.star,
          color: activeColor,
          size: size,
        ));

        _stars.add(SizedBox(width: spacing));
      } else {
        if (isHalf) {
          isHalf = false;
          _stars.add(Icon(
            Icons.star_half_outlined,
            color: activeColor,
            size: size,
          ));
        } else if (showInactive) {
          _stars.add(Icon(
            inactiveStarFilled ? Icons.star : Icons.star_outline,
            color: inactiveColor,
            size: size,
          ));
        }
        _stars.add(SizedBox(width: spacing));
      }
    }
    return Row(mainAxisSize: MainAxisSize.min, children: _stars);
  }
}
