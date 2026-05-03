// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Login`
  String get common_login {
    return Intl.message(
      'Login',
      name: 'common_login',
      desc: 'Generic login text used in buttons or titles',
      args: [],
    );
  }

  /// `Sign Up`
  String get common_signup {
    return Intl.message(
      'Sign Up',
      name: 'common_signup',
      desc: 'Generic signup text used in buttons or links',
      args: [],
    );
  }

  /// `Hello`
  String get onboarding_title {
    return Intl.message(
      'Hello',
      name: 'onboarding_title',
      desc: 'Main greeting title on onboarding screen',
      args: [],
    );
  }

  /// `Welcome to Little Drop, where you manage your daily tasks`
  String get onboarding_subtitle {
    return Intl.message(
      'Welcome to Little Drop, where you manage your daily tasks',
      name: 'onboarding_subtitle',
      desc: 'Short description explaining the app purpose on onboarding screen',
      args: [],
    );
  }

  /// `Sign up using`
  String get onboarding_social_text {
    return Intl.message(
      'Sign up using',
      name: 'onboarding_social_text',
      desc: 'Text displayed above social media signup options',
      args: [],
    );
  }

  /// `Welcome Back`
  String get login_title {
    return Intl.message(
      'Welcome Back',
      name: 'login_title',
      desc: 'Main title displayed on login screen',
      args: [],
    );
  }

  /// `Login to manage your stock efficiently`
  String get login_subtitle {
    return Intl.message(
      'Login to manage your stock efficiently',
      name: 'login_subtitle',
      desc: 'Subtitle explaining login purpose',
      args: [],
    );
  }

  /// `Email or Username`
  String get login_email_label {
    return Intl.message(
      'Email or Username',
      name: 'login_email_label',
      desc: 'Label for email or username input field',
      args: [],
    );
  }

  /// `Enter your email`
  String get login_email_hint {
    return Intl.message(
      'Enter your email',
      name: 'login_email_hint',
      desc: 'Placeholder text for email input field',
      args: [],
    );
  }

  /// `Password`
  String get login_password_label {
    return Intl.message(
      'Password',
      name: 'login_password_label',
      desc: 'Label for password input field',
      args: [],
    );
  }

  /// `Enter your password`
  String get login_password_hint {
    return Intl.message(
      'Enter your password',
      name: 'login_password_hint',
      desc: 'Placeholder text for password input field',
      args: [],
    );
  }

  /// `Login`
  String get login_button {
    return Intl.message(
      'Login',
      name: 'login_button',
      desc: 'Main login button text',
      args: [],
    );
  }

  /// `Don't have an account?`
  String get login_no_account {
    return Intl.message(
      'Don\'t have an account?',
      name: 'login_no_account',
      desc: 'Text before signup link on login screen',
      args: [],
    );
  }

  /// `Sign Up`
  String get login_signup_link {
    return Intl.message(
      'Sign Up',
      name: 'login_signup_link',
      desc: 'Clickable signup text on login screen',
      args: [],
    );
  }

  /// `Please enter your username or email`
  String get login_validation_empty_email {
    return Intl.message(
      'Please enter your username or email',
      name: 'login_validation_empty_email',
      desc: 'Validation error when email field is empty',
      args: [],
    );
  }

  /// `Please enter your password`
  String get login_validation_empty_password {
    return Intl.message(
      'Please enter your password',
      name: 'login_validation_empty_password',
      desc: 'Validation error when password is empty',
      args: [],
    );
  }

  /// `Password must be at least 6 characters`
  String get login_validation_short_password {
    return Intl.message(
      'Password must be at least 6 characters',
      name: 'login_validation_short_password',
      desc: 'Validation error for short password',
      args: [],
    );
  }

  /// `Create Account`
  String get signup_title {
    return Intl.message(
      'Create Account',
      name: 'signup_title',
      desc: 'Main title on signup screen',
      args: [],
    );
  }

  /// `Fill in the details to get started`
  String get signup_subtitle {
    return Intl.message(
      'Fill in the details to get started',
      name: 'signup_subtitle',
      desc: 'Subtitle on signup screen',
      args: [],
    );
  }

  /// `Username`
  String get signup_username_label {
    return Intl.message(
      'Username',
      name: 'signup_username_label',
      desc: 'Label for username input field',
      args: [],
    );
  }

  /// `Enter your username`
  String get signup_username_hint {
    return Intl.message(
      'Enter your username',
      name: 'signup_username_hint',
      desc: 'Placeholder for username field',
      args: [],
    );
  }

  /// `Email`
  String get signup_email_label {
    return Intl.message(
      'Email',
      name: 'signup_email_label',
      desc: 'Label for email input field',
      args: [],
    );
  }

  /// `Enter your email`
  String get signup_email_hint {
    return Intl.message(
      'Enter your email',
      name: 'signup_email_hint',
      desc: 'Placeholder for email field',
      args: [],
    );
  }

  /// `Password`
  String get signup_password_label {
    return Intl.message(
      'Password',
      name: 'signup_password_label',
      desc: 'Label for password input field',
      args: [],
    );
  }

  /// `Enter password`
  String get signup_password_hint {
    return Intl.message(
      'Enter password',
      name: 'signup_password_hint',
      desc: 'Placeholder for password field',
      args: [],
    );
  }

  /// `Confirm Password`
  String get signup_confirm_password_label {
    return Intl.message(
      'Confirm Password',
      name: 'signup_confirm_password_label',
      desc: 'Label for confirm password field',
      args: [],
    );
  }

  /// `Repeat password`
  String get signup_confirm_password_hint {
    return Intl.message(
      'Repeat password',
      name: 'signup_confirm_password_hint',
      desc: 'Placeholder for confirm password field',
      args: [],
    );
  }

  /// `Sign Up`
  String get signup_button {
    return Intl.message(
      'Sign Up',
      name: 'signup_button',
      desc: 'Main signup button text',
      args: [],
    );
  }

  /// `Already have an account?`
  String get signup_have_account {
    return Intl.message(
      'Already have an account?',
      name: 'signup_have_account',
      desc: 'Text before login link on signup screen',
      args: [],
    );
  }

  /// `Login`
  String get signup_login_link {
    return Intl.message(
      'Login',
      name: 'signup_login_link',
      desc: 'Clickable login text on signup screen',
      args: [],
    );
  }

  /// `Username is required`
  String get signup_validation_username_required {
    return Intl.message(
      'Username is required',
      name: 'signup_validation_username_required',
      desc: 'Validation error when username is empty',
      args: [],
    );
  }

  /// `Email is required`
  String get signup_validation_email_required {
    return Intl.message(
      'Email is required',
      name: 'signup_validation_email_required',
      desc: 'Validation error when email is empty',
      args: [],
    );
  }

  /// `Enter a valid email`
  String get signup_validation_email_invalid {
    return Intl.message(
      'Enter a valid email',
      name: 'signup_validation_email_invalid',
      desc: 'Validation error for invalid email format',
      args: [],
    );
  }

  /// `Minimum 6 characters`
  String get signup_validation_password_short {
    return Intl.message(
      'Minimum 6 characters',
      name: 'signup_validation_password_short',
      desc: 'Validation error for short password',
      args: [],
    );
  }

  /// `Please confirm your password`
  String get signup_validation_confirm_required {
    return Intl.message(
      'Please confirm your password',
      name: 'signup_validation_confirm_required',
      desc: 'Validation error when confirm password is empty',
      args: [],
    );
  }

  /// `Passwords do not match`
  String get signup_validation_password_mismatch {
    return Intl.message(
      'Passwords do not match',
      name: 'signup_validation_password_mismatch',
      desc: 'Validation error when passwords don\'t match',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
