// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:firebase_core/firebase_core.dart';

// Project imports:
import 'package:asapdemo/core/widgets/my_app.dart';

class FirebaseChecker extends StatelessWidget {
  const FirebaseChecker({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<FirebaseApp>(
        future: Firebase.initializeApp(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Container(
              color: Colors.white,
              child: const Center(child: Text("Error")),
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return const Myapp();
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
  }
}
