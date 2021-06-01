import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:youtube_clone/src/models/youtube_video_result.dart';
import 'package:youtube_clone/src/repository/youtube_repository.dart';

class YoutubeSearchController extends GetxController {
  String key = "SearchKey";
  RxList<String> history = RxList<String>.empty(growable: true);
  //RxList<String> history = [""].obs;
  SharedPreferences profs;
  String _currentKeyWord;
  //Set<String> originHistory = {};
  Rx<YoutubeVideoResult> youtubeVideoResult = YoutubeVideoResult(items: []).obs;
  ScrollController scrollController = ScrollController();

  @override
  void onInit() async{
    // TODO: implement onInit
    super.onInit();
    _event();
    profs =  await SharedPreferences.getInstance();
    List<dynamic> initData = profs.get(key) ?? [];
    //originHistory.addAll(initData.map((_)=> _.toString()).toList());
    //history(originHistory.toList());
    history(initData.map((_)=> _.toString()).toList());
    // String value = (profs.get("key") as String);
    // profs.setStringList("key", ["킴즈채널"]);
    // print(value);
  }

  void _event() {
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent
          && youtubeVideoResult.value.nextPagetoken != ""
      ) {

        _searchYoutube(_currentKeyWord);
        print("로드");
      }
    });
  }

  void search(String search) {
    history.addIf(!history.contains(search), search);
    profs.setStringList(key, history);
    _currentKeyWord = search;
    _searchYoutube(search);


    // history.clear();
    // originHistory.add(search);
    // history.addAll(originHistory.toList());
    // profs.setStringList(key, originHistory.toList());
  }

  void _searchYoutube(String searchKey) async{
    YoutubeVideoResult youtubeVideoResultFromServer = await YoutubeRepository.to.search(searchKey, youtubeVideoResult.value.nextPagetoken ?? "");
    //youtubeVideoResult(youtubeVideoResultFromServer);
    //print(youtubeVideoResultFromServer.items.length);

    if (youtubeVideoResultFromServer != null &&
        youtubeVideoResultFromServer.items != null &&
        youtubeVideoResultFromServer.items.length > 0) {
      youtubeVideoResult.update((youtube) {
        youtube.nextPagetoken = youtubeVideoResultFromServer.nextPagetoken;
        youtube.items.addAll(youtubeVideoResultFromServer.items);
      });
    }
  }
}