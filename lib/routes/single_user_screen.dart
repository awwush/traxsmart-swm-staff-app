import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:traxsmart_swm_staff_app/theme/app_theme.dart';
import 'user.dart';

class SingleUserScreen extends StatefulWidget {


  @override
  _SingleUserScreenState createState() => _SingleUserScreenState();
}

class _SingleUserScreenState extends State<SingleUserScreen> {

  late User user;
  late ThemeData theme;
  late CustomTheme customTheme;

  // late GoogleMapController myController;
  //
  // final LatLng _center = const LatLng(45.521563, -122.677433);
  //
  // void _onMapCreated(GoogleMapController controller) {
  //   myController = controller;
  // }

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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                ],
              ),
              SizedBox(
                height: 32,
              ),
              Row(
                children: [
                  Container(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: Image(
                        fit: BoxFit.cover,
                        width: 82,
                        height: 82,
                        image: AssetImage(user.userImage),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 24,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                            text: user.name,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: theme.colorScheme.onBackground,
                              letterSpacing: 0.8,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        RichText(
                          text: TextSpan(
                            text: 'Ward No: ' + user.wardNo.toString(),
                            style: TextStyle(
                              fontSize: 15,
                              color:
                              theme.colorScheme.onBackground.withAlpha(150),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        RichText(
                          text: TextSpan(
                            text: user.timestamp,
                            style: TextStyle(
                              fontSize: 15,
                              color:
                              theme.colorScheme.onBackground.withAlpha(150),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        RichText(
                          text: TextSpan(
                            text: 'Complaint Id: ' + user.complaintId,
                            style: TextStyle(
                              fontSize: 15,
                              color:
                              theme.colorScheme.onBackground.withAlpha(150),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: ClipRRect(
                      child: Image(
                        //fit: BoxFit.cover,
                        width: 310,
                        height: 200,
                        image: AssetImage(user.complaintImage),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  RichText(
                    text: TextSpan(
                      text: 'Garbage Overflow',
                      style: TextStyle(
                          fontSize: 15,
                          color: customTheme.medicarePrimary,
                          letterSpacing: 0.5),
                    ),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  RichText(
                    text: TextSpan(
                      text: 'Vehicle not arrived',
                      style: TextStyle(
                          fontSize: 12,
                          color: theme.colorScheme.onBackground.withAlpha(150),
                          letterSpacing: 0.5),
                    ),
                  ),
                ],
              ),

              // GoogleMap(
              //   onMapCreated: _onMapCreated,
              //   initialCameraPosition: CameraPosition(
              //     target: _center,
              //     zoom: 10.0,
              //   ),
              // ),


              GestureDetector(
                onTap: () {
                  //buildPending();
                },
                child: Container(
                  alignment: Alignment.bottomCenter,
                  decoration: BoxDecoration(
                    color: customTheme.medicarePrimary,
                  ),

                  child: Text(
                    'Take Action',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  padding: EdgeInsets.all(18),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }


}
