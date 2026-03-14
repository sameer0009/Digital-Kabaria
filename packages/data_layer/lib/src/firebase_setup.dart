import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';

class FirebaseSetup {
  static Future<void> initialize({bool useEmulator = true}) async {
    try {
      if (Firebase.apps.isEmpty) {
        await Firebase.initializeApp(
          options: const FirebaseOptions(
            apiKey: 'dummy_api_key',
            appId: 'dummy_app_id',
            messagingSenderId: 'dummy_sender_id',
            projectId: 'digital-kabaria-mvp',
          ),
        );
      }
    } catch (e) {
      debugPrint('Firebase init error: $e');
    }

    if (useEmulator) {
      try {
        final host = defaultTargetPlatform == TargetPlatform.android ? '10.0.2.2' : 'localhost';
        FirebaseAuth.instance.useAuthEmulator(host, 9099);
        FirebaseFirestore.instance.useFirestoreEmulator(host, 8080);
        FirebaseStorage.instance.useStorageEmulator(host, 9199);
      } catch (e) {
        debugPrint('Emulator connection error: $e');
      }
    }
  }
}
