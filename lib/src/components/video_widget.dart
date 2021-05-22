import 'package:flutter/material.dart';

class VideoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          _thumbnail(),
          _simpleDetailinfo(),
        ],
      ),
    );
  }

  Widget _thumbnail() {
    return Container(
      height: 250,
      color: Colors.grey.withOpacity(0.5),
    );
  }

  Widget _simpleDetailinfo() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: Colors.grey.withOpacity(0.5),
              backgroundImage: Image.network("https://yt3.ggpht.com/ytc/AAUvwnhXW_AiWCgbztaGTQWkpH56AHFhovdMzREKFYHs=s176-c-k-c0x00ffffff-no-rj").image,
            ),
            SizedBox(width: 15,),
            Expanded(child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text("Kim's channel 다시 보기 Kim's channel 다시 보기 Kim's channel 다시 보기 Kim's channel 다시 보기",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,),
                    ),
                    IconButton(icon: Icon(Icons.more_vert,size: 18,), onPressed: (){}, alignment: Alignment.topCenter,)
                  ],
                ),
                Row(
                  children: [
                    Text("킴스튜브", style: TextStyle(fontSize: 12, color: Colors.black.withOpacity(0.8)),),
                    Text(" ﹒ "),
                    Text("조회수 : 1000회", style: TextStyle(fontSize: 12, color: Colors.black.withOpacity(0.6)),),
                    Text(" ﹒ "),
                    Text("2021-05-22", style: TextStyle(fontSize: 12, color: Colors.black.withOpacity(0.6)),),
                  ],
                ),
              ],
            ),),
          ],
        ),
      ),
    );
  }
}
