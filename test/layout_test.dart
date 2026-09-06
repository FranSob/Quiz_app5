import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:biomatura/main.dart';
import 'package:biomatura/screens/home_screen.dart';

void main() {
  // Regression test: the bottom navigation bar used to be wrapped in a Center,
  // which expands to fill all available height. That made the nav bar claim the
  // whole screen and left the Scaffold body with zero height, so no screen
  // content was ever painted.
  testWidgets('body fills the screen above the bottom navigation bar', (tester) async {
    SharedPreferences.setMockInitialValues({});
    await tester.pumpWidget(const BioMaturaApp());
    for (var i = 0; i < 10; i++) {
      await tester.pump(const Duration(milliseconds: 100));
    }

    final screenHeight = tester.getSize(find.byType(MaterialApp)).height;
    final homeHeight = tester.getSize(find.byType(HomeScreen, skipOffstage: false)).height;

    // The body must take up most of the screen, not collapse to nothing.
    expect(homeHeight, greaterThan(screenHeight * 0.6),
        reason: 'Scaffold body collapsed — check that bottomNavigationBar does not expand');

    // The nav bar sits at the bottom, not floating in the middle.
    final navLabel = tester.getRect(find.text('Nauka'));
    expect(navLabel.top, greaterThan(screenHeight * 0.8),
        reason: 'bottom navigation bar is not anchored to the bottom of the screen');

    // Home screen content is actually on stage (painted), not clipped away.
    expect(find.text('Cześć'), findsOneWidget);
  });
}
