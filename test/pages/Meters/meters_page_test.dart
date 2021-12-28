import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:untitled/pages/Meters/meters_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

const localizedWidget = MaterialApp(
  localizationsDelegates: [
  AppLocalizations.delegate,
  GlobalMaterialLocalizations.delegate,
  GlobalWidgetsLocalizations.delegate,
  GlobalCupertinoLocalizations.delegate
],
locale: Locale('en'),
home: MetersPage(),
);

void main() {
  testWidgets('MetersPage has correct title in AppBar', (WidgetTester tester) async {
    await tester.pumpWidget(localizedWidget);
    await tester.pumpAndSettle();

    expect(find.text('Meters'), findsOneWidget);
  });
}