import 'package:flutter/material.dart';
const Color _customColor = Color(0xF4A8AA3A);

const List<Color> _colorThemes = [
  _customColor,
  Colors.black,
  Colors.red,
  Colors.blue,
  Colors.yellow,
  Colors.orange,
  Colors.pink
];

class AppTheme {
  final int selectedColor;

  AppTheme({
    this.selectedColor = 0  
  }):assert(selectedColor >= 0 && selectedColor <= _colorThemes.length -1, 'Color s must be between 0 and ${_colorThemes.length}');

  ThemeData theme() {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _colorThemes[selectedColor]
    );
  }
}
