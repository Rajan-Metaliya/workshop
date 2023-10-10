mixin ValidatorMixin {
  bool isValidEmail(String? email) {
    // Regular expression for email validation

    if (email == null || email.isEmpty) return false;

    final RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }

  bool isValidUsername(String? username) {
    if (username == null || username.isEmpty) return false;
    // Regular expression for username validation
    final RegExp usernameRegex = RegExp(r'^[a-zA-Z0-9_-]{3,16}$');
    return usernameRegex.hasMatch(username);
  }

  bool isValidPassword(String? password) {
    // Regular expression for password validation

    /// Regex  for

    if (password == null || password.isEmpty) return false;
    final RegExp passwordRegex = RegExp(
        r'^(?=.*[!@#\$&*~])(?=.*[0-9])(?=.*[a-zA-Z])[a-zA-Z0-9!@#\$&*~]{8,}$');

    return passwordRegex.hasMatch(password);
  }
}
