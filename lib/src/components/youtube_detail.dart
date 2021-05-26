import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:youtube_clone/src/controller/youtube_detail_controller.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubeDetail extends GetView<YoutubeDetailController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          _youtubePlayer(),
          Expanded(child: _description()),
        ],
      ),
    );
  }

  Widget _description() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _titleZone(),
          Divider(
            height: 2,
          ),
          _descriptionZone(),
          _bottonZone(),
          SizedBox(height: 20,),
          Divider(
            height: 2,
          ),
          _ownerZone(),
        ],
      ),
    );
  }

  Widget _ownerZone() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Container(
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: Colors.grey.withOpacity(0.5),
              backgroundImage: Image.network(controller.youtuberThumbnailUrl).image,
            ),
            SizedBox(width: 15,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(controller.youtuberName, style: TextStyle(fontSize: 18),),
                  Text("구독자 ${controller.videoController.youtuber.value.statistics.subscriberCount}", style: TextStyle(fontSize: 14, color: Colors.black.withOpacity(0.5)),),
                ],
              ),
            ),
            GestureDetector(
              child: Text("구독", style: TextStyle(color: Colors.red, fontSize: 16),),
            )
          ],
        ),
      ),
    );
  }

  Widget _bottonOne(String iconPath, String text) {
    return Column(
      children: [
        SvgPicture.asset("assets/svg/icons/$iconPath.svg"),
        Text(text),
      ],
    );
  }

  Widget _youtubePlayer(){
    return YoutubePlayer(
      controller: controller.playerController,
      showVideoProgressIndicator: true,
      progressIndicatorColor: Colors.blueAccent,
      topActions: <Widget>[
        const SizedBox(width: 8.0),
        Expanded(
          child: Text(
            controller.playerController.metadata.title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18.0,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ),
        IconButton(
          icon: const Icon(
            Icons.settings,
            color: Colors.white,
            size: 25.0,
          ),
          onPressed: () {
          },
        ),
      ],
      onReady: () {
      },
      onEnded: (data) {
      },
    );
  }

  Widget _bottonZone() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _bottonOne("like", controller.likeCount),
        _bottonOne("dislike", controller.disLikeCount),
        _bottonOne("share", "공유"),
        _bottonOne("save", "저장"),
      ],
    );
  }

  Widget _descriptionZone() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
      child: Text(
        controller.description,
        style: TextStyle(fontSize: 15),
      ),
    );
  }

  Widget _titleZone() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              controller.title,
              style: TextStyle(
                fontSize: 15,
              ),
            ),
            Row(
              children: [
                Text(
                  controller.viewCount,
                  style: TextStyle(
                      fontSize: 13, color: Colors.black.withOpacity(0.5)),
                ),
                Text(" ﹒ "),
                Text(
                  controller.publishedTime,
                  style: TextStyle(
                      fontSize: 13, color: Colors.black.withOpacity(0.5)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
