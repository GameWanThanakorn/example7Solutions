import 'package:flutter/material.dart';

enum TypeFibonacci { circle, square, cross }

extension IconsDataExtensions on TypeFibonacci {
  IconData get iconsData {
    return switch (this) {
      TypeFibonacci.circle => Icons.circle,
      TypeFibonacci.cross => Icons.close,
      TypeFibonacci.square => Icons.square_outlined,
    };
  }
}
