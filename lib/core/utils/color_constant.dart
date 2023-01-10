import 'dart:ui';
import 'package:flutter/material.dart';

class ColorConstant {
  static Color pink300E5 = fromHex('#e5ff5d7b');

  static Color redA20075 = fromHex('#75ff4d67');
  static Color red = fromHex('#FD788C');
  static Color darkBg = fromHex('#1A1B22');
  static Color darkLine = fromHex('#2A2B39');
  static Color darkTextField= fromHex('#23252F');

  static Color bluegray50 = fromHex('#eaeef2');

  static Color blueA400 = fromHex('#2972fe');

  static Color redA4007f = fromHex('#7fff1843');

  static Color gray90099 = fromHex('#9909101d');

  static Color gray90011 = fromHex('#1129292a');

  static Color red200 = fromHex('#ee8f9d');

  static Color bluegray800A3 = fromHex('#a2394451');

  static Color bluegray800A2 = fromHex('#a22b394b');

  static Color redA200B2 = fromHex('#b2ff4d67');
  static Color amber60000 = fromHex('#00ffb800');

  static Color amber60089 = fromHex('#89ffb800');

static Color amber600 = fromHex('#ffb800');

  static Color whiteA70099 = fromHex('#99ffffff');

  static Color black900 = fromHex('#09051c');

  static Color redA10075 = fromHex('#75fc788b');

  static Color gray900A2 = fromHex('#a209101d');

  static Color redA20000 = fromHex('#00ff4d67');

  static Color redA20066 = fromHex('#66ff4d67');

  static Color gray600 = fromHex('#6c7580');

  static Color bluegray8007e = fromHex('#7e394451');

  static Color gray500 = fromHex('#9097a0');

  static Color indigoA20014 = fromHex('#145a6cea');

  static Color redA200 = fromHex('#ff4d67');

  static Color redA100 = fromHex('#fc788b');

  static Color redA400E5 = fromHex('#e5ff1843');


  static Color whiteA700A2 = fromHex('#a2ffffff');

  static Color gray900 = fromHex('#09101d');

  static Color amber200 = fromHex('#ffda7b');

  static Color redA700A2 = fromHex('#a2da1414');

  static Color gray300 = fromHex('#d9dde2');

  static Color redA40019 = fromHex('#19ff1843');

  static Color redA200A2 = fromHex('#a2ff4d67');

  static Color gray100 = fromHex('#f4f6f9');

  static Color redA2004c = fromHex('#4cff4d67');

  static Color bluegray800 = fromHex('#2b394b');

  static Color bluegray700 = fromHex('#535d68');

  static Color bluegray400 = fromHex('#858b94');

  static Color bluegray300 = fromHex('#a4abb3');
  
  static Color whiteA70063 = fromHex('#63ffffff');

 

  static Color whiteA7007e = fromHex('#7effffff');

  static Color redA20019 = fromHex('#19ff4d67');

  static Color whiteA70090 = fromHex('#90ffffff');

  static Color whiteA700 = fromHex('#ffffff');

  static Color redA2008a = fromHex('#8aff4d4f');


  static Color blue300 = fromHex('#6399ff');

  static Color redA100A2 = fromHex('#a2fc788b');

  static Color indigo600 = fromHex('#3c5a9a');

  static Color redA20033 = fromHex('#33ff4d67');

  static Color redA700 = fromHex('#da1414');

  static Color redA70089 = fromHex('#89da1414');

  static Color redA70000 = fromHex('#00da1414');

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
