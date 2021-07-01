import 'package:flutter/material.dart';

void navigate({required BuildContext context, required navigateTo}) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => navigateTo,
    ),
  );
}
