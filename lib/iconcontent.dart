import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'constants.dart';

class IconContent extends StatelessWidget {
  final IconData icon;
  final String text;
  const IconContent({
    Key key,
    @required this.icon,
    @required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
    FaIcon(
      icon, 
      size: 85.0
      ),
    Text(
    text, 
    style: iconTextStyle
    ),
      ],
                  );
  }
}

TextStyle iconTextStyle = TextStyle(
fontSize: 45, 
color: Colors.grey
);