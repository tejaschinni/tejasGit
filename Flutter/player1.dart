import 'package:flutter/material.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

class AssetPlayer extends StatefulWidget {
  @override
  _AssetPlayerState createState() => _AssetPlayerState();
}

class _AssetPlayerState extends State<AssetPlayer> {

  AssetsAudioPlayer _assetAudioPlayer;

  bool playing;
  double sD = 100;
  double value =0;

  @override
  void initState(){
    super.initState();

    _assetAudioPlayer = AssetsAudioPlayer();

    _assetAudioPlayer.open(
      AssetsAudio(asset: "aewatan.mp3",
      folder: "audio/",)
    );

    _assetAudioPlayer.playOrPause();
    setState(() {
     playing = true; 
    });

    _assetAudioPlayer.current.listen((playinAudio){
      final songDuration = playinAudio.duration;
      print(songDuration.inSeconds);
      sD = songDuration.inSeconds.toDouble();
    });
  }

  void dispose(){
    _assetAudioPlayer = null;
    super.dispose();
  }
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Assets Audio"),
        ),
        body: ListView(
          children: <Widget>[
            Slider(
              value:  value,
              min: 0,
              max: sD,
              onChanged: (double d){
                setState(() {
                 value = d;
                 Duration du = new Duration(seconds: d.toInt());
                 _assetAudioPlayer.seek(du);
                });
              },
            ),
            Container(
              margin: EdgeInsets.all(20),
              child: StreamBuilder(
                stream: _assetAudioPlayer.currentPosition,
                builder: (context,asyncSnapshot){
                  final Duration  duration = asyncSnapshot.data;
                  value =duration.inSeconds.toDouble();
                  return Text(duration.inSeconds.toString());

                },
              ),
            ),
            RaisedButton(
              child: Icon(Icons.play_arrow),
              onPressed: (){
                setState(() {
                  
                });
              },
            )
          ],
        ),
      ),
      
    );
  }
}