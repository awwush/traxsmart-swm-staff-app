import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:traxsmart_swm_staff_app/theme/app_theme.dart';


class ChoiceChipScreen extends StatefulWidget {
  @override
  _ChoiceChipScreenState createState() => _ChoiceChipScreenState();
}

class _ChoiceChipScreenState extends State<ChoiceChipScreen> {
  List<String> _filterList = [
    "Drivers",
    "Supervisors",
    "Zonal Inspectors",
    "Health Inspectors",
    "CEO",
  ];

  late ThemeData theme;
  late CustomTheme customTheme;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: TextButton(
              onPressed: () {
                _showDialog();
              },
              child: RichText(
                text: TextSpan(
                  text: "Filter".toUpperCase(),
                  style: TextStyle(
                      color: customTheme.medicarePrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),

        ),
    ),
        ),
    );
  }

  _showDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) => ChoiceDialog(
          filterList: _filterList,
        ));
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
    }
    );
    return choices;
  }

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return AlertDialog(
      title: RichText(
          text: TextSpan(
          text: "Filter Modules",
          style: TextStyle(
           fontWeight: FontWeight.bold,
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
            child: const Text("FILTER"),

        )
      ],
    );
  }
}
