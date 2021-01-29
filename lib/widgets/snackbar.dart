import 'package:flutter/material.dart';

snackbar({content, color}) {
  return SnackBar(
    content: Text(content),
    backgroundColor: color,
    duration: Duration(seconds: 5),
  );
}
