
import 'package:flutter/material.dart';

class ContainerError extends StatelessWidget {
  final String error;
  const ContainerError({
    super.key, required this.error,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          border:Border.all(
            color: Colors.red
          )
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(error,textAlign: TextAlign.center,),
        )),
    );
  }
}

