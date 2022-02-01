import 'package:flutter/material.dart';
import 'package:traxsmart_swm_staff_app/theme/app_theme.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';


class ProfileRoute extends StatefulWidget {
  const ProfileRoute({Key? key}) : super(key: key);

  @override
  _ProfileRouteScreenState createState() => _ProfileRouteScreenState();
}

class _ProfileRouteScreenState extends State<ProfileRoute> {
  late ThemeData theme;
  String _employeeName = "Sam Thomas";
  String _jobRole = "Driver";
  Color _status = Colors.green;
  late CustomTheme customTheme;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
  }

  Widget _buildSingleRow({String? title, IconData? icon}) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            color: theme.colorScheme.onBackground.withAlpha(20),
            borderRadius: BorderRadius.circular(4),
          ),

          child: Icon(
            icon,
            color: customTheme.medicarePrimary,
            size: 20,
          ),

          padding: new EdgeInsets.all(10.0),
        ),

        SizedBox( width: 16, ),

        Expanded(
          child: Text(
            title!,
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 13,
            ),
          ),
        ),

        SizedBox( width: 16, ),
        Icon(
          Icons.keyboard_arrow_right,
          color: theme.colorScheme.onBackground.withAlpha(250),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(

        padding: const EdgeInsets.fromLTRB(24, 24, 24, 24),
        children: [
          SizedBox( height: 25,),
          Center(
            child: Container(
              child: ClipRRect(
                borderRadius: BorderRadius.all(
                  Radius.circular(24),
                ),
                child: Image(
                  fit: BoxFit.cover,
                  width: 100,
                  height: 100,
                  image: AssetImage('assets/images/avatar_4.jpg'),
                ),
              ),
            ),
          ),

          SizedBox( height: 24,),

          RichText(
            text: TextSpan(
              text: _employeeName,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.8,
                  fontSize: 20,
                  color: Colors.grey,
              ),
            ),
            textAlign: TextAlign.center,
          ),

          SizedBox( height: 4,),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container (
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: _status,
                ),
                height: 6,
                width: 6,

              ),


              SizedBox( width: 6,),

              RichText(
                  text: TextSpan(
                    text: _jobRole,
                    style: TextStyle( fontSize: 12.3,
                      color: customTheme.medicarePrimary,
                    ),
                  )
              )
            ],
          ),


          SizedBox( height: 16,),

          _buildSingleRow(title: 'Documents', icon: FeatherIcons.file),

          SizedBox( height: 8,),

          Divider(),

          SizedBox( height: 8,),

          _buildSingleRow(title: 'Notifications', icon: FeatherIcons.bell),

          SizedBox( height: 8,),

          Divider(),

          SizedBox( height: 8,),

          _buildSingleRow(title: 'App Settings', icon: FeatherIcons.settings),

          SizedBox( height: 8,),

          Divider(),

          SizedBox( height: 8,),

          _buildSingleRow(title: 'Password', icon: FeatherIcons.lock),

          SizedBox( height: 8,),

          Divider(),

          SizedBox( height: 8,),

          _buildSingleRow(title: 'Logout', icon: FeatherIcons.logOut),

        ],
      ),
    );
  }
}
