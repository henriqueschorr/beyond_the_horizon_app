import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

/// Strongly-typed AppLocalizations supporting English and Portuguese (pt-BR).
/// Organized into distinct functional domain blocks:
/// - [common] (Global tokens, buttons, app title)
/// - [auth] (Authentication and credentials)
/// - [registration] (Operative recruitment / sign up modal)
/// - [landing] (Landing portal copy and tooltips)
/// - [dashboard] (Command deck greetings and feature launchers)
/// - [settings] (CRT shader, theme, volume preferences)
/// - [inConstruction] (Diagnostic lore and status codes)
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
  late final SettingsL10n settings;
  late final InConstructionL10n inConstruction;
  late final TelemetryL10n telemetry;
  late final ErrorL10n errors;

  void _initNamespaces() {
    common = CommonL10n(this);
    auth = AuthL10n(this);
    registration = RegistrationL10n(this);
    landing = LandingL10n(this);
    home = HomeL10n(this);
    dashboard = DashboardL10n(this);
    settings = SettingsL10n(this);
    inConstruction = InConstructionL10n(this);
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
        'commonOperative': 'Operativo',

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
        'landingCompendiumTooltip': 'Compêndio // Livro de Regras',
        'landingSettingsTooltip': 'Configurações',

        // --- DASHBOARD ---
        'dashboardStatus': 'TERMINAL DE COMANDO // STATUS: OPERACIONAL',
        'featurePlayCharacterTitle': 'JOGAR PERSONAGEM',
        'featurePlayCharacterSubtitle': '[ Nenhum personagem ativo carregado ]',
        'featureCreateCharacterTitle': 'CRIAR PERSONAGEM',
        'featureCreateCharacterSubtitle': 'Assistente de criação de ficha passo a passo',
        'featureCompendiumTitle': 'COMPÊNDIO',
        'featureCompendiumSubtitle': 'Regras centrais, espécies, perícias e arsenal',
        'featureSettingsTitle': 'CONFIGURAÇÕES',
        'featureSettingsSubtitle': 'Simulação CRT, áudio e preferências de interface',
        'featureSignOutTitle': 'SAIR',
        'featureSignOutSubtitle': 'Encerrar sessão e retornar ao portal inicial',

        // --- SETTINGS ---
        'settingsTitle': 'CONFIGURAÇÕES',

        // --- IN-CONSTRUCTION ---
        'inConstructionHeader': 'SUBSISTEMA TÁTICO // TRANSMISSÃO DE STATUS',
        'inConstructionNotice': 'Este módulo está sendo ativamente compilado e calibrado no horizonte de eventos. Os registros de telemetria e o banco de dados correspondente serão liberados nas próximas transmissões.',
        'inConstructionStatusCode': 'STATUS: MODULO_EM_DESENVOLVIMENTO // CODIGO_ESTADO_503_PLANNED',
        'inConstructionProtocol': 'LOCALIZAÇÃO: SECTOR_TERMINAL_SUBROUTINE\nPROTOCOLO: ESPERANDO_SINCRONIZACAO_DE_DADOS',
        'inConstructionReturnAction': 'VOLTAR AO TERMINAL',

        // --- RESPONSIVE TELEMETRY ---
        'telemetrySignalWarning': 'TELEMETRIA // SINAL INSTÁVEL',
        'telemetryResolutionTitle': 'RESOLUÇÃO INSUFICIENTE',
        'telemetryResolutionMessage': 'O terminal tático requer uma estação de trabalho desktop ou tablet com largura mínima de 768px para renderizar o horizonte de eventos e o console de comando.',
        'telemetryErrorCode': 'CÓDIGO: ERR_VIEWPORT_PHASE_1_MOBILE_EXCLUDED',
        'telemetryConnectInstruction': 'CONECTE-SE VIA ESTAÇÃO DESKTOP OU TABLET TÁTICO.',

        // --- ERRORS ---
        'errorEmptyEmail': 'O email ou indicativo não pode ficar em branco.',
        'errorInvalidEmail': 'Formato de email inválido.',
        'errorEmptyPassword': 'A senha não pode ficar em branco.',
        'errorPasswordTooShort': 'A senha deve conter pelo menos 8 caracteres.',
        'errorEmptyCallsign': 'Nome de exibição não pode ficar em branco.',
        'errorCallsignTooLong': 'Nome de exibição deve ter no máximo 50 caracteres.',
        'errorInvalidCredentials': 'Credenciais inválidas: Email ou senha incorretos.',
        'errorEmailAlreadyExists': 'Este email já está registrado na base de dados.',
      };
    }

    return {
      // --- COMMON ---
      'commonAppTitle': 'Beyond the Horizon',
      'commonClose': 'Close',
      'commonBack': 'Back',
      'commonOperative': 'Operative',

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
      'landingCompendiumTooltip': 'Compendium // Rulebook',
      'landingSettingsTooltip': 'Settings',

      // --- DASHBOARD ---
      'dashboardStatus': 'COMMAND DECK // STATUS: OPERATIONAL',
      'featurePlayCharacterTitle': 'PLAY CHARACTER',
      'featurePlayCharacterSubtitle': '[ No active character loaded ]',
      'featureCreateCharacterTitle': 'CREATE CHARACTER',
      'featureCreateCharacterSubtitle': 'Step-by-step character creation wizard',
      'featureCompendiumTitle': 'COMPENDIUM',
      'featureCompendiumSubtitle': 'Core mechanics, species, skills, and armory',
      'featureSettingsTitle': 'SETTINGS',
      'featureSettingsSubtitle': 'CRT shaders, audio, and display preferences',
      'featureSignOutTitle': 'SIGN OUT',
      'featureSignOutSubtitle': 'Terminate session and return to portal',

      // --- SETTINGS ---
      'settingsTitle': 'SETTINGS',

      // --- IN-CONSTRUCTION ---
      'inConstructionHeader': 'TACTICAL SUBSYSTEM // STATUS TRANSMISSION',
      'inConstructionNotice': 'This module is actively being compiled and calibrated in the event horizon. Telemetry records and the corresponding database will be declassified in upcoming transmissions.',
      'inConstructionStatusCode': 'STATUS: MODULO_EM_DESENVOLVIMENTO // CODIGO_ESTADO_503_PLANNED',
      'inConstructionProtocol': 'LOCATION: SECTOR_TERMINAL_SUBROUTINE\nPROTOCOL: AWAITING_DATA_SYNCHRONIZATION',
      'inConstructionReturnAction': 'RETURN TO TERMINAL',

      // --- RESPONSIVE TELEMETRY ---
      'telemetrySignalWarning': 'TELEMETRY // UNSTABLE SIGNAL',
      'telemetryResolutionTitle': 'INSUFFICIENT RESOLUTION',
      'telemetryResolutionMessage': 'The tactical terminal requires a desktop or tablet workstation with at least 768px width to render the event horizon and command console.',
      'telemetryErrorCode': 'CODE: ERR_VIEWPORT_PHASE_1_MOBILE_EXCLUDED',
      'telemetryConnectInstruction': 'CONNECT VIA DESKTOP OR TACTICAL TABLET STATION.',

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
  String get commonOperative => _localizedStrings['commonOperative']!;

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
  String dashboardWelcome(String name) =>
      locale.languageCode == 'pt' ? 'BEM-VINDO, $name!' : 'WELCOME, $name!';
  String get dashboardStatus => _localizedStrings['dashboardStatus']!;
  String get featurePlayCharacterTitle => _localizedStrings['featurePlayCharacterTitle']!;
  String get featurePlayCharacterSubtitle => _localizedStrings['featurePlayCharacterSubtitle']!;
  String get featureCreateCharacterTitle => _localizedStrings['featureCreateCharacterTitle']!;
  String get featureCreateCharacterSubtitle => _localizedStrings['featureCreateCharacterSubtitle']!;
  String get featureCompendiumTitle => _localizedStrings['featureCompendiumTitle']!;
  String get featureCompendiumSubtitle => _localizedStrings['featureCompendiumSubtitle']!;
  String get featureSettingsTitle => _localizedStrings['featureSettingsTitle']!;
  String get featureSettingsSubtitle => _localizedStrings['featureSettingsSubtitle']!;
  String get featureSignOutTitle => _localizedStrings['featureSignOutTitle']!;
  String get featureSignOutSubtitle => _localizedStrings['featureSignOutSubtitle']!;

  // ===========================================================================
  // TERMINAL SETTINGS GETTERS
  // ===========================================================================
  String get settingsTitle => _localizedStrings['settingsTitle']!;

  // ===========================================================================
  // IN CONSTRUCTION DESTINATION GETTERS
  // ===========================================================================
  String get inConstructionHeader => _localizedStrings['inConstructionHeader']!;
  String get inConstructionNotice => _localizedStrings['inConstructionNotice']!;
  String get inConstructionStatusCode => _localizedStrings['inConstructionStatusCode']!;
  String get inConstructionProtocol => _localizedStrings['inConstructionProtocol']!;
  String get inConstructionReturnAction => _localizedStrings['inConstructionReturnAction']!;

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
  String get operative => _l10n.commonOperative;
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

  String get compendiumTooltip => _l10n.landingCompendiumTooltip;
  String get settingsTooltip => _l10n.landingSettingsTooltip;
}

