import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getinforme/Thems/Responsive.dart';

import '../../core/app_screen.dart';
import '../../core/bundle.dart';
import '../../utility/colors.dart';
import '../../utility/images.dart';
import '../../widgets/AppLoader.dart';
import 'cubit/home_cubit.dart';

class HomePage extends AppScreen {
  HomePage({
    RouteObserver<Route>? routeObserver,
    Key? key,
    Bundle? arguments,
  }) : super(routeObserver, key, arguments);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends AppScreenState<HomePage> {
  late HomeCubit _cubit;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _cubit = BlocProvider.of<HomeCubit>(context);
    //_cubit.fetchHomeData();
  }

  @override
  Widget setView() {
    return BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          // if (!state.isHomedataLoading)
          return SafeArea(
              child: Container(
            height: double.infinity,
            width: double.infinity,
            color: AppColors.letsStartBackground,
            child: SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.all(50),
                //        crossAxisAlignment: CrossAxisAlignment.start,

                child: Center(
                    child: Text(
                  'Dashboard',
                  style: textTheme.headline6?.copyWith(color: AppColors.black),
                )),
              ),
            ),
          ));

          return AppLoader(
            isLoading: true,
          );
        });
  }

  Widget topTilte() {
    return Container(
      height: 11.4.h,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 19.0, top: 35.0, bottom: 8.0),
            child: Image.asset(
              ImagePath.LOGO_BLUE,
              height: 80.0,
              fit: BoxFit.cover,
            ),
          ),
          Spacer(),
          Stack(
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
                right: 12.0,
                top: 25.0,
                child: Container(
                  height: 26,
                  width: 26,
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                      child: Text(
                    '2',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w700),
                  )),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget slider(List<String> slider) {
    return Padding(
      padding: const EdgeInsets.only(left: 0.0, top: 10),
      child: Container(
        height: 10.h,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: slider.length,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(
                    left: 16, right: index == slider.length - 1 ? 16.0 : 0.0),
                //322
                height: 10.h,
                width: 40.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    color: Colors.white,
                    image: DecorationImage(
                      image: NetworkImage(
                        slider[index],
                      ),
                      fit: BoxFit.fill,
                    )),
              );
            }),
      ),
    );
  }
}
