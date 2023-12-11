//colors
import 'package:flutter/material.dart';

const blackColor = Colors.black;

// size
double screenHeight = 0;
double screenWidth = 0;
void sizeInitializing(BuildContext context) {
  screenHeight = MediaQuery.of(context).size.height;
  screenWidth = MediaQuery.of(context).size.width;
}
