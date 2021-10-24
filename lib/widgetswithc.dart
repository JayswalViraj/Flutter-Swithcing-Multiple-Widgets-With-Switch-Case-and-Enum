import 'package:flutter/material.dart';
import 'dart:ui';

enum containers{blue, red }

class WidgetSwitch extends StatefulWidget {
  const WidgetSwitch({Key? key}) : super(key: key);

  @override
  _WidgetSwitchState createState() => _WidgetSwitchState();
}

class _WidgetSwitchState extends State<WidgetSwitch> {
  containers selectedContainer = containers.red;

  Color getColor(Set  states) {
    const Set  interactiveStates =  {
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.blue;
    }
    return Colors.red;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ElevatedButton(
            onPressed: () {
              setState(() {
                selectedContainer = containers.blue;
              });
            },
            child: Text("Blue")),
        ElevatedButton(

          style: ElevatedButton.styleFrom(
        primary: Colors.red
        ),

            onPressed: () {
              setState(() {
                selectedContainer = containers.red;
              });
            },
            child: Text("Red")),
        switching(),
      ],
    );
  }

  Widget switching() {
    switch (selectedContainer) {
      case containers.blue:
        return blue();
      case containers.red:
        return red();
    }
  }

  Widget red() {
    return Container(
      color: Colors.red,
      width: 100,
      height: 100,
    );
  }

  Widget blue() {
    return Container(
      color: Colors.blue,
      width: 100,
      height: 100,
    );
  }
}
