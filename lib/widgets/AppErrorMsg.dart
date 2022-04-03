import 'package:flutter/material.dart';


class AppErrorMsg extends StatelessWidget {
  final String errorMsg;
  final String type;
  final  double height;
  AppErrorMsg({
    Key? key,
    this.errorMsg = '',
    this.type = '',
    this.height = 100,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return  new Container(
      height: height,
      child: Center(
      child: Text(errorMsg),
    ),);

  }
}
