import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:google_sign_in/google_sign_in.dart';
import 'package:travenor/core/utils/firebase_service.dart';
import 'package:travenor/firebase_options.dart';
// import 'package:your_app/firebase_service.dart';

void main() {
  group('FirebaseService', () {
    late FirebaseService firebaseService;

    setUp(() async {
      firebaseService = FirebaseService();
    });

    setUpAll(() async {
      TestWidgetsFlutterBinding.ensureInitialized();
      await dotenv.load(fileName: ".env");
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
    });

    test('signUpUser should return true when user is successfully signed up',
        () async {
      // Arrange
      final email = 'test@example.com';
      final password = 'password';
      final name = 'John Doe';

      // Act
      final result = await firebaseService.signUpUser(email, password, name);

      // Assert
      expect(result, true);
    });

    test('signInUser should return true when user is successfully signed in',
        () async {
      // Arrange
      final email = 'test@example.com';
      final password = 'password';

      // Act
      final result = await firebaseService.signInUser(email, password);

      // Assert
      expect(result, true);
    });

    test(
        'signInWithGoogle should return a valid user when signed in with Google',
        () async {
      // Act
      final result = await firebaseService.signInWithGoogle();

      // Assert
      expect(result, isNotNull);
    });

    test('fetchUserProfile should return user profile when given a valid UID',
        () async {
      // Arrange
      final uid = 'valid_uid';

      // Act
      final result = await firebaseService.fetchUserProfile(uid);

      // Assert
      expect(result, isNotNull);
    });

    test(
        'updateUserProfile should return true when user profile is successfully updated',
        () async {
      // Arrange
      final uid = 'valid_uid';
      final name = 'John Doe';
      final email = 'test@example.com';
      final password = 'new_password';

      // Act
      final result =
          await firebaseService.updateUserProfile(uid, name, email, password);

      // Assert
      expect(result, true);
    });

    test(
        'deleteUserAccount should return true when user account is successfully deleted',
        () async {
      // Act
      final result = await firebaseService.deleteUserAccount();

      // Assert
      expect(result, true);
    });
  });
}
