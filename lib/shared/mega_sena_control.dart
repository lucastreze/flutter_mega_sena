import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MegaSenaControl extends StatelessWidget {
  final IconData icon;
  final Color color;
  final Function action;

  MegaSenaControl({
    @required this.icon,
    @required this.action,
    this.color = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: const ShapeDecoration(
        color: Colors.grey,
        shape: CircleBorder(),
      ),
      child: IconButton(
        icon: Icon(icon),
        color: Colors.black,
        onPressed: action,
      ),
    );
  }
}
