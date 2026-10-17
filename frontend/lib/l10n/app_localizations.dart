import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

/// Strongly-typed AppLocalizations supporting English and Portuguese (pt-BR).
/// Organized into distinct functional domain blocks:
/// - [common] (Global tokens, buttons, app title)
/// - [auth] (Authentication and credentials)
/// - [registration] (Operative recruitment / sign up modal)
/// - [landing] (Landing portal copy and tooltips)
/// - [dashboard] (Command deck greetings and feature launchers)
/// - [lore] (Archival lore epigraph telemetry strings)
/// - [settings] (CRT shader, theme, volume preferences)
/// - [telemetry] (Signal warnings and responsive viewport checks)
/// - [errors] (Validation and backend error responses)
///
/// Strictly complies with Rule 12 of Agents.md: non-nullable access without fallback literals.
class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale) {
    _initNamespaces();
  }

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  static const List<Locale> supportedLocales = [
    Locale('pt', 'BR'),
    Locale('pt'),
    Locale('en'),
  ];

  late final Map<String, String> _localizedStrings = _loadStrings();

  // ===========================================================================
  // FEATURE & DOMAIN BLOCK NAMESPACES
  // ===========================================================================
  late final CommonL10n common;
  late final AuthL10n auth;
  late final RegistrationL10n registration;
  late final LandingL10n landing;
  late final HomeL10n home;
  late final DashboardL10n dashboard;
  late final LoreL10n lore;
  late final SettingsL10n settings;
  late final TelemetryL10n telemetry;
  late final ErrorL10n errors;

  void _initNamespaces() {
    common = CommonL10n(this);
    auth = AuthL10n(this);
    registration = RegistrationL10n(this);
    landing = LandingL10n(this);
    home = HomeL10n(this);
    dashboard = DashboardL10n(this);
    lore = LoreL10n(this);
    settings = SettingsL10n(this);
    telemetry = TelemetryL10n(this);
    errors = ErrorL10n(this);
  }

  Map<String, String> _loadStrings() {
    final isPt = locale.languageCode == 'pt';

    if (isPt) {
      return {
        // --- COMMON ---
        'commonAppTitle': 'Beyond the Horizon',
        'commonClose': 'Fechar',
        'commonBack': 'Voltar',

        // --- AUTH ---
        'authEmailLabel': 'Email',
        'authEmailPlaceholder': 'Digite seu email',
        'authPasswordLabel': 'Senha',
        'authPasswordPlaceholder': 'Digite sua senha',
        'authSignInAction': 'ENTRAR',
        'authRegisterAction': 'Registrar',

        // --- REGISTRATION ---
        'registrationTitle': 'NOVO REGISTRO',
        'registrationCallsignLabel': 'Nome de Exibição',
        'registrationCallsignPlaceholder': 'Ex: Vance Specter',
        'registrationEmailLabel': 'Email',
        'registrationEmailPlaceholder': 'Digite seu email',
        'registrationPasswordLabel': 'Senha',
        'registrationPasswordPlaceholder': 'Digite sua senha',
        'registrationSubmitAction': 'CONCLUIR REGISTRO',

        // --- LANDING ---
        'landingCompendiumTooltip': 'Códice // Livro de Regras',
        'landingSettingsTooltip': 'Configurações',

        // --- DASHBOARD ---
        'featurePlayCharacterTitle': 'JOGAR COM PERSONAGEM',
        'featureCreateCharacterTitle': 'CRIAR PERSONAGEM',
        'featureCompendiumTitle': 'CÓDICE',
        'featureSettingsTitle': 'CONFIGURAÇÕES',
        'featureSignOutTitle': 'SAIR',
        'dashboardWelcomePrefix': 'Bem-vindo, ',
        'dashboardSubtitleExplore': '// INICIE SUA JORNADA',

        // --- LORE ---
        'loreDecryptingTransmission': '// DESCRIPTOGRAFANDO TRANSMISSÃO...',

        // --- SETTINGS ---
        'settingsTitle': 'CONFIGURAÇÕES',
        'settingsTelemetryHeader': '// CFG.SIS // PREFERÊNCIAS',
        'settingsDisplaySection': '// 01   EXIBIÇÃO & MATERIALIDADE',
        'settingsNoiseTitle': 'GRANULAÇÃO / RUÍDO',
        'settingsNoiseDescription': 'Textura analógica CRT & profundidade de toner',
        'settingsToggleOn': 'LIGADO',
        'settingsToggleOff': 'DESLIGADO',
        'settingsNoOptionsNotice': 'Nenhuma opção de configuração disponível no momento.',

        // --- RESPONSIVE TELEMETRY ---
        'telemetrySignalWarning': 'TAMANHO DE TELA NÃO SUPORTADO',
        'telemetryResolutionTitle': 'LARGURA DE TELA INSUFICIENTE',
        'telemetryResolutionMessage': 'Esta aplicação requer uma largura de tela de pelo menos 768px. Acesse em um computador ou tablet.',
        'telemetryErrorCode': 'ERRO: LARGURA_DE_TELA_ABAIXO_768PX',
        'telemetryConnectInstruction': 'USE UM DISPOSITIVO DESKTOP OU TABLET PARA CONTINUAR.',

        // --- ERRORS ---
        'errorEmptyEmail': 'Email ou indicativo não pode ficar em branco.',
        'errorInvalidEmail': 'Formato de email inválido.',
        'errorEmptyPassword': 'Senha não pode ficar em branco.',
        'errorPasswordTooShort': 'Senha deve possuir pelo menos 8 caracteres.',
        'errorEmptyCallsign': 'Nome de exibição não pode ficar em branco.',
        'errorCallsignTooLong': 'Nome de exibição deve ter no máximo 50 caracteres.',
        'errorInvalidCredentials': 'Credenciais inválidas: Email ou senha incorretos.',
        'errorEmailAlreadyExists': 'Este email já se encontra registrado no banco de dados.',
      };
    }

    return {
      // --- COMMON ---
      'commonAppTitle': 'Beyond the Horizon',
      'commonClose': 'Close',
      'commonBack': 'Back',

      // --- AUTH ---
      'authEmailLabel': 'Email',
      'authEmailPlaceholder': 'Enter your email',
      'authPasswordLabel': 'Password',
      'authPasswordPlaceholder': 'Enter your password',
      'authSignInAction': 'SIGN IN',
      'authRegisterAction': 'Register',

      // --- REGISTRATION ---
      'registrationTitle': 'NEW REGISTRATION',
      'registrationCallsignLabel': 'Display Name',
      'registrationCallsignPlaceholder': 'E.g.: Vance Specter',
      'registrationEmailLabel': 'Email',
      'registrationEmailPlaceholder': 'Enter your email',
      'registrationPasswordLabel': 'Password',
      'registrationPasswordPlaceholder': 'Enter your password',
      'registrationSubmitAction': 'COMPLETE REGISTRATION',

      // --- LANDING ---
      'landingCompendiumTooltip': 'Codex // Rulebook',
      'landingSettingsTooltip': 'Settings',

      // --- DASHBOARD ---
      'featurePlayCharacterTitle': 'PLAY WITH CHARACTER',
      'featureCreateCharacterTitle': 'CREATE CHARACTER',
      'featureCompendiumTitle': 'CODEX',
      'featureSettingsTitle': 'SETTINGS',
      'featureSignOutTitle': 'SIGN OUT',
      'dashboardWelcomePrefix': 'Welcome, ',
      'dashboardSubtitleExplore': '// BEGIN YOUR JOURNEY',

      // --- LORE ---
      'loreDecryptingTransmission': '// DECRYPTING TRANSMISSION...',

      // --- SETTINGS ---
      'settingsTitle': 'SETTINGS',
      'settingsTelemetryHeader': '// SYS.CFG // PREFERENCES',
      'settingsDisplaySection': '// 01   DISPLAY & MATERIALITY',
      'settingsNoiseTitle': 'FILM GRAIN / NOISE',
      'settingsNoiseDescription': 'Analog raster texture & toner depth',
      'settingsToggleOn': 'ON',
      'settingsToggleOff': 'OFF',
      'settingsNoOptionsNotice': 'No configuration options currently available.',

      // --- RESPONSIVE TELEMETRY ---
      'telemetrySignalWarning': 'UNSUPPORTED SCREEN SIZE',
      'telemetryResolutionTitle': 'INSUFFICIENT SCREEN WIDTH',
      'telemetryResolutionMessage': 'This application requires a screen width of at least 768px. Access it on a desktop computer or tablet.',
      'telemetryErrorCode': 'ERROR: SCREEN_WIDTH_BELOW_768PX',
      'telemetryConnectInstruction': 'USE A DESKTOP OR TABLET DEVICE TO CONTINUE.',

      // --- ERRORS ---
      'errorEmptyEmail': 'Email or callsign cannot be blank.',
      'errorInvalidEmail': 'Invalid email format.',
      'errorEmptyPassword': 'Password cannot be blank.',
      'errorPasswordTooShort': 'Password must be at least 8 characters.',
      'errorEmptyCallsign': 'Display name cannot be blank.',
      'errorCallsignTooLong': 'Display name must be at most 50 characters.',
      'errorInvalidCredentials': 'Invalid credentials: Email or password incorrect.',
      'errorEmailAlreadyExists': 'This email is already registered in the database.',
    };
  }

  // ===========================================================================
  // COMMON & GLOBAL GETTERS
  // ===========================================================================
  String get commonAppTitle => _localizedStrings['commonAppTitle']!;
  String get commonClose => _localizedStrings['commonClose']!;
  String get commonBack => _localizedStrings['commonBack']!;

  // ===========================================================================
  // AUTHENTICATION GETTERS
  // ===========================================================================
  String get authEmailLabel => _localizedStrings['authEmailLabel']!;
  String get authEmailPlaceholder => _localizedStrings['authEmailPlaceholder']!;
  String get authPasswordLabel => _localizedStrings['authPasswordLabel']!;
  String get authPasswordPlaceholder => _localizedStrings['authPasswordPlaceholder']!;
  String get authSignInAction => _localizedStrings['authSignInAction']!;
  String get authRegisterAction => _localizedStrings['authRegisterAction']!;

  // ===========================================================================
  // REGISTRATION GETTERS
  // ===========================================================================
  String get registrationTitle => _localizedStrings['registrationTitle']!;
  String get registrationCallsignLabel => _localizedStrings['registrationCallsignLabel']!;
  String get registrationCallsignPlaceholder => _localizedStrings['registrationCallsignPlaceholder']!;
  String get registrationEmailLabel => _localizedStrings['registrationEmailLabel']!;
  String get registrationEmailPlaceholder => _localizedStrings['registrationEmailPlaceholder']!;
  String get registrationPasswordLabel => _localizedStrings['registrationPasswordLabel']!;
  String get registrationPasswordPlaceholder => _localizedStrings['registrationPasswordPlaceholder']!;
  String get registrationSubmitAction => _localizedStrings['registrationSubmitAction']!;

  // ===========================================================================
  // LANDING PORTAL GETTERS
  // ===========================================================================
  String get landingCompendiumTooltip => _localizedStrings['landingCompendiumTooltip']!;
  String get landingSettingsTooltip => _localizedStrings['landingSettingsTooltip']!;

  // ===========================================================================
  // PLAYER DASHBOARD GETTERS
  // ===========================================================================
  String get featurePlayCharacterTitle => _localizedStrings['featurePlayCharacterTitle']!;
  String get featureCreateCharacterTitle => _localizedStrings['featureCreateCharacterTitle']!;
  String get featureCompendiumTitle => _localizedStrings['featureCompendiumTitle']!;
  String get featureSettingsTitle => _localizedStrings['featureSettingsTitle']!;
  String get featureSignOutTitle => _localizedStrings['featureSignOutTitle']!;
  String get dashboardWelcomePrefix => _localizedStrings['dashboardWelcomePrefix']!;
  String get dashboardSubtitleExplore => _localizedStrings['dashboardSubtitleExplore']!;

  // ===========================================================================
  // LORE GETTERS
  // ===========================================================================
  String get loreDecryptingTransmission => _localizedStrings['loreDecryptingTransmission']!;

  // ===========================================================================
  // TERMINAL SETTINGS GETTERS
  // ===========================================================================
  String get settingsTitle => _localizedStrings['settingsTitle']!;
  String get settingsTelemetryHeader => _localizedStrings['settingsTelemetryHeader']!;
  String get settingsDisplaySection => _localizedStrings['settingsDisplaySection']!;
  String get settingsNoiseTitle => _localizedStrings['settingsNoiseTitle']!;
  String get settingsNoiseDescription => _localizedStrings['settingsNoiseDescription']!;
  String get settingsToggleOn => _localizedStrings['settingsToggleOn']!;
  String get settingsToggleOff => _localizedStrings['settingsToggleOff']!;
  String get settingsNoOptionsNotice => _localizedStrings['settingsNoOptionsNotice']!;

  // ===========================================================================
  // RESPONSIVE TELEMETRY BARRIER GETTERS
  // ===========================================================================
  String get telemetrySignalWarning => _localizedStrings['telemetrySignalWarning']!;
  String get telemetryResolutionTitle => _localizedStrings['telemetryResolutionTitle']!;
  String get telemetryResolutionMessage => _localizedStrings['telemetryResolutionMessage']!;
  String get telemetryErrorCode => _localizedStrings['telemetryErrorCode']!;
  String get telemetryConnectInstruction => _localizedStrings['telemetryConnectInstruction']!;

  // ===========================================================================
  // ERROR & VALIDATION GETTERS
  // ===========================================================================
  String get errorEmptyEmail => _localizedStrings['errorEmptyEmail']!;
  String get errorInvalidEmail => _localizedStrings['errorInvalidEmail']!;
  String get errorEmptyPassword => _localizedStrings['errorEmptyPassword']!;
  String get errorPasswordTooShort => _localizedStrings['errorPasswordTooShort']!;
  String get errorEmptyCallsign => _localizedStrings['errorEmptyCallsign']!;
  String get errorCallsignTooLong => _localizedStrings['errorCallsignTooLong']!;
  String get errorInvalidCredentials => _localizedStrings['errorInvalidCredentials']!;
  String get errorEmailAlreadyExists => _localizedStrings['errorEmailAlreadyExists']!;
}

