import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:youtube_clone/src/controller/video_controlloer.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubeDetailController extends GetxController {
  VideoController videoController;
  YoutubePlayerController playerController;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    print(Get.parameters["videoId"]);
    videoController = Get.find(tag: Get.parameters["videoId"]);
    playerController = YoutubePlayerController(
        initialVideoId: Get.parameters["videoId"],
        flags: const YoutubePlayerFlags(
          mute: false,
          autoPlay: true,
          disableDragSeek: false,
          loop: false,
          isLive: false,
          forceHD: false,
          enableCaption: true,
        ),
    );
    print(videoController.video.snippet.title);
  }

  String get title => videoController.video.snippet.title;
  String get description => videoController.video.snippet.description;
  String get viewCount => "조회수 ${videoController.statistics.value.viewCount}";
  String get likeCount => videoController.statistics.value.likeCount;
  String get disLikeCount => videoController.statistics.value.dislikeCount;
  String get publishedTime => DateFormat("yyy-MM-dd").format(videoController.video.snippet.publishTime);
  String get youtuberThumbnailUrl => videoController.YoutuberThumbnailUrl;
  String get youtuberName => videoController.youtuber.value.snippet.title;

}