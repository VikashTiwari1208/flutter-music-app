import 'package:audioplayers/audio_cache.dart';
import 'package:chewie/chewie.dart';
import "package:flutter/material.dart";
import 'package:audioplayers/audioplayers.dart';
import "package:flutter_statusbarcolor/flutter_statusbarcolor.dart";
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

myapp() {
  var video_player = VideoPlayerController.network("https://flutter-videos.s3.ap-south-1.amazonaws.com/jab-tak.mp4");

  var chewieController = ChewieController(
    videoPlayerController: video_player,
    aspectRatio: 1.5,
    autoPlay: true,
    looping: true,
  );
  var audioplay = AudioPlayer();
  var song = AudioCache(fixedPlayer: audioplay);
  play_song() {
    song.play("saki-saki.mp3");
  }

  ;
  pause_song() {
    audioplay.pause();
  }

  ;
  stop_music() {
    audioplay.stop();
  }

  ;
  var myhome = Scaffold(
      appBar: AppBar(
        title: Text(
          "Vik_music",
          style: TextStyle(),
        ),
        centerTitle: true,
        elevation: 10.0,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Icon(
              Icons.library_music,
              color: Colors.deepPurple.shade500,
            ),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 4,
                      child: Card(
              child: Container(
                padding: EdgeInsets.all(10.0),
                child: Image.asset("images/saki-saki.jpg"),
              ),
              elevation: 10.0,
              color: Color.fromARGB(20, 126, 126, 128),
              shadowColor: Color.fromRGBO(185, 120, 150, 10),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Expanded(
            flex: 1,
                      child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.play_circle_filled),
                  onPressed: play_song,
                  iconSize: 55.0,
                  autofocus: true,
                  tooltip: "Play Song",
                ),
                SizedBox(
                  width: 10.0,
                ),
                IconButton(
                  icon: Icon(Icons.pause_circle_filled),
                  onPressed: pause_song,
                  iconSize: 55.0,
                  autofocus: true,
                  tooltip: "Pause-song",
                ),
                SizedBox(
                  width: 10.0,
                ),
                IconButton(
                  icon: Icon(Icons.stop),
                  onPressed: stop_music,
                  highlightColor: Colors.grey.shade600,
                  splashColor: Color.fromARGB(152, 120, 120, 120),
                  iconSize: 55.0,
                  tooltip: "Stop-Music",
                )
              ],
            ),
          ),
          Expanded(
            flex: 6,
                      child: Card(
              child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: Container(
                  child: Chewie(
                    controller: chewieController,
                  ),
                ),
              ),
              elevation: 5.0,
            ),
          ),
        ],
      ));
  var material_design = MaterialApp(
    home: myhome,
    debugShowCheckedModeBanner: false,
  );
  return material_design;
}
