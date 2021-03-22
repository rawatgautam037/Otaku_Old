import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:otaku/main.dart';

void main() => runApp(IntroductionPage());

class IntroductionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AnimatedSplashScreen(
        splash: Image.asset('images/loading.gif'),
        backgroundColor: Colors.white,
        nextScreen: App(),
        splashTransition: SplashTransition.fadeTransition,
        duration: 8000,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OTAKU',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: OnBoardingPage(),
    );
  }
}

class OnBoardingPage extends StatefulWidget {
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => Homepage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle =
        TextStyle(fontSize: 19.0, color: Color.fromRGBO(252, 134, 33, 1));
    const pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(
          fontSize: 28.0,
          fontWeight: FontWeight.w700,
          color: Color.fromRGBO(194, 73, 20, 1)),
      bodyTextStyle: bodyStyle,
      descriptionPadding: EdgeInsets.fromLTRB(16.0, 10.0, 16.0, 16.0),
      pageColor: Color.fromRGBO(19, 7, 36, 1),
      imagePadding: EdgeInsets.only(top: 40),
      titlePadding: EdgeInsets.only(top: 10),
    );

    return Stack(
      children: [
        IntroductionScreen(
          key: introKey,
          pages: [
            PageViewModel(
              title: "Welcome to Otaku",
              body: "Discover the world of Anime",
              image: Image.asset('images/1.png'),
              decoration: pageDecoration,
            ),
            PageViewModel(
              title: "Movies and Shows",
              body: "Watch Anime Series and Movies for free",
              image: Image.asset('images/2.png'),
              decoration: pageDecoration,
            ),
            PageViewModel(
              title: "Ongaku",
              body: "Catch up with Latest Anime OST's",
              image: Image.asset('images/7.png'),
              decoration: pageDecoration,
            ),
            PageViewModel(
              title: "Manga",
              body: "Read your favourite Manga Online",
              image: Image.asset('images/12.png'),
              decoration: pageDecoration,
            ),
            PageViewModel(
              title: "Manga",
              body: "Read your favourite Manga Online",
              image: Image.asset('images/9.png'),
              decoration: pageDecoration,
            ),
            PageViewModel(
              title: "Animo",
              body: "Make new friends",
              image: Image.asset('images/15.png'),
              decoration: pageDecoration,
            ),
          ],
          onDone: () => _onIntroEnd(context),
          //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
          showSkipButton: true,
          skipFlex: 0,
          nextFlex: 0,
          skip: const Text('Skip', style: TextStyle(color: Colors.pink)),
          next: const Icon(Icons.arrow_forward, color: Colors.pink),
          done: const Text('Done',
              style:
                  TextStyle(fontWeight: FontWeight.w600, color: Colors.pink)),
          dotsDecorator: const DotsDecorator(
            size: Size(10.0, 10.0),
            color: Color.fromRGBO(234, 151, 173, 1),
            activeSize: Size(22.0, 10.0),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(25.0),
              ),
            ),
            activeColor: Color.fromRGBO(4, 87, 98, 1),
          ),
        ),
        Align(
          alignment: FractionalOffset.bottomCenter,
          child: Container(
            padding: EdgeInsets.only(bottom: 90),
            child: Image(
              image: AssetImage('images/1.gif'),
              height: 100,
            ),
          ),
        ),
      ],
    );
  }
}
