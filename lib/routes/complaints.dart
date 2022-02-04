import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
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

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('kk:mm:ss  EEE d MMM').format(now);
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => SingleUserScreen()));
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

