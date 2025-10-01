abstract class HelpSupportTranslation {
  String get title;
  String get describeProblem;
  String get send;
  String get requiredField;
  String get emailSentSuccess;
  String get done;
}

class HelpSupportEnglish implements HelpSupportTranslation {
  @override String get title => "Help & Support";
  @override String get describeProblem => "Describe Your Problem";
  @override String get send => "Send";
  @override String get requiredField => "This field is required";
  @override String get emailSentSuccess => "We’ll get back to you via email very soon.";
  @override String get done => "Done";
}

class HelpSupportSpanish implements HelpSupportTranslation {
  @override String get title => "Ayuda y Soporte";
  @override String get describeProblem => "Describe Tu Problema";
  @override String get send => "Enviar";
  @override String get requiredField => "Este campo es obligatorio";
  @override String get emailSentSuccess => "Nos pondremos en contacto contigo por correo electrónico muy pronto.";
  @override String get done => "Hecho";
}