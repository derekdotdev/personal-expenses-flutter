import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AdaptiveFlatButton extends StatelessWidget {
  final String label;
  final Function iOSFunction;
  final Function androidFunction;

  const AdaptiveFlatButton(this.label, this.iOSFunction, this.androidFunction);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            child: Text(
              label,
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: () => iOSFunction(),
          )
        : TextButton(
            onPressed: () => androidFunction(),
            child: Text(
              'Choose Date',
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
  }
}
