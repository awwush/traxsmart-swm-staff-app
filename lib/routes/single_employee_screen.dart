import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:traxsmart_swm_staff_app/theme/app_theme.dart';
import 'package:traxsmart_swm_staff_app/routes/employee.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';



class SingleEmployeeScreen extends StatefulWidget {
  final Employee employee;
  const SingleEmployeeScreen(this.employee);

  @override
  _SingleEmployeeScreenState createState() => _SingleEmployeeScreenState();

}



class _SingleEmployeeScreenState extends State<SingleEmployeeScreen> {
  late Employee employee;
  late ThemeData theme;
  late CustomTheme customTheme;


  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
    employee = widget.employee;
  }


  Widget _buildSingleRow({String? title, IconData? icon}) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
          color: theme.colorScheme.onBackground.withAlpha(13),
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
                  color: theme.colorScheme.onBackground.withAlpha(250)),
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
        padding: EdgeInsets.fromLTRB(24, 44, 24, 24),
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

          SizedBox( height: 32,),

          Row(
            children: [
              Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                  child: Image(
                    fit: BoxFit.cover,
                    height: 160,
                    width: 120,
                    image: AssetImage(employee.image),
                  ),
                ),
              ),

              SizedBox(width: 24,),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                        text: TextSpan(
                          text: employee.name,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: theme.colorScheme.onBackground,
                            letterSpacing: 0.8,
                          ),
                        ),
                    ),

                    SizedBox(height: 2,),

                    RichText(
                      text: TextSpan(
                        text: employee.category,
                        style: TextStyle(
                          fontSize: 15,
                          color: theme.colorScheme.onBackground.withAlpha(150),
                        ),
                      ),
                    ),

                    SizedBox(height: 12,),

                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: theme.colorScheme.onBackground.withAlpha(13),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(
                            Icons.star_rounded,
                            color: AppTheme.customTheme.colorWarning,
                          ),
                          padding: EdgeInsets.all(8),
                        ),

                        SizedBox(width: 16,),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              text: TextSpan(
                                text: 'Rating',
                                style: TextStyle(
                                  fontSize: 12,

                                  color: theme.colorScheme.onBackground.withAlpha(150),
                                ),
                              ),
                            ),

                            SizedBox(height: 2,),

                            RichText(
                              text: TextSpan(
                                text: employee.ratings.toString() + ' out of 5',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  color: theme.colorScheme.onBackground,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],

                    ),

                    SizedBox(height: 8, ),

                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: theme.colorScheme.onBackground.withAlpha(13),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(
                            Icons.group,
                            color: CustomTheme.blue,
                          ),

                          padding: EdgeInsets.all(8),

                          ),

                        SizedBox(width: 16,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                              text: TextSpan(
                              text: 'Duty',
                              style: TextStyle(
                              fontSize: 12,
                              color: theme.colorScheme.onBackground.withAlpha(150),
                              ),
                              ),
                              ),

                              SizedBox(height: 2,),

                              RichText(
                              text: TextSpan(
                              text: employee.patients.toString() + '+',
                              style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: theme.colorScheme.onBackground,
                              ),
                              ),
                              ),


                            ],
                          )

                      ],
                    ),

                  ],
                )
              )

            ],
          ),


          SizedBox(height: 32,),

          _buildSingleRow(title: 'Attendance', icon: FeatherIcons.calendar),

          SizedBox( height: 8,),

          Divider(),

          SizedBox( height: 8,),

          _buildSingleRow(title: 'Performance', icon: FeatherIcons.star),

          SizedBox( height: 8,),

          Divider(),

          SizedBox( height: 8,),

          _buildSingleRow(title: 'Inspections', icon: FeatherIcons.server),

          SizedBox( height: 8,),

          Divider(),

          SizedBox( height: 8,),

          _buildSingleRow(title: 'Routes', icon: FeatherIcons.arrowUpRight),



        ],
      ),
    );

  }
}