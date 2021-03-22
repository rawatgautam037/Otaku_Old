import 'dart:async';
import 'dart:ui';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:otaku/main.dart';
import 'package:video_player/video_player.dart';
import 'package:otaku/pages/controllers/authentications.dart';
import 'package:otaku/pages/Manga/mangahomepage.dart';
import 'package:otaku/pages/Ongaku/ongakuhomepage.dart';
import 'package:otaku/pages/movies and series/moviesandserieshomepage.dart';
import 'package:otaku/pages/Animo/animohomepage.dart';
import 'package:animated_splash/animated_splash.dart';

class Selectionpage extends StatefulWidget {
  final String uid;

  Selectionpage({Key key, @required this.uid}) : super(key: key);

  @override
  _SelectionpageState createState() => _SelectionpageState(uid);
}

class _SelectionpageState extends State<Selectionpage> {
  VideoPlayerController _contoller;
  final String uid;
  _SelectionpageState(this.uid);
  int indexpage = 0;

  @override
  void initState() {
    super.initState();
    _contoller = VideoPlayerController.asset('videos/2.mp4')
      ..initialize().then((_) {
        setState(() {});
      });
    _contoller.play();
    _contoller.setLooping(true);
    _contoller.setVolume(0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(fit: StackFit.expand, children: <Widget>[
        Container(
          child: _contoller.value.initialized
              ? AspectRatio(
                  aspectRatio: _contoller.value.aspectRatio,
                  child: VideoPlayer(_contoller),
                )
              : Container(),
        ),
        AppBar(
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(color: Colors.white),
          elevation: 0.0,
          brightness: Brightness.dark,
          title:
              Text("Otaku", style: TextStyle(color: Colors.pink, fontSize: 25)),
          centerTitle: true,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => MoviesAndSeriesHomepage()));
              },
              child: SlideInLeft(child: Series()),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => MangaHomepage()));
              },
              child: Manga(),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => OngakuHomepage()));
              },
              child: Ongaku(),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => AnimoHomepage()));
              },
              child: SlideInRight(child: Animo()),
            )
          ],
        ),
      ]),
      bottomNavigationBar: CurvedNavigationBar(
        height: 55,
        color: Color.fromRGBO(19, 11, 32, 1),
        backgroundColor: Colors.pink.shade500,
        buttonBackgroundColor: Colors.white,
        items: <Widget>[
          Icon(Icons.favorite, color: Colors.pink),
          Icon(Icons.download_done_sharp, color: Colors.pink),
          Icon(Icons.list, color: Colors.pink),
          Icon(Icons.exit_to_app, color: Colors.pink),
        ],
        onTap: (index) {
          if (index == 0) {
            Timer(Duration(milliseconds: 500), () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => OngakuHomepage()));
            });
          } else if (index == 1) {
            Timer(Duration(milliseconds: 500), () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => OngakuHomepage()));
            });
          } else if (index == 2) {
            Timer(Duration(milliseconds: 500), () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => OngakuHomepage()));
            });
          } else if (index == 3) {
            Timer(Duration(milliseconds: 500), () {
              signOutUser().then((value) {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => Homepage()),
                    (Route<dynamic> route) => false);
              });
            });
          }
        },
      ),
    );
  }
}

class Series extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: <Widget>[
          new Container(
            padding: EdgeInsets.only(top: 20),
            height: 100.0,
            width: 300.0,
            color: Colors.transparent,
            child: Container(
                decoration: BoxDecoration(
                    color: Color.fromRGBO(35, 21, 57, 0.8),
                    borderRadius: BorderRadius.all(Radius.circular(15.0))),
                child: new Center(
                  child: new Text(
                    "Movies And Series",
                    style: TextStyle(
                      color: Colors.yellow.shade200,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  ),
                )),
          ),
          Positioned(
            top: 10,
            left: -35,
            width: 100,
            height: 100,
            child: Image.asset("images/3.png", height: 100, width: 100),
          ),
        ],
        overflow: Overflow.visible,
      ),
    );
  }
}

class Manga extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: <Widget>[
          new Container(
            padding: EdgeInsets.only(top: 20),
            height: 100.0,
            width: 300.0,
            color: Colors.transparent,
            child: Container(
                decoration: BoxDecoration(
                    color: Color.fromRGBO(35, 21, 57, 0.8),
                    borderRadius: BorderRadius.all(Radius.circular(15.0))),
                child: new Center(
                  child: new Text(
                    "Manga",
                    style: TextStyle(
                      color: Colors.yellow.shade200,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  ),
                )),
          ),
          Positioned(
            top: 10,
            left: -35,
            width: 100,
            height: 100,
            child: Image.asset("images/6.png", height: 100, width: 100),
          ),
        ],
        overflow: Overflow.visible,
      ),
    );
  }
}

class Ongaku extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: <Widget>[
          new Container(
            padding: EdgeInsets.only(top: 20),
            height: 100.0,
            width: 300.0,
            color: Colors.transparent,
            child: Container(
                decoration: BoxDecoration(
                    color: Color.fromRGBO(35, 21, 57, 0.8),
                    borderRadius: BorderRadius.all(Radius.circular(15.0))),
                child: new Center(
                  child: new Text(
                    "Ongaku",
                    style: TextStyle(
                      color: Colors.yellow.shade200,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  ),
                )),
          ),
          Positioned(
            top: 20,
            left: -28,
            width: 85,
            height: 85,
            child: Image.asset("images/4.ico", height: 100, width: 100),
          ),
        ],
        overflow: Overflow.visible,
      ),
    );
  }
}

class Animo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: <Widget>[
          new Container(
            padding: EdgeInsets.only(top: 20),
            height: 100.0,
            width: 300.0,
            color: Colors.transparent,
            child: Container(
                decoration: BoxDecoration(
                    color: Color.fromRGBO(35, 21, 57, 0.8),
                    borderRadius: BorderRadius.all(Radius.circular(15.0))),
                child: new Center(
                  child: new Text(
                    "Animo",
                    style: TextStyle(
                      color: Colors.yellow.shade200,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  ),
                )),
          ),
          Positioned(
            left: -25,
            width: 115,
            height: 115,
            child: Image.asset("images/5.png", height: 100, width: 100),
          ),
        ],
        overflow: Overflow.visible,
      ),
    );
  }
}
