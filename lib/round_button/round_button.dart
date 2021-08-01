import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  RoundButton(
      {@required this.text,
      @required this.function,
      this.color,
      this.elevation});

  final String? text;
  final Color? color;
  final double? elevation;
  final Function()? function;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
      child: Material(
        elevation: elevation!,
        color: color!,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: function,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            '$text',
          ),
        ),
      ),
    );
  }
}
