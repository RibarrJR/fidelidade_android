import 'package:fidelidade_android/shared/presentation/widgets/RoundedButton.dart';
import 'package:flutter/material.dart';

bool featureButtonMatcher(Widget widget, String text) {
  if (widget is RoundedButton) {
    return widget.text == text;
  }
  return false;
}
