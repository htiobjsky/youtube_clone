import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class YoutubeDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
            height: 250,
            color: Colors.grey.withOpacity(0.5),
          ),
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
              backgroundImage: Image.network("https://yt3.ggpht.com/ytc/AAUvwnhXW_AiWCgbztaGTQWkpH56AHFhovdMzREKFYHs=s176-c-k-c0x00ffffff-no-rj").image,
            ),
            SizedBox(width: 15,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text("킴스채널", style: TextStyle(fontSize: 18),),
                  Text("구독자 100000", style: TextStyle(fontSize: 14, color: Colors.black.withOpacity(0.5)),),
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

  Widget _bottonZone() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _bottonOne("like", "1000"),
        _bottonOne("dislike", "7"),
        _bottonOne("share", "공유"),
        _bottonOne("save", "저장"),
      ],
    );
  }

  Widget _descriptionZone() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
      child: Text(
        "안녕하세요 킴스튜브 입니다. 키즈월드에 오신걸 환영합니다. 즐거운 시간 보내세요",
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
              "킴즈채널 유투브 영상다시보기",
              style: TextStyle(
                fontSize: 15,
              ),
            ),
            Row(
              children: [
                Text(
                  "조회수 1000회",
                  style: TextStyle(
                      fontSize: 13, color: Colors.black.withOpacity(0.5)),
                ),
                Text(" ﹒ "),
                Text(
                  "2021-05-22",
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
