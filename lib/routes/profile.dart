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
          child: RichText(
            text: TextSpan(
              text: title!,
              style: TextStyle(letterSpacing: 0.5,fontSize: 12,
                  color: theme.colorScheme.onBackground.withAlpha(200)),
            ),
            textAlign: TextAlign.left,
          ),
        ),

        SizedBox( width: 16, ),
        Icon(
          Icons.keyboard_arrow_right,
          color: theme.colorScheme.onBackground.withAlpha(160),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.fromLTRB(24, 52, 24, 24),
        children: [
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
          // FxSpacing.height(24),
          SizedBox( height: 24,),

          RichText(
            text: TextSpan(
              text: "Bessie Cooper",
              style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 0.8, fontSize: 17),
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
                  color: customTheme.medicarePrimary,
                ),
                height: 6,
                width: 6,
                child: Container(),
              ),

              SizedBox( width: 6,),

              RichText(
                  text: TextSpan(
                    text: "Premium (9 days)",
                    style: TextStyle( fontSize: 12.3,
                      color: customTheme.medicarePrimary,
                    ),
                  )
              )
            ],
          ),

          SizedBox( height: 24,),
          RichText(
              text: TextSpan(
                text: "General",
                style: TextStyle(
                  fontSize: 11,
                  letterSpacing: 0.8,
                  color: theme.colorScheme.onBackground.withAlpha(160),
                ),
              )
          ),

          SizedBox( height: 24,),

          _buildSingleRow(title: 'Subscription & payment', icon: FeatherIcons.creditCard),

          SizedBox( height: 8,),

          Divider(),

          SizedBox( height: 8,),

          _buildSingleRow(title: 'Profile settings', icon: FeatherIcons.user),

          SizedBox( height: 8,),

          Divider(),

          SizedBox( height: 8,),

          _buildSingleRow(title: 'Password', icon: FeatherIcons.lock),

          SizedBox( height: 8,),

          Divider(),

          SizedBox( height: 8,),

          _buildSingleRow(title: 'Notifications', icon: FeatherIcons.bell),

          SizedBox( height: 8,),

          Divider(),

          SizedBox( height: 8,),

          _buildSingleRow(title: 'Logout', icon: FeatherIcons.logOut),
        ],
      ),
    );
  }
}
