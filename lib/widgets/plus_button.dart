import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlusButton extends StatefulWidget {
  final Function _handleWithTapButton;
  PlusButton(this._handleWithTapButton);
  @override
  _PlusButtonState createState() => _PlusButtonState();
}

class _PlusButtonState extends State<PlusButton> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        child: Icon(Icons.add, color: Colors.white, size: 70.0),
        onTap: () {
          setState(() {
            widget._handleWithTapButton();
          });
        },
      ),
    );
  }
}
