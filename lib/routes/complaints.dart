import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:traxsmart_swm_staff_app/routes/user.dart';
import 'package:traxsmart_swm_staff_app/routes/single_user_screen.dart';
import 'package:traxsmart_swm_staff_app/theme/app_theme.dart';

class Complaints extends StatefulWidget {
  const Complaints({Key? key}) : super(key: key);

  @override
  _ComplaintsState createState() => _ComplaintsState();
}

class _ComplaintsState extends State<Complaints> {
  late ThemeData theme;
  late CustomTheme customTheme;
  List<User> userList = [];

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
    userList = User.userList();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: SafeArea(
          child: Scaffold(
        body: Container(
          padding: const EdgeInsets.fromLTRB(24, 12, 24, 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            child: const Icon(Icons.arrow_back),
                            decoration: BoxDecoration(
                              color: customTheme.medicarePrimary.withAlpha(120),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10.0)),
                            ),
                            padding: const EdgeInsets.all(5.0),
                          ),
                        ),
                        const SizedBox(width: 14.0),
                        const Text(
                          'Complaints',
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                    Icon(
                      Icons.tune_outlined,
                      color: customTheme.medicarePrimary,
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 9,
                child: Column(
                  children: [
                    TabBar(
                      labelColor: customTheme.medicarePrimary,
                      indicatorColor: customTheme.medicarePrimary,
                      unselectedLabelColor:
                          customTheme.medicarePrimary.withAlpha(100),
                      tabs: const <Widget>[
                        Tab(text: 'NEW'),
                        Tab(text: 'PENDING'),
                        Tab(text: 'RESOLVED'),
                      ],
                    ),
                    const Expanded(
                      child: TabBarView(children: [
                        BuildNew(),
                        BuildNew(),
                        BuildNew(),
                      ]),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}

class BuildNew extends StatefulWidget {
  const BuildNew({Key? key}) : super(key: key);

  @override
  _BuildNewState createState() => _BuildNewState();
}

class _BuildNewState extends State<BuildNew> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const ClampingScrollPhysics(),
      shrinkWrap: true,
      itemCount: 3,
      itemBuilder: (BuildContext context, int index) {
        return const BuildNewCard();
      },
      padding: const EdgeInsets.all(2.0),
    );
  }
}

class BuildNewCard extends StatefulWidget {
  const BuildNewCard({Key? key}) : super(key: key);

  @override
  _BuildNewCardState createState() => _BuildNewCardState();
}

class _BuildNewCardState extends State<BuildNewCard> {
  late User user;

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('kk:mm:ss  EEE d MMM').format(now);
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => SingleUserScreen(user)));
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 10.0),
          child: ListTile(

            leading: const ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              child: Image(
                image: AssetImage(
                  'assets/images/avatar_4.jpg',
                ),
              ),
            ),
            title: const Text('Saoud Salih'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Ward No. : 10'),
                Text(
                  formattedDate,
                  textAlign: TextAlign.center,
                ),




              ],
            ),

          ),

        ),
      ),
    );
  }
}

