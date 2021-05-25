import 'package:cached_network_image/cached_network_image.dart';
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
    _videoController = Get.put(VideoController(video: widget.video),
        tag: widget.video.id.videoId);
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          color: Colors.grey.withOpacity(0.5),
          child: CachedNetworkImage(
            imageUrl: widget.video.snippet.thumbnails.medium.url,
            placeholder: (context, url) => Container(
              height: 230,
              child: Center(child: CircularProgressIndicator()),
            ),
            fit: BoxFit.fitWidth,
            // child: Image.network(
            //   widget.video.snippet.thumbnails.medium.url,
            //   fit: BoxFit.fitWidth,
          ),
        ),
      ],
    );
  }

  Widget _simpleDetailinfo() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Row(
          children: [ //render overflow
            // Obx(() {
            //   if(_videoController.YoutuberThumbnailUrl == null)
            //     return Center(child: CircularProgressIndicator());
            //   else
            //     return CircleAvatar(
            //           radius: 25,
            //           backgroundColor: Colors.grey.withOpacity(0.5),
            //           backgroundImage: Image.network(
            //             _videoController.YoutuberThumbnailUrl,
            //           ).image,
            //         );
            // }),
            // Obx(
            //   () => CircleAvatar(
            //     radius: 25,
            //     backgroundColor: Colors.grey.withOpacity(0.5),
            //     backgroundImage: Image.network(
            //       _videoController.YoutuberThumbnailUrl,
            //     ).image,
            //   ),
            // ),
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
                      Obx(
                        () => Text(
                          _videoController.viewCountString,
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.black.withOpacity(0.6)),
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
