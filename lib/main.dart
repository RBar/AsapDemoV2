// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:injectable/injectable.dart';

// Project imports:
import 'package:asapdemo/core/widgets/app_widget.dart';
import 'package:asapdemo/injection.dart';

// Import the firebase_core plugin

void main() {
  configureInjection(Environment.prod);
  runApp(const AppWidget());
}
