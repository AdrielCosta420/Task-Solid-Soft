# Task Solid Software.

This project was developed as a task proposed by Solid Software. In order to analyze the technical performance.
This is a Flutter app that modifies the background color according to the user's touch anywhere on the screen. Furthermore, it was added
an incremental counter when the user touches the screen. When the user reaches 5, 10 and 15 touches, a SnackBar is displayed.

## Getting Started

To get started with this project, clone the repository and open it in your preferred text editor.

git clone https://github.com/AdrielCosta420/Task-Solid-Soft.git
cd task_solid_soft
code .

## Running the App

To run the app, you will need to have an emulator or a physical device connected. Then, run the following command:

flutter run

## Features
This app has the following features:

Characteristics
This app has the following features:

Change background color on tap

A "Hello There" text in the middle of the screen

When clicking anywhere on the screen, the text changes weight

Show a SnackBar when user reaches 5, 10, and 15 taps

Increment counter on tap

Reset the counter with the "reset" button, or close with "close" and keep clicking on the screen.

## Code Overview

The HomeScreen widget is the main widget in this app. It contains the background color, one text and counter, 

The counter is incremented in the incrementClickCount function. This function also displays the SnackBar when the user reaches 5, 10, and 15 taps.

The background color is changed in the changeBackgroundColor function. This function generates two random colors and sets them as the background color.

The reset button is implemented in the build method of the HomeScreen widget. It is only visible when the user reaches 15 taps.
