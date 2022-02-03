import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:traxsmart_swm_staff_app/theme/app_theme.dart';
import 'package:traxsmart_swm_staff_app/theme/custom_theme.dart';
import 'single_user_screen.dart';
import 'user.dart';

class Complaints extends StatefulWidget {
  @override
  _ComplaintsState createState() => _ComplaintsState();
}

class _ComplaintsState extends State<Complaints> {
  List<User> userList = [];
  late ThemeData theme;
  late CustomTheme customTheme;


  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
    userList = User.userList();
  }

  @override
  Widget build (BuildContext context) => DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () { Navigator.of(context).pop(); },
            color: theme.colorScheme.onBackground.withAlpha(160),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.tune_outlined, color: customTheme.medicarePrimary,),
          onPressed: (){}, ),
          ],
          backgroundColor: Colors.white,
          //flexibleSpace: SizedBox(height: 20,),
          bottom: TabBar(
            tabs: [
              Tab(
                text: 'New',
              ),
              Tab(
                text: 'Pending',
              ),
              Tab(
                text: 'Resolved',
              )
            ],
            indicatorColor: customTheme.medicarePrimary,
            indicatorWeight: 3,
            labelColor: customTheme.medicarePrimary,
          ),
        ),
        body: TabBarView(
          children:  [
            buildNew(),
            buildPendingList(),
            buildResolved(),
          ]
        )
      ),
    );


  Widget buildResolved() {
    return ListView(

    );
  }

 Widget buildPendingList() {
   return ListView(

   );
 }

  Widget buildNew() {
    return ListView(
          children: _buildEmployeeList(),

    );
  }

  List<Widget> _buildEmployeeList() {
    List<Widget> list = [];

    for (int i = 0; i < userList.length; i++) {
      list.add(_buildSingleEmployee(userList[i]));
    }
    return list;
  }

  Widget _buildSingleEmployee(User user) {
    return Container(
      child: InkWell(
        onTap: () {
          Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(
              builder: (context) => SingleUserScreen(user)));
        },
        child: Container(
          margin: EdgeInsets.fromLTRB(24, 30, 24, 0),
          padding: EdgeInsets.all(45),
          width: (MediaQuery.of(context).size.width),
          decoration: BoxDecoration(
            color: theme.colorScheme.onBackground.withAlpha(13),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: [
              Row(
                  children: [
                    Container(
                      width: 62,
                      height: 62,
                      decoration: BoxDecoration(
                        color: theme.colorScheme.onBackground.withAlpha(13),
                        image: DecorationImage(
                          image: AssetImage('assets/images/avatar_4.jpg'),
                        ),
                        borderRadius: BorderRadius.circular(40),
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
                                  text: user.name,
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
                                  //color: _status,
                                ),
                                width: 6,
                                height: 6,
                              ),
                            ],
                          ),
                          SizedBox(height: 12),

                          RichText(
                            text: TextSpan(
                              text: 'Ward No: 10',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: theme.colorScheme.onBackground.withAlpha(150),
                                  letterSpacing: 0.5),
                            ),
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          RichText(
                            text: TextSpan(
                              text: '2022-02-02 11:05:38',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: theme.colorScheme.onBackground.withAlpha(150),
                                  letterSpacing: 0.5),
                            ),
                          ),
                        ],
                      ),
                    ),



                  ]),


              SizedBox(height: 10,),

              Container(
                width: (MediaQuery.of(context).size.width),
                height: 150,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/garbage.jpg'),
                ),
              ),
              ),

              SizedBox(height: 15,),

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
              SizedBox(height: 5,),
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
        ],

          ),

        ),

          )

        );
  }


  }

