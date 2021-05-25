import 'package:flutter/material.dart';
import 'package:youtube_clone/src/models/video.dart';
import 'package:intl/intl.dart';

class VideoWidget extends StatelessWidget {
  final Video video;

  const VideoWidget({Key key, this.video}) : super(key: key);

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
      child: Image.network(video.snippet.thumbnails.medium.url, fit: BoxFit.fitWidth,),
    );
  }

  Widget _simpleDetailinfo() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Row(
          children: [
            CircleAvatar(
              radius: 25,
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
                      child: Text(video.snippet.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,),
                    ),
                    IconButton(icon: Icon(Icons.more_vert,size: 18,), onPressed: (){}, alignment: Alignment.topCenter,)
                  ],
                ),
                Row(
                  children: [
                    Text(video.snippet.channelTitle, style: TextStyle(fontSize: 12, color: Colors.black.withOpacity(0.8)),),
                    Text(" ﹒ "),
                    Text("조회수 : 9000회", style: TextStyle(fontSize: 12, color: Colors.black.withOpacity(0.6)),),
                    Text(" ﹒ "),
                    Text(
                      DateFormat("yyyy-MM-dd").format(video.snippet.publishedAt),
                      style: TextStyle(fontSize: 12, color: Colors.black.withOpacity(0.6)),),
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