// =============================================================================
// DOMAIN-SPECIFIC BLOCK CLASSES
// =============================================================================

class CommonL10n {
  final AppLocalizations _l10n;
  CommonL10n(this._l10n);

  String get appTitle => _l10n.commonAppTitle;
  String get close => _l10n.commonClose;
  String get back => _l10n.commonBack;
}

class AuthL10n {
  final AppLocalizations _l10n;
  AuthL10n(this._l10n);

  String get emailLabel => _l10n.authEmailLabel;
  String get emailPlaceholder => _l10n.authEmailPlaceholder;
  String get passwordLabel => _l10n.authPasswordLabel;
  String get passwordPlaceholder => _l10n.authPasswordPlaceholder;
  String get signInAction => _l10n.authSignInAction;
  String get registerAction => _l10n.authRegisterAction;
}

class RegistrationL10n {
  final AppLocalizations _l10n;
  RegistrationL10n(this._l10n);

  String get title => _l10n.registrationTitle;
  String get callsignLabel => _l10n.registrationCallsignLabel;
  String get displayNameLabel => _l10n.registrationCallsignLabel;
  String get callsignPlaceholder => _l10n.registrationCallsignPlaceholder;
  String get displayNamePlaceholder => _l10n.registrationCallsignPlaceholder;
  String get emailLabel => _l10n.registrationEmailLabel;
  String get emailPlaceholder => _l10n.registrationEmailPlaceholder;
  String get passwordLabel => _l10n.registrationPasswordLabel;
  String get passwordPlaceholder => _l10n.registrationPasswordPlaceholder;
  String get submitAction => _l10n.registrationSubmitAction;
}

