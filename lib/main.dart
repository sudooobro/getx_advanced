import 'package:getx_fun_fact/controllers/restuarants_controller.dart';
import 'package:getx_fun_fact/screens/add_followers.dart';
import 'package:getx_fun_fact/screens/add_reviews.dart';
import 'package:getx_fun_fact/screens/edit_follower_count.dart';
import 'package:getx_fun_fact/screens/edit_name.dart';
import 'package:getx_fun_fact/screens/home.dart';
import 'package:getx_fun_fact/screens/toggle_status.dart';
import 'package:getx_fun_fact/screens/update_menu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/menu_controller.dart';

void main() {
  Get.put(RestuarantController());
  Get.put(MenuController());

  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Coding with Curry',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: Home(),
      routes: {
        'home': (context) => Home(),
        'edit_name': (context) => EditName(),
        'add_followers': (context) => AddFollowers(),
        'toggle_status': (context) => ToggleStatus(),
        'edit_follower_count': (context) => EditFollowerCount(),
        'add_reviews': (context) => AddReviews(),
        'update_menu': (context) => UpdateMenu(),
      },
    );
  }
}
