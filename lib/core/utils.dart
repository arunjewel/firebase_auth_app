import 'package:flutter/material.dart';

toPage(BuildContext context, Widget widget) {
  return Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => widget));
}
toPageRemoveUntil(BuildContext context, Widget widget){
  return Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) =>  widget),
          (Route<dynamic> route) => false);
}