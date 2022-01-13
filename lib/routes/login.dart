import 'package:flutter/material.dart';
import 'package:traxsmart_swm_staff_app/data/img.dart';
import 'package:traxsmart_swm_staff_app/data/my_colors.dart';
import 'package:traxsmart_swm_staff_app/routes/dashboard.dart';
import 'package:traxsmart_swm_staff_app/utils/my_text.dart';
import 'package:traxsmart_swm_staff_app/widgets/loading_page.dart';

class LoginRoute extends StatefulWidget {

  LoginRoute();

  @override
  LoginRouteState createState() => LoginRouteState();
}

class LoginRouteState extends State<LoginRoute> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          child: Container(),
          preferredSize: const Size.fromHeight(0)
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
        width: double.infinity,
        height: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(height: 0),
            SizedBox(
              child: Image.asset(
                  Img.get('traxsmartlogo.png')),
              width: 80, height: 80,
            ),
            Container(height: 15),
            Text("SWM STAFF", style: MyText.title(context)!.copyWith(
                color: MyColors.grey_80,
                fontWeight: FontWeight.bold
            )),
            Container(height: 5),
            Text("Sign in to continue", style: MyText.subhead(context)!.copyWith(
                color: Colors.blueGrey[300],
                fontWeight: FontWeight.bold
            )),
            const Spacer(),
            const TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  labelText: "Phone Number",
                prefixText: '+91',
                prefixIcon: Icon(Icons.call_rounded),
              ),
            ),
            Container(height: 25),
            const TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  labelText: "Password",
                prefixIcon: Icon(Icons.password),
              ),
            ),
            Container(height: 5),
            Row(
              children: <Widget>[
                const Spacer(),
                TextButton(
                  style: TextButton.styleFrom(primary: Colors.transparent),
                  child: Text("Forgot Password?", style: TextStyle(color: Colors.green[400]),),
                  onPressed: () {},
                )
              ],
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.green[400], elevation: 0),
                child: const Text("Login", style: TextStyle(color: Colors.white)),
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) =>  DashboardRoute()),
                        (Route<dynamic> route) => false,
                  );
                },
              ),
            ),
            /*SizedBox(
              width: double.infinity,
              child: TextButton(
                style: TextButton.styleFrom(primary: Colors.transparent),
                child: Text("New user? Sign Up", style: TextStyle(color: Colors.purpleAccent[400])),
                onPressed: () {},
              ),
            )*/
          ],
          mainAxisSize: MainAxisSize.min,
        ),
      ),
    );
  }
}