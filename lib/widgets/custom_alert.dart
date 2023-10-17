import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

customAlert(
  BuildContext context,
  String subtitle,

) {
  if (Platform.isAndroid) {
    return showDialog(
      useSafeArea: true,
      context: context,
      builder: (_) => AlertDialog(
        actionsAlignment: MainAxisAlignment.center,
        actionsOverflowAlignment: OverflowBarAlignment.center,
        iconColor: const Color(0xFF012A4A),
        backgroundColor: const Color(0xFFA9D6E5),
        icon: const Icon(Icons.error_outline,size: 80,),
        title: const Text(
          'ERROR',
          style: TextStyle(color: Color(0xFF012A4A)),
        ),
        content: Text(
          subtitle,
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.black),
        ),
        actions: [
          Center(
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              MaterialButton(
                  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
                color: const Color(0xFF012A4A),
                onPressed: () => Navigator.pop(context),
                textColor: Colors.white,
                elevation: 5,
                child: const Text(
                  'Cancel',
                ),
              ),
              const SizedBox(
                width: 40,
              ),
              MaterialButton(
                  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
                color: const Color(0xFF2C7DA0),
                onPressed: (){
                  Navigator.pop(context);
                },
                textColor: Colors.white,
                elevation: 5,
                child: const Text(
                  'Ok',
                ),
              ),
            ]),
          )
        ],
      ),
    );
  }
  showCupertinoDialog(
      context: context,
      builder: (_) => CupertinoAlertDialog(
            title: const Text(
              'Error',
              style: TextStyle(
                color: Color(0xFF012A4A),
              ),
            ),
            content: Text(
              subtitle,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black,
              ),
            ),
            actions: [
              CupertinoDialogAction(
                isDefaultAction: true,
                child: const Text(
                  'Cancel',
                  style: TextStyle(
                    color:  Color(0xFF2C7DA0),
                  ),
                ),
                onPressed: () => Navigator.pop(context),
              ),
              CupertinoDialogAction(
                  isDefaultAction: true,
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Ok',
                    style: TextStyle(
                      color:Color(0xFF012A4A),
                    ),
                  ))
            ],
          ));
}
