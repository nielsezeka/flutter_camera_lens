import 'package:flutter/material.dart';
import 'package:typicons_flutter/typicons_flutter.dart';

class PlaceHolder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Theme.of(context).backgroundColor,
        child: IconButton(
          icon: Icon(
            Typicons.camera,
            size: 50,
            color: Theme.of(context).accentColor,
          ),
          onPressed: () {},
        ));
  }
}