class HomeL10n {
  final AppLocalizations _l10n;
  HomeL10n(this._l10n);

  String get compendiumTooltip => _l10n.landingCompendiumTooltip;
  String get settingsTooltip => _l10n.landingSettingsTooltip;
}

class DashboardL10n {
  final AppLocalizations _l10n;
  DashboardL10n(this._l10n);

  String welcome(String name) => _l10n.dashboardWelcome(name);
  String get status => _l10n.dashboardStatus;
  String get playCharacterTitle => _l10n.featurePlayCharacterTitle;
  String get playCharacterSubtitle => _l10n.featurePlayCharacterSubtitle;
  String get createCharacterTitle => _l10n.featureCreateCharacterTitle;
  String get createCharacterSubtitle => _l10n.featureCreateCharacterSubtitle;
  String get compendiumTitle => _l10n.featureCompendiumTitle;
  String get compendiumSubtitle => _l10n.featureCompendiumSubtitle;
  String get settingsTitle => _l10n.featureSettingsTitle;
  String get settingsSubtitle => _l10n.featureSettingsSubtitle;
  String get signOutTitle => _l10n.featureSignOutTitle;
  String get signOutSubtitle => _l10n.featureSignOutSubtitle;
}

class SettingsL10n {
  final AppLocalizations _l10n;
  SettingsL10n(this._l10n);

  String get title => _l10n.settingsTitle;
}

class InConstructionL10n {
  final AppLocalizations _l10n;
  InConstructionL10n(this._l10n);

  String get header => _l10n.inConstructionHeader;
  String get notice => _l10n.inConstructionNotice;
  String get statusCode => _l10n.inConstructionStatusCode;
  String get protocol => _l10n.inConstructionProtocol;
  String get returnAction => _l10n.inConstructionReturnAction;
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
