import 'dart:math';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<Color> colors;
  FontWeight fontWeight = FontWeight.bold;
  int clickCount = 0;

  @override
  void initState() {
    super.initState();
    changeBackgroundColor();
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

  

  void incrementClickCount() {
    setState(() {
      clickCount++;
    });
    if (clickCount == 5) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.black,
          duration: Duration(seconds: 2),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          content: Text(
            '5x clicked, continue...',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      );
    }
    if (clickCount == 10) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.black,
          duration: Duration(seconds: 2),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          content: Text(
            '10x clicked, almost there...',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      );
    }
    if (clickCount == 15) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              icon: const Icon(Icons.verified),
              title: const Text("Congratulations!"),
              content: const Text("You've come this far!"),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    setState(() {
                      clickCount = 0;
                    });
                    Navigator.of(context).pop();
                  },
                  child: const Text("Reset"),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("Close"),
                ),
              ],
            );
          });
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
  }
}
