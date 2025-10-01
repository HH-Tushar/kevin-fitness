abstract class ChatTranslation {
  String get title;
  String get typeMessage;
  String get send;
  String get scrollToBottom;
}

class ChatEnglish implements ChatTranslation {
  @override
  String get title => "Chat";
  @override
  String get typeMessage => "Type your message...";
  @override
  String get send => "Send";
  @override
  String get scrollToBottom => "Scroll to bottom";
}

class ChatSpanish implements ChatTranslation {
  @override
  String get title => "Chat";
  @override
  String get typeMessage => "Escribe tu mensaje...";
  @override
  String get send => "Enviar";
  @override
  String get scrollToBottom => "Ir al final";
}
