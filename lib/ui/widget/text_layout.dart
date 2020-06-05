import 'package:flutter/material.dart';

class TextLayout extends StatelessWidget {
  final String text;
  final double fontSize;
  final int maxLine;
  final FontWeight fontWeight;
  final Color color;
  final TextAlign align;

  const TextLayout(
      {@required this.text,
        @required this.maxLine,
        @required this.align,
      @required this.fontSize,
      @required this.color, 
      @required this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 3.0, horizontal: 5.0),
      child: Text(
        text,
        textAlign: align,
        overflow: TextOverflow.ellipsis,
        maxLines: maxLine,
        style: TextStyle(
            fontSize: fontSize, color: color, fontWeight: fontWeight),
      ),
    );
  }
}
