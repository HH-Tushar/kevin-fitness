abstract class SettingTranslation {
  String get myProfile;
  String get edit;
  String get updateProfile;
  String get generalSettings;
  String get profileSummary;
  String get languageSelection;
  String get manageSubscription;
  String get aboutUs;
  String get helpSupport;
  String get privacyPolicy;
  String get termsConditions;
  String get account;
  String get deleteAccount;
  String get logOut;
  String get cancel;
  String get delete;
  String get logoutDialogTitle;
  String get logoutDialogMessage;
  String get deleteAccountDialogTitle;
  String get deleteAccountDialogMessage;
  String get accountDeletedSuccess;
}

class SettingEnglish implements SettingTranslation {
  @override String get myProfile => "My Profile";
  @override String get edit => "Edit";
  @override String get updateProfile => "Update your profile";
  @override String get generalSettings => "General Settings";
  @override String get profileSummary => "Profile Summary";
  @override String get languageSelection => "Language Selection";
  @override String get manageSubscription => "Manage Subscription";
  @override String get aboutUs => "About us";
  @override String get helpSupport => "Help & Support";
  @override String get privacyPolicy => "Privacy Policy";
  @override String get termsConditions => "Terms & Conditions";
  @override String get account => "Account";
  @override String get deleteAccount => "Delete Account";
  @override String get logOut => "Log out";
  @override String get cancel => "Cancel";
  @override String get delete => "Delete";
  @override String get logoutDialogTitle => "Log Out";
  @override String get logoutDialogMessage => "Are you sure you want to log out?";
  @override String get deleteAccountDialogTitle => "Delete Account";
  @override String get deleteAccountDialogMessage => "Are you sure you want to delete your account? This will permanently erase your account";
  @override String get accountDeletedSuccess => "Account deleted successfully";
}

class SettingSpanish implements SettingTranslation {
  @override String get myProfile => "Mi Perfil";
  @override String get edit => "Editar";
  @override String get updateProfile => "Actualizar tu perfil";
  @override String get generalSettings => "Configuración General";
  @override String get profileSummary => "Resumen del Perfil";
  @override String get languageSelection => "Selección de Idioma";
  @override String get manageSubscription => "Gestionar Suscripción";
  @override String get aboutUs => "Acerca de Nosotros";
  @override String get helpSupport => "Ayuda y Soporte";
  @override String get privacyPolicy => "Política de Privacidad";
  @override String get termsConditions => "Términos y Condiciones";
  @override String get account => "Cuenta";
  @override String get deleteAccount => "Eliminar Cuenta";
  @override String get logOut => "Cerrar Sesión";
  @override String get cancel => "Cancelar";
  @override String get delete => "Eliminar";
  @override String get logoutDialogTitle => "Cerrar Sesión";
  @override String get logoutDialogMessage => "¿Estás seguro de que quieres cerrar sesión?";
  @override String get deleteAccountDialogTitle => "Eliminar Cuenta";
  @override String get deleteAccountDialogMessage => "¿Estás seguro de que quieres eliminar tu cuenta? Esto borrará permanentemente tu cuenta";
  @override String get accountDeletedSuccess => "Cuenta eliminada exitosamente";
}