
import 'package:flutter/material.dart';

class DialogField {
  final TextEditingController controller;
  final String label;
  final String? Function(String? value)? validator;
  final double? width;
  final double? height;

  DialogField({
    required this.controller,
    required this.label,
    this.validator,
    this.width,
    this.height,
  });
}
