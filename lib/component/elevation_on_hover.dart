import 'package:flutter/material.dart';

class ElevatorOnHover extends StatefulWidget {
  final Widget child;

  const ElevatorOnHover({Key key, this.child}) : super(key: key);
  @override
  _ElevatorOnHoverState createState() => _ElevatorOnHoverState();
}

class _ElevatorOnHoverState extends State<ElevatorOnHover> {
  final nonHoverTransform = Matrix4.identity()..translate(0, 0, 0);
  final hoverTransform = Matrix4.identity()..translate(0, -10, 0);
  bool hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) => mouseEnter(true),
      onExit: (event) => mouseEnter(false),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        child: widget.child,
        transform: hovering ? hoverTransform : nonHoverTransform,
      ),
    );
  }

  void mouseEnter(bool hover) {
    setState(() {
      hovering = hover;
    });
  }
}