//// import 'package:flutter/cupertino.dart';
// // import 'package:flutter/material.dart';
// // import 'package:traxsmart_swm_staff_app/theme/app_theme.dart';
// // import 'package:traxsmart_swm_staff_app/theme/custom_theme.dart';
// // import 'single_user_screen.dart';
// // import 'user.dart';
// //
// // class Complaints extends StatefulWidget {
// //   @override
// //   _ComplaintsState createState() => _ComplaintsState();
// // }
// //
// // class _ComplaintsState extends State<Complaints> {
// //   List<User> userList = [];
// //   late ThemeData theme;
// //   late CustomTheme customTheme;
// //
// //
// //   @override
// //   void initState() {
// //     super.initState();
// //     theme = AppTheme.theme;
// //     customTheme = AppTheme.customTheme;
// //     userList = User.userList();
// //   }
// //
// //   @override
// //   Widget build (BuildContext context) => DefaultTabController(
// //       length: 3,
// //       child: Scaffold(
// //         appBar: AppBar(
// //           leading: IconButton(
// //             icon: Icon(Icons.arrow_back_ios),
// //             onPressed: () { Navigator.of(context).pop(); },
// //             color: theme.colorScheme.onBackground.withAlpha(160),
// //           ),
// //           actions: [
// //             IconButton(
// //               icon: Icon(Icons.tune_outlined, color: customTheme.medicarePrimary,),
// //           onPressed: (){}, ),
// //           ],
// //           backgroundColor: Colors.white,
// //           //flexibleSpace: SizedBox(height: 20,),
// //           bottom: TabBar(
// //             tabs: [
// //               Tab(
// //                 text: 'New',
// //               ),
// //               Tab(
// //                 text: 'Pending',
// //               ),
// //               Tab(
// //                 text: 'Resolved',
// //               )
// //             ],
// //             indicatorColor: customTheme.medicarePrimary,
// //             indicatorWeight: 3,
// //             labelColor: customTheme.medicarePrimary,
// //           ),
// //         ),
// //         body: TabBarView(
// //           children:  [
// //             buildNew(),
// //             buildPendingList(),
// //             buildResolved(),
// //           ]
// //         )
// //       ),
// //     );
// //
// //
// //   Widget buildResolved() {
// //     return ListView(
// //
// //     );
// //   }
// //
// //  Widget buildPendingList() {
// //    return ListView(
// //
// //    );
// //  }
// //
// //   Widget buildNew() {
// //     return ListView(
// //           children: _buildEmployeeList(),
// //
// //     );
// //   }
// //
// //   List<Widget> _buildEmployeeList() {
// //     List<Widget> list = [];
// //
// //     for (int i = 0; i < userList.length; i++) {
// //       list.add(_buildSingleEmployee(userList[i]));
// //     }
// //     return list;
// //   }
// //
// //   Widget _buildSingleEmployee(User user) {
// //     return Container(
// //       child: InkWell(
// //         onTap: () {
// //           Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(
// //               builder: (context) => SingleUserScreen(user)));
// //         },
// //         child: Container(
// //           margin: EdgeInsets.fromLTRB(24, 30, 24, 0),
// //           padding: EdgeInsets.all(45),
// //           width: (MediaQuery.of(context).size.width),
// //           decoration: BoxDecoration(
// //             color: theme.colorScheme.onBackground.withAlpha(13),
// //             borderRadius: BorderRadius.circular(8),
// //           ),
// //           child: Column(
// //             children: [
// //               Row(
// //                   children: [
// //                     Container(
// //                       width: 62,
// //                       height: 62,
// //                       decoration: BoxDecoration(
// //                         color: theme.colorScheme.onBackground.withAlpha(13),
// //                         image: DecorationImage(
// //                           image: AssetImage('assets/images/avatar_4.jpg'),
// //                         ),
// //                         borderRadius: BorderRadius.circular(40),
// //                       ),
// //                     ),
// //                     SizedBox(
// //                       width: 16,
// //                     ),
// //                     Expanded(
// //                       child: Column(
// //                         crossAxisAlignment: CrossAxisAlignment.start,
// //                         children: [
// //                           Row(
// //                             children: [
// //                               RichText(
// //                                 text: TextSpan(
// //                                   text: user.name,
// //                                   style: TextStyle(
// //                                       fontSize: 15,
// //                                       color: theme.colorScheme.onBackground,
// //                                       fontWeight: FontWeight.bold,
// //                                       letterSpacing: 0.8),
// //                                 ),
// //                               ),
// //                               SizedBox(
// //                                 width: 6,
// //                               ),
// //                               Container(
// //                                 decoration: BoxDecoration(
// //                                   borderRadius: BorderRadius.circular(12),
// //                                   //color: _status,
// //                                 ),
// //                                 width: 6,
// //                                 height: 6,
// //                               ),
// //                             ],
// //                           ),
// //                           SizedBox(height: 12),
// //
// //                           RichText(
// //                             text: TextSpan(
// //                               text: 'Ward No: 10',
// //                               style: TextStyle(
// //                                   fontSize: 12,
// //                                   color: theme.colorScheme.onBackground.withAlpha(150),
// //                                   letterSpacing: 0.5),
// //                             ),
// //                           ),
// //                           SizedBox(
// //                             height: 2,
// //                           ),
// //                           RichText(
// //                             text: TextSpan(
// //                               text: '2022-02-02 11:05:38',
// //                               style: TextStyle(
// //                                   fontSize: 12,
// //                                   color: theme.colorScheme.onBackground.withAlpha(150),
// //                                   letterSpacing: 0.5),
// //                             ),
// //                           ),
// //                         ],
// //                       ),
// //                     ),
// //
// //
// //
// //                   ]),
// //
// //
// //               SizedBox(height: 10,),
// //
// //               Container(
// //                 width: (MediaQuery.of(context).size.width),
// //                 height: 150,
// //               decoration: BoxDecoration(
// //                 image: DecorationImage(
// //                   image: AssetImage('assets/images/garbage.jpg'),
// //                 ),
// //               ),
// //               ),
// //
// //               SizedBox(height: 15,),
// //
// //               Row(
// //                 children: [
// //                   RichText(
// //                     text: TextSpan(
// //                       text: 'Garbage Overflow',
// //                       style: TextStyle(
// //                           fontSize: 15,
// //                           color: customTheme.medicarePrimary,
// //                           letterSpacing: 0.5),
// //                     ),
// //                     textAlign: TextAlign.left,
// //                   ),
// //                 ],
// //               ),
// //               SizedBox(height: 5,),
// //               Row(
// //                 children: [
// //                   RichText(
// //                     text: TextSpan(
// //                       text: 'Vehicle not arrived',
// //                       style: TextStyle(
// //                           fontSize: 12,
// //                           color: theme.colorScheme.onBackground.withAlpha(150),
// //                           letterSpacing: 0.5),
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //         ],
// //
// //           ),
// //
// //         ),
// //
// //           )
// //
// //         );
// //   }
// //
// //
// //   }
// //
