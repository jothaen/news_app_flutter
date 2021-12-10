import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_flutter/di/di.dart';

abstract class BasePageState<S extends Cubit, T extends StatefulWidget> extends State<T> {

  final S cubit = CubitsFactory.get<S>();

}