import 'package:flutter/material.dart';
import 'package:getinforme/Thems/Responsive.dart';


import '../core/bundle.dart';
import '../core/routes.dart';
import '../utility/colors.dart';
import '../utility/images.dart';

class TopAppBar extends StatelessWidget {
  final String errorMsg;
  final String type;
  final double height;
  final String notificationCount;
  Function onbackClick;
  bool isNotification;

  TopAppBar({
    Key? key,
    this.errorMsg = '',
    this.type = '',
    this.height = 100,
    required this.onbackClick,
    required this.notificationCount,
    this.isNotification=false
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Container(
      height: 11.4.h,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Stack(
            children: [
              InkWell(
                onTap: () {
                  onbackClick();
                },
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 19.0, top: 35, bottom: 8.0),
                  child: Container(
                    height: 50.0,
                    width: 50.0,
                    decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.all(Radius.circular(8.0))),
                    child: Image.asset(ImagePath.back),
                  ),
                ),
              )
            ],
          ),
          Spacer(),
          !isNotification? InkWell(
            onTap: () {

              Bundle bundle = new Bundle()
              ..put('type', '1');  //temporary
          /*    Navigator.pushNamed(
                  context, Screen.NotificationListPage.toString(),
                  arguments: bundle);*/
            },
            child: Stack(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(right: 19.0, top: 35, bottom: 8.0),
                  child: Container(
                    height: 50.0,
                    width: 50.0,
                    decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.all(Radius.circular(8.0))),
                    child: Image.asset(ImagePath.notification),
                  ),
                ),
                Positioned(
                  right: 12.0, //56-40=16,49-16=33
                  top: 25.0,
                  child: Container(
                    height: 26,
                    width: 26,
                    decoration: BoxDecoration(
                      color: notificationCount.isNotEmpty
                          ? AppColors.primaryColor
                          : Colors.transparent,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                        child: Text(
                      notificationCount.toString(),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w700),
                    )),
                  ),
                ),
              ],
            ),
          ):new Container()
        ],
      ),
    );
  }
}
