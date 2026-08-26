import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:metacards/data/constants.dart';
import 'package:metacards/data/models/meta_cards.dart';

/// Loads the bundled `data_<locale>.json` directly from disk (bypassing the
/// Flutter asset bundle) so these checks run as plain, fast unit tests.
MetaCards _loadLocale(String locale) {
  final raw = File('assets/data_$locale.json').readAsStringSync();
  return MetaCards.fromJson(jsonDecode(raw) as Map<String, dynamic>);
}

void main() {
  test('AppData.supportedDataLocales matches the shipped data files', () {
    expect(AppData.supportedDataLocales, {'ru', 'en', 'sr'});
    for (final locale in AppData.supportedDataLocales) {
      expect(
        File('assets/data_$locale.json').existsSync(),
        isTrue,
        reason: 'assets/data_$locale.json is missing on disk',
      );
    }
  });

  for (final locale in AppData.supportedDataLocales) {
    group('data_$locale.json', () {
      late MetaCards cards;

      setUp(() {
        cards = _loadLocale(locale);
      });

      test('has emotions and verbs', () {
        expect(cards.emotions, isNotEmpty);
        expect(cards.verbs, isNotEmpty);
      });

      test('has unique emotion and verb ids', () {
        final emotionIds = cards.emotions.map((e) => e.id).toList();
        final verbIds = cards.verbs.map((v) => v.id).toList();
        expect(emotionIds.toSet().length, emotionIds.length,
            reason: 'duplicate emotion id in $locale');
        expect(verbIds.toSet().length, verbIds.length,
            reason: 'duplicate verb id in $locale');
      });

      test('every emotion and verb has at least one non-empty title', () {
        for (final emotion in cards.emotions) {
          expect(emotion.lines, isNotEmpty,
              reason: 'emotion ${emotion.id} in $locale has no lines');
          expect(
            emotion.lines.any((line) => line.title.trim().isNotEmpty),
            isTrue,
            reason: 'emotion ${emotion.id} in $locale has no title text',
          );
        }
        for (final verb in cards.verbs) {
          expect(verb.lines, isNotEmpty,
              reason: 'verb ${verb.id} in $locale has no lines');
          expect(
            verb.lines.any((line) => line.title.trim().isNotEmpty),
            isTrue,
            reason: 'verb ${verb.id} in $locale has no title text',
          );
        }
      });
    });
  }

  test('emotion ids are identical across all locales', () {
    final idSets = {
      for (final locale in AppData.supportedDataLocales)
        locale: _loadLocale(locale).emotions.map((e) => e.id).toSet(),
    };
    final reference = idSets[AppData.supportedDataLocales.first]!;
    idSets.forEach((locale, ids) {
      expect(
        ids,
        reference,
        reason:
            'emotion ids in $locale differ from ${AppData.supportedDataLocales.first} '
            '- a saved work session would fail to resolve emotions after a locale switch',
      );
    });
  });

  test('verb ids are identical across all locales', () {
    final idSets = {
      for (final locale in AppData.supportedDataLocales)
        locale: _loadLocale(locale).verbs.map((v) => v.id).toSet(),
    };
    final reference = idSets[AppData.supportedDataLocales.first]!;
    idSets.forEach((locale, ids) {
      expect(
        ids,
        reference,
        reason:
            'verb ids in $locale differ from ${AppData.supportedDataLocales.first} '
            '- a saved work session would fail to resolve verbs after a locale switch',
      );
    });
  });
}
