import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

extension ContextValues on BuildContext{
  ThemeData get theme=> Theme.of(this);
}


extension ThemeQuickColors on ThemeData{
  Color get primary => colorScheme.primary;
  Color get secondary => colorScheme.secondary;
  Color get background => colorScheme.surface;

}