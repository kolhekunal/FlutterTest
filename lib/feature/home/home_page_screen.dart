import 'package:FlutterTest/Thems/Responsive.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:provider/provider.dart';

import '../../Model/ProductListResponseModel.dart';
import '../../core/app_screen.dart';
import '../../core/bundle.dart';
import '../../data/data_helper.dart';
import '../../utility/colors.dart';
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
  final DataHelper _dataHelper = DataHelperImpl.instance;
  String userID = '';
  String villageID = '';
  var bloc;



  @override
  void onInit() {
    super.onInit();
  }

  @override
  void initState() {
    _cubit = BlocProvider.of<HomeCubit>(context);
    _cubit.fetchHomeData('1', '5');
    super.initState();
  }

  @override
  Widget setView() {
    return BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (!state.isHomedataFailure) {
            if (!state.isHomedataLoading) {
              if (state.productData.isEmpty) {

            bloc  = Provider.of<HomeCubit>(context);
                int totalCount = 0;
                if (bloc.cart.length > 0) {
                  totalCount = bloc.cart.values.reduce((a, b) => a + b);
                }
                return SafeArea(
                    child: Container(
                        color: AppColors.letsStartBackground,
                        child: Center(
                            child: Text(
                          state.errorMsg,
                          style: textTheme.headline6
                              ?.copyWith(color: AppColors.black),
                        ))));
              }

              return SafeArea(
                  child: Scaffold(
                appBar: AppBar(
                  backgroundColor: AppColors.buttonColor,
                  title: Text(
                    "Shopping Mall",
                    style:
                        textTheme.headline6?.copyWith(color: AppColors.white),
                  ),
                  automaticallyImplyLeading: false,
                  actions: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: InkWell(
                        onTap: (){
                          ScaffoldMessenger.of(globalKey.currentContext!)
                              .showSnackBar(SnackBar(content: Text('Under Progress')));

                       //   Navigator.of(context).push(MaterialPageRoute(builder: (context) => CartPage()));

                        },
                        child: Icon(
                          Icons.shopping_cart,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                  centerTitle: true,
                ),
                body: Container(
                  color: AppColors.white,
                  child: Column(children: [
                    departmentList(state.productData),
                  ]),
                ),
              ));
            } else {
              return AppLoader(
                isLoading: true,
              );
            }
          } else {
            return SafeArea(
                child: Container(
                    color: AppColors.white,
                    child: Center(
                        child: Text(
                      state.errorMsg,
                      style: textTheme.headline6,
                    ))));
          }
        });
  }

  Widget departmentList(List<ProductData> list) {
    return SizedBox(
      height: 100.h - 100,
      child: Container(
        color: AppColors.white,
        child: Column(
          children: [
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                childAspectRatio: (2 / 2.4),
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
                //physics:BouncingScrollPhysics(),
                padding: EdgeInsets.all(5.0),
                children: List.generate(list.length, (index) => GestureDetector(
                          onTap: () {},
                          child: Card(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  color: Colors.transparent, width: 1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Stack(
                              children: [
                                list[index].featuredImage != null
                                    ? Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(top: 10),
                                            height: 120,
                                            width: 120,
                                            child: CachedNetworkImage(
                                              imageUrl: list[index].featuredImage!,

                                              fit: BoxFit.fitHeight,
                                              // errorWidget: (context, url, error) => Icon(Icons.error),
                                            ),
                                          ),
                                        ],
                                      )
                                    : Container(
                                        height: 25,
                                        width: 25,
                                        child: AppLoader()),
                                Positioned(
                                    bottom: 0,
                                    left: 0,
                                    right: 0,
                                    child: Container(
                                      height: 50,
                                      decoration: BoxDecoration(
                                          color: AppColors.buttonColor,
                                          borderRadius: const BorderRadius.only(
                                            bottomRight:
                                                const Radius.circular(10.0),
                                            bottomLeft:
                                                const Radius.circular(10.0),
                                          )),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Container(
                                              width: 14.h,
                                              child: Text(
                                                list[index].title!,
                                                maxLines: 2,
                                                style: textTheme.bodySmall
                                                    ?.copyWith(
                                                        color: AppColors.white,
                                                        fontWeight:
                                                            FontWeight.bold),
                                              )),
                                          InkWell(
                                            onTap: (){
                                              ScaffoldMessenger.of(globalKey.currentContext!)
                                                  .showSnackBar(SnackBar(content: Text('Under Progress')));
                                            },
                                            child: Icon(
                                              Icons.shopping_cart,
                                              size: 18,
                                              color: AppColors.white,
                                            ),
                                          )
                                        ],
                                      ),
                                    )),
                              ],
                            ),
                          )),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
