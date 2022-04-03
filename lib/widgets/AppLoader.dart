import 'package:flutter/material.dart';


class AppLoader extends StatelessWidget {
  final bool isLoading;
  AppLoader({
    Key? key,
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return isLoading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : new Container();
  }
}
