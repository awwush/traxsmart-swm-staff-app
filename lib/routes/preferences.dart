import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:traxsmart_swm_staff_app/theme/app_theme.dart';
import 'change_theme_button_widget.dart';

class Preferences extends StatefulWidget {
  Preferences({Key? key}) : super(key: key);

  @override
  PreferencesState createState() => PreferencesState();
}

class PreferencesState extends State<Preferences> {
  late ThemeData theme;
  late CustomTheme customTheme;

  bool isDark = false;
  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
          padding: EdgeInsets.fromLTRB(24, 44, 24, 0),
          children: <Widget>[
            Row(
              children: [
                IconButton(
                  alignment: Alignment.topLeft,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(
                    FeatherIcons.chevronLeft,
                    color: theme.colorScheme.onBackground.withAlpha(250),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Text("Dark Mode",
                      style: TextStyle(
                        fontSize: 13,
                      )),
                ),
                ChangeThemeButtonWidget(),
              ],
            ),
          ]),
    );
  }
}
