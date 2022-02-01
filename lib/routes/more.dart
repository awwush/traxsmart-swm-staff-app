import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:traxsmart_swm_staff_app/routes/preferences.dart';
import 'package:traxsmart_swm_staff_app/theme/app_theme.dart';

class MoreRoute extends StatefulWidget {
  MoreRoute({Key? key}) : super(key: key);

  @override
  MoreRouteState createState() => MoreRouteState();
}

class MoreRouteState extends State<MoreRoute> {
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
      body: ListView(
        padding: EdgeInsets.fromLTRB(24, 44, 24, 0),
        children: [
          SizedBox(
            height: 8,
          ),
          GestureDetector(
              child: _buildSettingsList(
                title: 'Preferences',
                icon: FeatherIcons.settings,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Preferences()),
                );
              }),
          SizedBox(height: 8),
          Divider(),
          SizedBox(height: 8),
          _buildSettingsList(
            title: 'Change Language',
            icon: FeatherIcons.globe,
          ),
          SizedBox(
            height: 8,
          ),
          Divider(),
          SizedBox(
            height: 8,
          ),
          _buildSettingsList(
              title: 'Privacy Policy', icon: FeatherIcons.shield),
          SizedBox(
            height: 8,
          ),
          Divider(),
          SizedBox(
            height: 8,
          ),
          _buildSettingsList(
              title: 'Terms & Conditions', icon: FeatherIcons.checkCircle),
          SizedBox(
            height: 8,
          ),
          Divider(),
          SizedBox(
            height: 8,
          ),
          _buildSettingsList(title: 'Help', icon: FeatherIcons.messageCircle),
          SizedBox(
            height: 8,
          ),
          Divider(),
          SizedBox(
            height: 8,
          ),
          _buildSettingsList(title: 'About App', icon: FeatherIcons.helpCircle),
          SizedBox(
            height: 8,
          ),
          Divider(),
          SizedBox(
            height: 8,
          ),
          SizedBox(
            height: 135,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text(
                    "APP VERSION: 9.22.3579.2",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      letterSpacing: 0.5,
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                        color: Colors.pink.shade900,
                        icon: const Icon(
                          FeatherIcons.instagram,
                          size: 20,
                        ),
                        onPressed: () {},
                      ),
                      IconButton(
                        color: Colors.green.shade900,
                        icon: const Icon(
                          FeatherIcons.mapPin,
                          size: 20,
                        ),
                        onPressed: () {},
                      ),
                      IconButton(
                        color: Colors.blue.shade900,
                        icon: const Icon(
                          FeatherIcons.facebook,
                          size: 20,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsList({String? title, IconData? icon}) {
    return Row(
      children: [
        Icon(
          icon,
          size: 22,
        ),
        SizedBox(
          width: 16,
        ),
        Expanded(
          child: Text(
            title!,
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 14,
            ),
          ),
        ),
        Icon(
          Icons.keyboard_arrow_right,
          color: theme.colorScheme.onBackground.withAlpha(250),
        ),
      ],
    );
  }
}
