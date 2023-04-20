import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
 {
  //late Color backgroundColor;
  late List<Color> colors;
  FontWeight fontWeight = FontWeight.bold;
  int clickCount = 0;


  @override
  void initState() {
    super.initState();
    colors = [
      const Color.fromRGBO(47, 10, 155, 1),
      const Color.fromRGBO(79, 51, 150, 1),
    ];
   
    // backgroundColor = Colors.white;
  }


  void incrementClickCount() {
    setState(() {
      clickCount++;
    });
    if (clickCount == 5) {
      ScaffoldMessenger.of(context).showSnackBar(
      const  SnackBar(
        
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.black,
          duration: Duration(seconds: 3),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          content: Text(
            '5x clicado, continue...',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      );
    } if(clickCount == 10) {
      ScaffoldMessenger.of(context).showSnackBar(
      const  SnackBar(
        
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.black,
          duration: Duration(seconds: 3),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          content: Text(
            '10x clicado, quase lá...',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      );
    }
  }

  void changeBackgroundColor() {
    final random = Random();
    final firstColor = Color.fromRGBO(
      random.nextInt(255),
      random.nextInt(255),
      random.nextInt(255),
      1,
    );
    final secondColor = Color.fromRGBO(
      random.nextInt(255),
      random.nextInt(255),
      random.nextInt(255),
      1,
    );
    final fontWeights = [FontWeight.bold, FontWeight.normal, FontWeight.w300];
    final randomFontWeight = fontWeights[random.nextInt(fontWeights.length)];
    setState(() {
      colors = [firstColor, secondColor];
      fontWeight = randomFontWeight;
    });
    //  final random = Random();
    // final red = random.nextInt(255);
    // final green = random.nextInt(255);
    // final blue = random.nextInt(255);
    // setState(() {
    //   backgroundColor = Color.fromRGBO(red, green, blue, 1);
    // });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        changeBackgroundColor();
        incrementClickCount();
      },
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: colors,
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Center(
            child: Text(
              'Hello There',
              style: TextStyle(
                fontSize: 32,
                fontWeight: fontWeight,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
