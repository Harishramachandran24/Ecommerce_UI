import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class size extends StatelessWidget {
  final appBar = AppBar();
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final appBarHeight = appBar.preferredSize.height;
    final statusBar = MediaQuery.of(context).padding.top;
    return Container();
  }
}


