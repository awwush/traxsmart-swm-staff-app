import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:traxsmart_swm_staff_app/data/img.dart';
import 'package:traxsmart_swm_staff_app/data/my_colors.dart';
import 'package:traxsmart_swm_staff_app/utils/my_text.dart';

class MoreRoute extends StatefulWidget {

  MoreRoute({Key? key}) : super(key: key);

  @override
  MoreRouteState createState() => MoreRouteState();
}

class MoreRouteState extends State<MoreRoute> with SingleTickerProviderStateMixin {

  late BuildContext ctx;
  late String driverName = 'Driver Name';
  late String dutyDetails = 'Ward No:13';

  @override
  void initState() {
  }

  @override
  void dispose() {
  }

  @override
  Widget build(BuildContext context) {
    ctx = context;
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  /*Stack(
                    children: <Widget>[
                      SizedBox(
                        height: 200,
                        width: double.infinity,
                        child: Image.asset(Img.get('pastelbackdrop.png'),fit: BoxFit.cover),
                      ),
                      Container(
                        color: Colors.black.withOpacity(0.4),
                        height: 200,
                        width: double.infinity,
                        child: Align(
                          alignment: Alignment.center,
                          child: Text("Browse Through Million of Products\nin Many Category", textAlign : TextAlign.center,
                              style: MyText.medium(context).copyWith(
                                  color: Colors.white, fontWeight: FontWeight.bold
                              )
                          ),
                        ),
                      ),
                    ],
                  ),*/
                  /*Container(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    transform: Matrix4.translationValues(0.0, -30.0, 0.0),
                    child: Column(
                      children: gridCategory,
                    ),
                  )*/
                  SizedBox(
                    height: 200,
                    width: double.infinity,
                    child: Image.asset(Img.get('geometricbackdrop.png'),fit: BoxFit.cover),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        /* Image.asset(Img.get('geometricbackdrop.png'),
                          height: 180, width: double.infinity, fit: BoxFit.cover,
                        ),*/
                        Container(
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("Welcome,", style: MyText.subhead(context)!.copyWith(color: MyColors.grey_80)),
                              Text(driverName, style: MyText.headline(context)!.copyWith(color: MyColors.grey_80)),
                              Container(height: 5),
                              Container(
                                margin: const EdgeInsets.symmetric(vertical: 10),
                                child: Text("Today's Duty", style: MyText.subhead(context)!.copyWith(color: MyColors.grey_80)),
                              ),
                              Text(dutyDetails, style: MyText.subhead(context)!.copyWith(color: MyColors.grey_40)),
                              Text(dutyDetails, style: MyText.subhead(context)!.copyWith(color: MyColors.grey_40)),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 15),
                          child: const Divider(height: 1),
                        ),
                        Container(
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("Tonight's availability", style: MyText.medium(context).copyWith(color: MyColors.grey_80)),
                              Container(height: 5),
                              Row(
                                children: [
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.grey[300], elevation: 0,
                                      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
                                    ),
                                    child: const Text("5:30PM", style: TextStyle(color: MyColors.grey_60)),
                                    onPressed: (){},
                                  ),
                                  Container(width: 8),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.grey[300], elevation: 0,
                                      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
                                    ),
                                    child: const Text("7:30PM", style: TextStyle(color: MyColors.grey_60)),
                                    onPressed: (){},
                                  ),
                                  Container(width: 8),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.grey[300], elevation: 0,
                                      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
                                    ),
                                    child: const Text("8:00PM", style: TextStyle(color: MyColors.grey_60)),
                                    onPressed: (){},
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          child: TextButton(
                            style: TextButton.styleFrom(primary: Colors.transparent),
                            child: const Text("RESERVE", style: TextStyle(color: MyColors.primary),),
                            onPressed: (){},
                          ),
                        ),
                        Container(height: 5)
                      ],
                    ),
                  ),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}