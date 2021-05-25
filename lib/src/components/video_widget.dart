import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_clone/src/controller/video_controlloer.dart';
import 'package:youtube_clone/src/models/video.dart';
import 'package:intl/intl.dart';

class VideoWidget extends StatefulWidget {
  final Video video;

  const VideoWidget({Key key, this.video}) : super(key: key);

  @override
  _VideoWidgetState createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {
  VideoController _videoController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   _videoController = Get.put(VideoController(video: widget.video), tag: widget.video.id.videoId);
  }

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
      child: Image.network(
        widget.video.snippet.thumbnails.medium.url,
        fit: BoxFit.fitWidth,
      ),
    );
  }

  Widget _simpleDetailinfo() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Row(
          children: [
            Obx(()=>CircleAvatar(
              radius: 25,
              backgroundColor: Colors.grey.withOpacity(0.5),
              backgroundImage: Image.network(
                      _videoController.YoutuberThumbnailUrl,)
                  .image,
            ),
            ),
            SizedBox(
              width: 15,
            ),
            Expanded(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          widget.video.snippet.title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.more_vert,
                          size: 18,
                        ),
                        onPressed: () {},
                        alignment: Alignment.topCenter,
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        widget.video.snippet.channelTitle,
                        style: TextStyle(
                            fontSize: 12, color: Colors.black.withOpacity(0.8)),
                      ),
                      Text(" ﹒ "),
                      Obx(()=>
                      Text(
                        _videoController.viewCountString,
                        style: TextStyle(
                            fontSize: 12, color: Colors.black.withOpacity(0.6)),
                      ),
                      ),
                      Text(" ﹒ "),
                      Text(
                        DateFormat("yyyy-MM-dd")
                            .format(widget.video.snippet.publishedAt),
                        style: TextStyle(
                            fontSize: 12, color: Colors.black.withOpacity(0.6)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
