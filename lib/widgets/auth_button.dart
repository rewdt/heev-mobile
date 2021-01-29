import 'package:flutter/material.dart';

authbutton({title, isLoading, handlePress, progressSize = 30.00}) {
  return ElevatedButton(
    child: !isLoading
        ? Text(
            title,
            style: const TextStyle(
                color: Color(0xffffffff),
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.normal,
                fontSize: 13.0),
          )
        : SizedBox(
            height: progressSize,
            width: progressSize,
            child: CircularProgressIndicator(
              backgroundColor: Colors.transparent,
              valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
            )),
    onPressed: !isLoading ? handlePress : null,
    style: ElevatedButton.styleFrom(
      primary: const Color(0xfff24e86),
      onPrimary: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  );
}
