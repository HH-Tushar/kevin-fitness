part of '../reset_password_screen.dart';

class _PasswordField extends StatefulWidget {
  final IconData icon;
  final String hint;
  final String? currentPassword;
  final Function(String) onChange;
  // final bool isPassword;
  const _PasswordField({
    required this.icon,
    required this.hint,
    required this.onChange,
    this.currentPassword,
    // this.isPassword = false,
  });

  @override
  State<_PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<_PasswordField> {
  String value = "";
  int? error;
  int strongLevel = 0;
  bool isVisible = false;
  toggleVisible() {
    setState(() {
      isVisible = !isVisible;
    });
  }

  int checkPasswordStrength(String password) {
    bool hasLowerCase = false;
    bool hasUpperCase = false;
    bool hasNumber = false;

    for (int i = 0; i < password.length; i++) {
      if (password[i].toLowerCase() == password[i]) {
        hasLowerCase = true;
      }
      if (password[i].toUpperCase() == password[i]) {
        hasUpperCase = true;
      }
      if (RegExp(r'\d').hasMatch(password[i])) {
        hasNumber = true;
      }
    }

    if (hasUpperCase && hasLowerCase && hasNumber) {
      return 3;
    } else if (hasUpperCase && hasLowerCase) {
      return 2;
    } else {
      return 1;
    }
  }

  checkError() {
    strongLevel = checkPasswordStrength(value);
        widget.onChange(value);
    if (value.isEmpty) {
      setState(() {
        error = 0;
      });
    } else if (value.length < 5) {
      setState(() {
        error = 1;
      });
    } else if (widget.currentPassword != null &&
        widget.currentPassword != value) {
      error = 2;
      setState(() {});
    } else {
      setState(() {

        error = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final LanguageProvider translator = context.watch();
    final authTranslator = translator.authTranslation;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 4,
      children: [
        Row(
          children: [
            Icon(
              widget.icon,
              size: 16,
              color: value.isNotEmpty && error != null
                  ? errorColor
                  : value.isNotEmpty && error == null
                  ? successColor
                  : const Color(0xFF222A2C),
            ),
            hPad5,
            Expanded(
              child: TextField(
                obscureText: !isVisible,
                style: TextStyle(
                  color: const Color(0xFF222A2C),
                  fontSize: 13,
                  fontFamily: 'Outfit',
                  fontWeight: FontWeight.w400,
                  decoration: TextDecoration.none,
                ),
                decoration: InputDecoration(
                  hintText: widget.hint,
                  hintStyle: TextStyle(
                    color: const Color(0xFF222A2C),
                    fontSize: 13,
                    fontFamily: 'Outfit',
                    fontWeight: FontWeight.w400,
                  ),
                  border: InputBorder.none,
                  isDense: true,
                  contentPadding: EdgeInsets.symmetric(vertical: 8),
                ),
                onChanged: (val) {
                  value = val;
                  checkError();
                },
              ),
            ),

            GestureDetector(
              onTap: () {
                toggleVisible();
              },
              child: Icon(
                isVisible ? Icons.visibility_off : Icons.visibility,
                size: 18,
              ),
            ),
            hPad5,
            if (value.isNotEmpty)
              Icon(
                error == null ? Icons.check_circle : Icons.error,
                color: error == null ? Colors.green : Colors.red,
                size: 18,
              ),

            // error,
          ],
        ),
        // SizedBox(height: 2),
        Container(
          width: double.infinity,
          height: 1,
          color: error == null && value.isNotEmpty
              ? successColor
              : value.isNotEmpty && error != null
              ? errorColor
              : Color(0xFF222A2C),
        ),

        if (error != null)
          Text(
            error == 0
                ? authTranslator.requiredPassword
                : error == 1
                ? authTranslator.passwordTooShort
                : authTranslator.passwordsDontMatch,
            style: TextStyle(
              color: const Color(0xFFFF6B6B),
              fontSize: 10,
              fontFamily: 'Outfit',
              fontWeight: FontWeight.w400,
            ),
          ),

        if (strongLevel > 0)
          Row(
            // spacing: 10,
            children: [
              Text(
                'Password strength: ',
                style: TextStyle(
                  color: const Color(0xFF767781),
                  fontSize: 10,
                  fontFamily: 'Outfit',
                  fontWeight: FontWeight.w400,
                ),
              ),
              hPad5,
              Text(
                strongLevel == 1
                    ? authTranslator.passwordStrengthWeak
                    : strongLevel == 2
                    ? authTranslator.passwordStrengthMedium
                    : authTranslator.passwordStrengthStrong,
                style: TextStyle(
                  color: const Color(0xFFFF6B6B),
                  fontSize: 10,
                  fontFamily: 'Outfit',
                  fontWeight: FontWeight.w400,
                ),
              ),
              hPad10,
              Expanded(
                child: Container(
                  height: 5,
                  decoration: BoxDecoration(
                    color: const Color(0xFFE0E0E0),
                    borderRadius: BorderRadius.circular(2),
                  ),
                  child: FractionallySizedBox(
                    alignment: Alignment.centerLeft,
                    widthFactor: getPasswordStrengthWidth(strongLevel),
                    child: Container(
                      decoration: BoxDecoration(
                        color: getPasswordStrengthColor(strongLevel),
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
      ],
    );
  }

  Color getPasswordStrengthColor(int strength) {
    if (strength == 1) {
      return Colors.grey;
    } else if (strength == 2) {
      return Colors.red;
    } else if (strength == 3) {
      return Colors.green;
    } else {
      return Colors.grey;
    }
  }

  double getPasswordStrengthWidth(int strength) {
    if (strength == 1) {
      return 0.33;
    } else if (strength == 2) {
      return 0.66;
    } else if (strength == 3) {
      return 1;
    } else {
      return 0;
    }
  }
}
