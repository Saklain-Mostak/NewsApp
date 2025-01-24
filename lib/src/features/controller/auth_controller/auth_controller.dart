import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:news_app/src/routing/app_route.dart';
import 'package:news_app/src/utils/snackbar_util.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Observing Firebase User
  Rx<User?> firebaseUser = Rx<User?>(null);

  @override
  void onInit() {
    super.onInit();
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
    checkAccountValidity();
  }

  // Set initial screen based on authentication state
  void _setInitialScreen(User? user) {
    if (user == null) {
      Get.offAllNamed(AppRoutes.login);
    } else {
      Get.offAllNamed(AppRoutes.homeScreen);
    }
  }

  // Register new user
  Future<void> register(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await _auth.signOut();
      SnackbarUtil.showSuccess("Account created successfully!");
    } catch (e) {
      SnackbarUtil.showError(_handleAuthError(e));
    }
  }

  // Login existing user
  Future<void> login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      SnackbarUtil.showSuccess("Logged in successfully!");
    } catch (e) {
      SnackbarUtil.showError(_handleAuthError(e));
    }
  }

  // Logout user
  Future<void> logout() async {
    try {
      await _auth.signOut();
      SnackbarUtil.showSuccess("Logged out successfully!");
    } catch (e) {
      SnackbarUtil.showError("Error logging out!");
    }
  }


  Future<void> checkAccountValidity() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      try {
        await user.getIdToken(true);
      } catch (e) {
        await _auth.signOut();
      }
    }
  }



  // Error handler
  String _handleAuthError(dynamic error) {
    if (error is FirebaseAuthException) {
      switch (error.code) {
        case "user-not-found":
          return "No user found for this email.";
        case "wrong-password":
          return "Invalid password.";
        case "email-already-in-use":
          return "This email is already registered.";
        default:
          return "An unexpected error occurred.";
      }
    }
    return error.toString();
  }
}
