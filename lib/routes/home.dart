import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:traxsmart_swm_staff_app/data/dummy.dart';
import 'package:traxsmart_swm_staff_app/data/img.dart';
import 'package:traxsmart_swm_staff_app/data/my_colors.dart';
import 'package:traxsmart_swm_staff_app/model/base/icon_details.dart';
import 'package:traxsmart_swm_staff_app/utils/my_text.dart';
import 'package:traxsmart_swm_staff_app/routes/employee_screen.dart';
class HomeRoute extends StatefulWidget {

  HomeRoute({Key? key}) : super(key: key);

  @override
  HomeRouteState createState() => HomeRouteState();
}

class HomeRouteState extends State<HomeRoute> with SingleTickerProviderStateMixin {

  late BuildContext ctx;
  late String driverName = 'Driver Name';
  late String dutyDetails = 'Ward No:10';
  late String vehicleDetails = 'Vehicle No:10';

  @override
  void initState() {
  }

  @override
  void dispose() {
  }

  Widget getItemViewGrid(IconDetail s){
    return Expanded(
      flex: 1,
      child: Card(
        shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(4),),
        color: Colors.white,
        elevation: 2,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Container(
          height: 120,
          alignment: Alignment.center,
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(10),
                child: Icon(s.icon, size: 40, color: Colors.grey[600]),
              ),
              Text(s.title, textAlign : TextAlign.center,
                  style: MyText.subhead(context)!.copyWith(
                      color: Colors.grey[800]
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> getGridViewCategory(List<IconDetail> lc){
    List<Widget> wc = [];
    for(int i = 0; i < lc.length / 2; i++){
      Widget w;
      w = Row(
        children: <Widget>[
          getItemViewGrid(lc[i*2]),
          Container(width: 2),
          getItemViewGrid(lc[(i*2)+1])
        ],
      );

      wc.add(w);
    }
    return wc;
  }

  @override
  Widget build(BuildContext context) {
    ctx = context;
    List<IconDetail > listCategory = Dummy.getShoppingCategory();
    List<Widget> gridCategory = getGridViewCategory(listCategory);
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
                              Text(driverName, style: MyText.medium(context)!.copyWith(color: MyColors.grey_80)),
                              Container(height: 5),
                              Container(
                                margin: const EdgeInsets.symmetric(vertical: 10),
                                child: Text("Today's Duty", style: MyText.subhead(context)!.copyWith(color: MyColors.grey_80)),
                              ),
                              Text(dutyDetails, style: MyText.subhead(context)!.copyWith(color: MyColors.grey_40)),
                              Text(vehicleDetails, style: MyText.subhead(context)!.copyWith(color: MyColors.grey_40)),
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
                            onPressed: (){
                              Navigator.of(context, rootNavigator: true).push(
                                MaterialPageRoute(
                                  builder: (context) => EmployeeScreen()),
                                );
                              },
                              )

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