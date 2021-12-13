import 'package:flutter/material.dart';

class CommonWidgets {

  static horizontalMargin(double value) => SizedBox(width: value);
  static verticalMargin(double value) => SizedBox(height: value);

  static circularProgress() => const Center(child: CircularProgressIndicator());
}