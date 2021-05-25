import 'package:get/get.dart';
import 'package:youtube_clone/src/models/youtube_video_result.dart';

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
}