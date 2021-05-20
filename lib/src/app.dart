import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:youtube_clone/src/controller/app_controller.dart';
import 'package:youtube_clone/src/pages/explore.dart';
import 'package:youtube_clone/src/pages/home.dart';
import 'package:youtube_clone/src/pages/library.dart';
import 'package:youtube_clone/src/pages/subscribe.dart';

class App extends GetView<AppController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(),
      body: Obx(() {
        switch(RouteName.values[controller.currentIndex.value]){
          case RouteName.Home:
            //print(RouteName.values[controller.currentIndex.value]);
            return Home();
            break;
          case RouteName.Explore:
            return Explore();
            break;
          case RouteName.Subscribe:
            return Subscribe();
            break;
          case RouteName.Library:
            return Library();
            break;
          case RouteName.Add:
            break;
        }
        return Container();
      }),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: SvgPicture.asset("assets/svg/icons/home_off.svg"),
                activeIcon: SvgPicture.asset("assets/svg/icons/home_on.svg"),
                label: "home"),
            BottomNavigationBarItem(
                icon: SvgPicture.asset("assets/svg/icons/compass_off.svg", width: 22,),
                activeIcon: SvgPicture.asset("assets/svg/icons/compass_on.svg", width: 22,),
                label: "search"),
            BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: SvgPicture.asset("assets/svg/icons/plus.svg", width: 35,),
                ),
                label: ""),
            BottomNavigationBarItem(
                icon: SvgPicture.asset("assets/svg/icons/subs_off.svg", width: 22,),
                activeIcon: SvgPicture.asset("assets/svg/icons/subs_on.svg", width: 22,),
                label: "subscription"),
            BottomNavigationBarItem(
                icon: SvgPicture.asset("assets/svg/icons/library_off.svg", width: 22,),
                activeIcon: SvgPicture.asset("assets/svg/icons/library_on.svg", width: 22,),
                label: "labrary"),
          ],
          showSelectedLabels: true,
          selectedItemColor: Colors.black,
          type: BottomNavigationBarType.fixed,
          currentIndex: controller.currentIndex.value,
          onTap: controller.changePageIndex,
          // onTap: (index) {
          //   print(index);
          //   //AppController.to.changePageIndex(index);
          //   controller.changePageIndex(index);
          // },
        ),
      ),
    );
  }
}
