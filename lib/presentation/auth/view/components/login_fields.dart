part of '../login_screen.dart';

class _PasswordField extends StatefulWidget {
  final IconData icon;
  final String hint;
  final Function(String) onChange;
  // final bool isPassword;
  const _PasswordField({
    required this.icon,
    required this.hint,
    required this.onChange,

    // this.isPassword = false,
  });

  @override
  State<_PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<_PasswordField> {
  String value = "";
  int? error;
  bool isVisible = false;
  toggleVisible() {
    setState(() {
      isVisible = !isVisible;
    });
  }

  checkError() {
    if (value.isEmpty) {
      setState(() {
        widget.onChange("");
        error = 0;
      });
    } else if (value.length < 5) {
      setState(() {
        widget.onChange("");
        error = 1;
      });
    } else {
      setState(() {
        widget.onChange(value);
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
      ],
    );
  }
}

class _EmailField extends StatefulWidget {
  final IconData icon;
  final String hint;
  final Function(String) onChange;
  // final bool isPassword;
  const _EmailField({
    required this.icon,
    required this.hint,
    required this.onChange,
    // this.isPassword = false,
  });

  @override
  State<_EmailField> createState() => _EmailFieldState();
}

class _EmailFieldState extends State<_EmailField> {
  String value = "";
  bool? validMail;
  int errorCode = 0;

  bool isValidEmail(String email) {
    // Regular expression to validate an email address
    RegExp emailRegExp = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );

    return emailRegExp.hasMatch(email);
  }

  checkError() {
    if (value.trim().isEmpty) {
      errorCode = 1;
      widget.onChange("");
      setState(() {});
      return;
    }
    validMail = isValidEmail(value);
    if (!validMail!) {
      widget.onChange("");
      errorCode = 2;
    } else {
      errorCode = 0;
      widget.onChange(value);
    }
    setState(() {});
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
              color: value.isNotEmpty && validMail == false
                  ? errorColor
                  : validMail == true
                  ? successColor
                  : const Color(0xFF222A2C),
            ),
            hPad5,
            Expanded(
              child: TextField(
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
            if (value.isNotEmpty)
              Icon(
                validMail == true ? Icons.check_circle : Icons.error,
                color: validMail == true ? Colors.green : Colors.red,
                size: 18,
              ),
          ],
        ),
        // SizedBox(height: 2),
        Container(
          width: double.infinity,
          height: 1,
          color: validMail == true
              ? successColor
              : validMail == false
              ? errorColor
              : const Color(0xFF222A2C),
        ),
        if (errorCode > 0)
          Text(
            value.isEmpty
                ? authTranslator.requiredField
                : !validMail!
                ? authTranslator.invalidEmail
                : "",
            style: TextStyle(
              color: const Color(0xFFFF6B6B),
              fontSize: 10,
              fontFamily: 'Outfit',
              fontWeight: FontWeight.w400,
            ),
          ),
      ],
    );
  }
}
