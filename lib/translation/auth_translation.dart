abstract class AuthTranslation {
  String get login;
  String get signup;
  String get email;
  String get enterYourEmail;
  String get welcomeBack;
  String get password;
  String get confirmPassword;
  String get fullName;
  String get forgotPassword;
  String get dontHaveAccount;
  String get alreadyHaveAccount;
  String get signUp;
  String get signIn;
  String get requiredField;
  String get invalidEmail;
  String get passwordTooShort;
  String get passwordsDontMatch;
  String get passwordStrengthWeak;
  String get passwordStrengthMedium;
  String get passwordStrengthStrong;
  String get requiredPassword;
  String get oTPVerification;
  String get heyThere;
}

class AuthEnglish implements AuthTranslation {
  @override String get heyThere => "Hey there,";
  @override String get login => "Login";
  @override String get enterYourEmail => "Enter your email";
  @override String get welcomeBack => "Welcome Back";
  @override String get signup => "Sign Up";
  @override String get email => "Email";
  @override String get password => "Password";
  @override String get confirmPassword => "Confirm Password";
  @override String get fullName => "Full Name";
  @override String get forgotPassword => "Forgot Password?";
  @override String get dontHaveAccount => "Don't have an account?";
  @override String get alreadyHaveAccount => "Already have an account?";
  @override String get signUp => "Sign Up";
  @override String get signIn => "Sign In";
  @override String get requiredField => "This field is required";
  @override String get requiredPassword => "Password is required";
  @override String get invalidEmail => "Please enter a valid email";
  @override String get passwordTooShort => "Password must be at least 6 characters";
  @override String get passwordsDontMatch => "Passwords do not match";
  @override String get passwordStrengthWeak => "Weak";
  @override String get passwordStrengthMedium => "Medium";
  @override String get passwordStrengthStrong => "Strong";
  @override String get oTPVerification => "OTP Verification";
}

class AuthSpanish implements AuthTranslation {
  @override String get login => "Iniciar Sesión";
  @override String get heyThere => "Hola,";
  @override String get signup => "Registrarse";
  @override String get email => "Correo Electrónico";
  @override String get welcomeBack => "Bienvenido de nuevo";
  @override String get enterYourEmail => "Introduce tu correo electrónico";
  @override String get password => "Contraseña";
  @override String get confirmPassword => "Confirmar Contraseña";
  @override String get fullName => "Nombre Completo";
  @override String get forgotPassword => "¿Olvidaste tu contraseña?";
  @override String get dontHaveAccount => "¿No tienes una cuenta?";
  @override String get alreadyHaveAccount => "¿Ya tienes una cuenta?";
  @override String get signUp => "Registrarse";
  @override String get signIn => "Iniciar Sesión";
  @override String get requiredField => "Este campo es obligatorio";
  @override String get invalidEmail => "Por favor ingresa un correo válido";
  @override String get passwordTooShort => "La contraseña debe tener al menos 6 caracteres";
  @override String get passwordsDontMatch => "Las contraseñas no coinciden";
  @override String get passwordStrengthWeak => "Débil";
  @override String get passwordStrengthMedium => "Medio";
  @override String get passwordStrengthStrong => "Fuerte";
  @override String get requiredPassword => "Se requiere contraseña";
  @override String get oTPVerification => "Verificación OTP";

}