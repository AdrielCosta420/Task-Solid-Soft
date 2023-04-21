import 'dart:math';
import 'package:flutter/material.dart';

/// A stateful widget representing the home screen of the application.

class HomeScreen extends StatefulWidget {
  /// Creates a new instance of [HomeScreen].
  ///
  /// The [key] parameter is used for widget identification. It is optional and
  /// if omitted, no [Key] is associated with this widget.
  const HomeScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //A list of colors used for the background gradient
  List<Color> colors = [];

  //The font weight used for the "Hello There" text.
  FontWeight fontWeight = FontWeight.bold;

  //The number of times the screen has been tapped.
  int clickCount = 0;

  ///The number of taps required to display first snackbar message.
  final int fiveClicks = 5;

  ///The number of taps required to display the second snackbar message.
  final int tenClicks = 10;

  ///The number of taps required to display the congratulations dialog.
  final int fifteenCliks = 15;

  ///The font size used for the "Hello There" text.
  final double fontSize = 32;

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
        body: DecoratedBox(
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
                fontSize: fontSize,
                fontWeight: fontWeight,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  ///Changes the background color of this widget to a random gradient, and
  /// also changes the font weight to a random value
  Future<void> changeBackgroundColor() async {
    /// Generate two random colors to create a gradient
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

    /// Choose a random font weight
    final fontWeights = [FontWeight.bold, FontWeight.normal, FontWeight.w300];
    final randomFontWeight = fontWeights[random.nextInt(fontWeights.length)];

    setState(() {
      ///Update state to rebuild with new colors and font weight.
      colors = [firstColor, secondColor];
      fontWeight = randomFontWeight;
    });
  }

  /// Update state and check if clickCount has reached a certain threshold.
  void incrementClickCount() {
    setState(() {
      clickCount++;
    });
    if (clickCount == fiveClicks) {
      showSnackBarMessage('5x clicked, continue...');
    }
    if (clickCount == tenClicks) {
      showSnackBarMessage('10x clicked, almost there...');
    }
    if (clickCount == fifteenCliks) {
      showDialog<Widget>(
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
        },
      );
    }
  }

  ///Show a snackbar at each milestone
  void showSnackBarMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.black,
        duration: const Duration(seconds: 2),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        content: Text(
          message,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
