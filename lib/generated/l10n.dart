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
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
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
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Subscription Manager`
  String get app_name {
    return Intl.message(
      'Subscription Manager',
      name: 'app_name',
      desc: '',
      args: [],
    );
  }

  /// `Name User`
  String get name {
    return Intl.message(
      'Name User',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Number User`
  String get number {
    return Intl.message(
      'Number User',
      name: 'number',
      desc: '',
      args: [],
    );
  }

  /// `Price Subscription`
  String get price {
    return Intl.message(
      'Price Subscription',
      name: 'price',
      desc: '',
      args: [],
    );
  }

  /// `Date Subscription`
  String get date {
    return Intl.message(
      'Date Subscription',
      name: 'date',
      desc: '',
      args: [],
    );
  }

  /// `Select... `
  String get select {
    return Intl.message(
      'Select... ',
      name: 'select',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message(
      'Delete',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get edit {
    return Intl.message(
      'Edit',
      name: 'edit',
      desc: '',
      args: [],
    );
  }

  /// `Update Data`
  String get UpdateData {
    return Intl.message(
      'Update Data',
      name: 'UpdateData',
      desc: '',
      args: [],
    );
  }

  /// `Add Subscription`
  String get add {
    return Intl.message(
      'Add Subscription',
      name: 'add',
      desc: '',
      args: [],
    );
  }

  /// `Year `
  String get year {
    return Intl.message(
      'Year ',
      name: 'year',
      desc: '',
      args: [],
    );
  }

  /// `Month `
  String get month {
    return Intl.message(
      'Month ',
      name: 'month',
      desc: '',
      args: [],
    );
  }

  /// `Day `
  String get day {
    return Intl.message(
      'Day ',
      name: 'day',
      desc: '',
      args: [],
    );
  }

  /// `Expired User`
  String get expired_user {
    return Intl.message(
      'Expired User',
      name: 'expired_user',
      desc: '',
      args: [],
    );
  }

  /// `Details User`
  String get details_user {
    return Intl.message(
      'Details User',
      name: 'details_user',
      desc: '',
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
