import 'package:flutter/material.dart';
import 'package:traxsmart_swm_staff_app/widgets/box_rotation/box_rotation.dart';

class LoadingPage extends StatefulWidget {
  LoadingPage();

  @override
  LoadingPageState createState() => LoadingPageState();
}

class LoadingPageState extends State<LoadingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        appBar: PreferredSize(
            child: Container(), preferredSize: const Size.fromHeight(0)),
        body: const BoxRotation());
  }
}