class LandingL10n {
  final AppLocalizations _l10n;
  LandingL10n(this._l10n);

  String get codexTooltip => _l10n.landingCompendiumTooltip;
  String get compendiumTooltip => _l10n.landingCompendiumTooltip;
  String get settingsTooltip => _l10n.landingSettingsTooltip;
}

class HomeL10n {
  final AppLocalizations _l10n;
  HomeL10n(this._l10n);

  String get codexTooltip => _l10n.landingCompendiumTooltip;
  String get compendiumTooltip => _l10n.landingCompendiumTooltip;
  String get settingsTooltip => _l10n.landingSettingsTooltip;
}

class DashboardL10n {
  final AppLocalizations _l10n;
  DashboardL10n(this._l10n);

  String get playCharacterTitle => _l10n.featurePlayCharacterTitle;
  String get createCharacterTitle => _l10n.featureCreateCharacterTitle;
  String get codexTitle => _l10n.featureCompendiumTitle;
  String get compendiumTitle => _l10n.featureCompendiumTitle;
  String get settingsTitle => _l10n.featureSettingsTitle;
  String get signOutTitle => _l10n.featureSignOutTitle;
  String get welcomePrefix => _l10n.dashboardWelcomePrefix;
  String get subtitleExplore => _l10n.dashboardSubtitleExplore;
}

