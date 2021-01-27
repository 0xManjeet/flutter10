import 'package:flutter/material.dart';

Widget boldText({@required String text, double size, Color color}) => Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: size ?? 16,
        color: color ?? Colors.black87,
      ),
    );

Widget regularText({@required String text, double size, Color color}) => Text(
      text,
      style: TextStyle(
        fontSize: size ?? 16,
        color: color ?? Colors.black87,
      ),
    );
