import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

String apiDomainRoot = "http://careplus.skoder.co";


String USERTOKEN = '';




class DefaultBody extends StatelessWidget {
  final Widget widget;
  final GlobalKey<NavigatorState> navigatorKey;
  final bool isResizeToAvoidBottomPadding;

  const DefaultBody(
      {required this.widget, required this.navigatorKey, this.isResizeToAvoidBottomPadding = false});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,

      home: Scaffold(
        resizeToAvoidBottomInset: isResizeToAvoidBottomPadding,
        backgroundColor: Colors.white,
        body: SafeArea(
          bottom: false,
          child: Container(
            // alignment: Alignment.center,
            color: Colors.white,
            child: widget,
          ),
        ),
      ),
    );
  }
}