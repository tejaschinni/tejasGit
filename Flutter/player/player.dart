import 'package:flutter/material.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AudioPlayer extends StatefulWidget {
  @override
  _AudioPlayerState createState() => _AudioPlayerState();
}

class _AudioPlayerState extends State<AudioPlayer> {


  AssetsAudioPlayer _assetsAudioPlayer;
   bool playing;
   double sD = 100;
   double value = 0;
  @override

  void initState(){
    super.initState();

    _assetsAudioPlayer =AssetsAudioPlayer();

    _assetsAudioPlayer.open(
      AssetsAudio(asset: "aewatan.mp3",
      folder: "audio/")
    );

    _assetsAudioPlayer.playOrPause();
    setState(() {
     playing =true; 
    });

    _assetsAudioPlayer.current.listen((playingAudio){
      final songDuration = playingAudio.duration;
      print(songDuration.inSeconds);
      sD = songDuration.inSeconds.toDouble();

    });
   getColorValue();
  }

  Color bg;

  addColorToSF(String color) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('bgcolor', color);
  }

  getColorValue() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String color = prefs.getString('bgcolor');
    setState(() {
     if(color == "red"){
       bg = Colors.red;
     } else if(color == "green"){
       bg = Colors.green;
     }
     if(color == "blue"){
       bg = Colors.blue;
     }
    });
  }
  

  void dispose(){
    _assetsAudioPlayer = null;
    super.dispose();
  }
  
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: bg,
      appBar: AppBar(
        title: Text("Audio Player"),
      ),
      body: ListView(
        children: <Widget>[
          Slider(
            value: value,
            min: 0,
            max: sD,
            onChanged: (double d){
              setState(() {
               value = d; 
               Duration du = new Duration(seconds: d.toInt());
               _assetsAudioPlayer.seek(du);
              });
            },
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: StreamBuilder(
              stream: _assetsAudioPlayer.currentPosition,
              builder: (context,asyncSnapshot){
                final Duration duration = asyncSnapshot.data;
                value = duration.inSeconds.toDouble();
                return Text(duration.inSeconds.toString());
              },
            ),
          ),
          RaisedButton(
            child: Icon(Icons.play_arrow),
            onPressed: (){
              
              setState(() {
                _assetsAudioPlayer.playOrPause();
               playing = true; 
              });

            },
          ),
          RaisedButton(
            child: Icon(Icons.pause),
            onPressed: (){
              
              setState(() {
                _assetsAudioPlayer.pause();
               playing = false; 
              });
            },
          ),
          RaisedButton(
            child: Icon(Icons.stop),
            onPressed: (){
              _assetsAudioPlayer.stop();
              setState(() {                
               Duration du = new Duration(seconds:0);
              _assetsAudioPlayer.seek(du); 
              playing = true;
              value = 0;
              });
            },
          ),
          RaisedButton(
            child: Text("red"),
            onPressed: (){
              setState(() {
              bg =Colors.red;
              });
              addColorToSF("red");
            },
          ),
          RaisedButton(
            child: Text("green"),
            onPressed: (){
              setState(() {
              bg =Colors.green;
              });
              addColorToSF("green");
            },
          ),
          RaisedButton(
            child: Text("blue"),
            onPressed: (){
              setState(() {
              bg =Colors.blue;
              });
              addColorToSF("blue");
            },
          ),
        ],
      ),
    ),
    );
  }
}