import 'package:get/get.dart';
import 'package:youtube_clone/src/models/statistics.dart';
import 'package:youtube_clone/src/models/youtube_video_result.dart';
import 'package:youtube_clone/src/models/youtuber.dart';

class YoutubeRepository extends GetConnect {
  static YoutubeRepository get to => Get.find();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    httpClient.baseUrl = "https://www.googleapis.com";
  }

  Future<YoutubeVideoResult> loadVideos() async{
    String url = "/youtube/v3/search?part=snippet&channelId=UCqkb6ZB6e8PWlRkeR7F3wTQ&maxResults=10&order=date&type=video&videoDefinition=high&key=AIzaSyAL8XNAn9-SkYhI_fwSFeUFgXatm16eJwo";
    final response = await get(url);
    if(response.status.hasError){
      return Future.error(response.statusText);
    }
    else {
      if(response.body["items"]!=null && response.body["items"].length >0) {
        return YoutubeVideoResult.fromJson(response.body);
      }
    }
  }

  Future<Statistics> getVideoInfoById(String videoId) async{
    String url = "/youtube/v3/videos?part=snippet,statistics&key=AIzaSyAL8XNAn9-SkYhI_fwSFeUFgXatm16eJwo&id=$videoId";
    final response = await get(url);
    if(response.status.hasError){
      return Future.error(response.statusText);
    }
    else {
      if(response.body["items"]!=null && response.body["items"].length >0) {
        Map<String, dynamic> data = response.body["items"][0];
        return Statistics.fromJson(data["statistics"]);
      }
    }
  }

  Future<Youtuber> getYoutuberInfoById(String channerId) async{
    String url = "/youtube/v3/channels?part=statistics, snippet&key=AIzaSyAL8XNAn9-SkYhI_fwSFeUFgXatm16eJwo&id=$channerId";
    final response = await get(url);
    if(response.status.hasError){
      return Future.error(response.statusText);
    }
    else {
      if(response.body["items"]!=null && response.body["items"].length >0) {
        Map<String, dynamic> data = response.body["items"][0];
        return Youtuber.fromJson(data);
      }
    }
  }
}