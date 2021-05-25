import 'package:youtube_clone/src/models/video.dart';
import 'statistics.dart';

class Youtuber {
  Youtuber({
    this.snippet,
    this.statistics,
  });

  Snippet snippet;
  Statistics statistics;

  factory Youtuber.fromJson(Map<String, dynamic> json) => Youtuber(
    snippet: Snippet.fromJson(json["snippet"]),
    statistics: Statistics.fromJson(json["statistics"]),
  );

  Map<String, dynamic> toJson() => {
    "snippet" : snippet,
    "statistics" : statistics,
  };
}