// lib/utils/auth.dart

class Auth {
  // Simulated logged-in status
  static bool isLoggedIn = true; // change to false if not logged in
  static String userType =
      "patient"; // can be "patient", "doctor", "admin", etc.

  // Simulated patient info
  static String? userName = "John Doe";
  static String? userEmail = "john@example.com";

  // Call this to log out
  static void logout() {
    isLoggedIn = false;
    userType = "";
    userName = null;
    userEmail = null;
  }
}