class LoreL10n {
  final AppLocalizations _l10n;
  LoreL10n(this._l10n);

  String get decryptingTransmission => _l10n.loreDecryptingTransmission;
}

class SettingsL10n {
  final AppLocalizations _l10n;
  SettingsL10n(this._l10n);

  String get title => _l10n.settingsTitle;
  String get telemetryHeader => _l10n.settingsTelemetryHeader;
  String get displaySection => _l10n.settingsDisplaySection;
  String get noiseTitle => _l10n.settingsNoiseTitle;
  String get noiseDescription => _l10n.settingsNoiseDescription;
  String get toggleOn => _l10n.settingsToggleOn;
  String get toggleOff => _l10n.settingsToggleOff;
  String get noOptionsNotice => _l10n.settingsNoOptionsNotice;
}

class TelemetryL10n {
  final AppLocalizations _l10n;
  TelemetryL10n(this._l10n);

  String get signalWarning => _l10n.telemetrySignalWarning;
  String get resolutionTitle => _l10n.telemetryResolutionTitle;
  String get resolutionMessage => _l10n.telemetryResolutionMessage;
  String get errorCode => _l10n.telemetryErrorCode;
  String get connectInstruction => _l10n.telemetryConnectInstruction;
}

class ErrorL10n {
  final AppLocalizations _l10n;
  ErrorL10n(this._l10n);

  String get emptyEmail => _l10n.errorEmptyEmail;
  String get invalidEmail => _l10n.errorInvalidEmail;
  String get emptyPassword => _l10n.errorEmptyPassword;
  String get passwordTooShort => _l10n.errorPasswordTooShort;
  String get emptyCallsign => _l10n.errorEmptyCallsign;
  String get callsignTooLong => _l10n.errorCallsignTooLong;
  String get invalidCredentials => _l10n.errorInvalidCredentials;
  String get emailAlreadyExists => _l10n.errorEmailAlreadyExists;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['pt', 'en'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(AppLocalizations(locale));
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}
