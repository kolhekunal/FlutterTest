

import 'package:flutter/material.dart';
import 'package:getinforme/utility/sizes.dart';

import '../utility/borders.dart';
import '../utility/colors.dart';


class PrimaryButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final bool isLoading;
   Color backgroundColor;
   Color TextColor;
  final double textSize;


   PrimaryButton({
    Key? key,
    required this.title,
     required this.backgroundColor,
    this.isLoading = false,
    this.textSize = 16,
    this.TextColor = Colors.white,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return CustomButton(
        color:
            backgroundColor != null ? backgroundColor : AppColors.blue,
        height: Sizes.dimen_40,
        borderRadius: Sizes.RADIUS_8,


        textStyle: theme.textTheme.subtitle1!.copyWith(
          color: TextColor,
          fontSize: textSize,
          fontWeight: FontWeight.w700,
        ),
        onPressed: onPressed,
        hasIcon: isLoading,
        icon: isLoading
            ? CircularProgressIndicator(
                backgroundColor: AppColors.white,
                strokeWidth: 2.0,
              )
            : new Container(),
        title: title);
  }
}

class CustomButton extends StatelessWidget {
  CustomButton({
    required this.title,
    required this.onPressed,
    this.height = Sizes.HEIGHT_56,
    this.elevation = Sizes.ELEVATION_1,
    this.borderRadius = Sizes.RADIUS_24,
    this.color = AppColors.blackShade5,
    this.borderSide = Borders.defaultPrimaryBorder,
    required this.textStyle,
    required this.icon,
    this.hasIcon = false,
  });

  final VoidCallback onPressed;
  final double height;
  final double elevation;
  final double borderRadius;
  final String title;
  final Color color;
  final BorderSide borderSide;
  final TextStyle textStyle;
  final Widget icon;
  final bool hasIcon;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      elevation: elevation,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
        side: borderSide,
      ),
      height: height,
      color: color,
      child: Row(
        mainAxisAlignment:
             MainAxisAlignment.center,
        children: <Widget>[
          title != null&&!hasIcon
              ? Text(
                  title,
                  style: textStyle,
                )
              : Container(child: CircularProgressIndicator(
            backgroundColor: AppColors.white,
            strokeWidth: 2.0,
          ),),
          hasIcon ? Container() : Container(),
          hasIcon ? Container() : Container(),
        ],
      ),
    );
  }
}
