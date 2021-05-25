import 'package:get/get.dart';
import 'package:youtube_clone/src/models/statistics.dart';
import 'package:youtube_clone/src/models/video.dart';
import 'package:youtube_clone/src/models/youtuber.dart';
import 'package:youtube_clone/src/repository/youtube_repository.dart';

class VideoController extends GetxController {
  Video video;
  VideoController({this.video});
  Rx<Statistics> statistics = Statistics().obs;
  Rx<Youtuber> youtuber = Youtuber().obs;

  @override
  void onInit() async{
    Statistics loadStatistics = await YoutubeRepository.to.getVideoInfoById(video.id.videoId);
    statistics(loadStatistics);
    Youtuber loadYoutuber = await YoutubeRepository.to.getYoutuberInfoById(video.snippet.channelId);
    youtuber(loadYoutuber);
    super.onInit();
  }
  String get viewCountString => "조회수 : ${statistics.value.viewCount ?? '-'} 회";
  String get YoutuberThumbnailUrl {
    if(youtuber.value.snippet.thumbnails == null) {
      return "https://hook.finance/sites/default/files/user.png";
    } else {
      return youtuber.value.snippet.thumbnails.medium.url;
    }
  }
}