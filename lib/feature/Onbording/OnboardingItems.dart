import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class OnBoarding {
  final String title;
  final String subtitle;
  final String image;
  final Color color;

  const OnBoarding(
      {required this.title,
      required this.subtitle,
      required this.image,
      required this.color});
}

class OnBoardingItems {
  static List<OnBoarding> loadData() {
    const data = <OnBoarding>[
      OnBoarding(
          title: "Saves alot of Time",
          subtitle:
              "forget paperwork - access everything online",
          image: "assets/icons/first.svg",
          color: Colors.greenAccent,
      ),
      OnBoarding(
          title: "Make way for money",
          subtitle:
              "Save money with incredibly low premiums",
        image: "assets/icons/second.svg",
          color: Colors.blueAccent,
      ),
      OnBoarding(
          title: "Enjoy the experience",
          subtitle:
              "Get used to quick settlements,\nconvient services & 24x7 support",
        image: "assets/icons/third.svg",
          color: Colors.orange,
      ),

    ];
    return data;
  }
}


