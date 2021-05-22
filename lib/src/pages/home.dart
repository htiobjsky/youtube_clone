import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_clone/src/components/custom_appbar.dart';
import 'package:youtube_clone/src/components/video_widget.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              title: CustomAppBar(),
              floating: true,
              snap: true,
            ),
            SliverList(
                delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return GestureDetector(
                        onTap: (){
                          Get.toNamed("/detail/239587");
                        },
                        child: VideoWidget(),
                      );
                    },
                  childCount: 10,
                ),),
          ],
        ));
  }
}
