// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:cstech_assignment/app.dart';
import 'package:cstech_assignment/screens/language_selection_screen.dart';
import 'package:cstech_assignment/screens/register_screen.dart';
import 'package:cstech_assignment/screens/login_screen.dart';
import 'package:cstech_assignment/screens/welcome_screen.dart';
import 'package:cstech_assignment/screens/dashboard_screen.dart';
import 'package:cstech_assignment/screens/call_stats_screen.dart';
import 'package:cstech_assignment/screens/otp_verification_screen.dart';
import 'package:cstech_assignment/widgets/app_drawer.dart';

void main() {
  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  testWidgets('App loads smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const CalleyApp());

    // Verify that the language selection screen is displayed.
    expect(find.text('Choose Your Language'), findsOneWidget);
  });

  testWidgets('Language selection screen navigation', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: LanguageSelectionScreen()));

    // Verify initial screen
    expect(find.text('Choose Your Language'), findsOneWidget);
    expect(find.text('English'), findsOneWidget);

    // Tap select button
    await tester.tap(find.text('Select'));
    await tester.pumpAndSettle();

    // Should navigate to register screen
    expect(find.text('Welcome!'), findsOneWidget);
    expect(find.text('Please register to continue'), findsOneWidget);
  });

  testWidgets('Register screen displays correctly', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: RegisterScreen()));

    // Verify initial screen
    expect(find.text('CALLEY'), findsOneWidget);
    expect(find.text('Welcome!'), findsOneWidget);
    expect(find.text('Please register to continue'), findsOneWidget);
    expect(find.text('Sign Up'), findsOneWidget);
    expect(find.text('Already have an account? Sign In'), findsOneWidget);
  });

  testWidgets('Login screen navigation to register', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: LoginScreen()));

    // Verify initial screen
    expect(find.text('Welcome'), findsOneWidget);
    expect(find.text('Please sign-in to continue'), findsOneWidget);

    // Tap sign up link
    await tester.tap(find.text("Don't have an account? Sign Up"));
    await tester.pumpAndSettle();

    // Should navigate to register screen
    expect(find.text('Welcome!'), findsOneWidget);
    expect(find.text('Please register to continue'), findsOneWidget);
  });

  testWidgets('Welcome screen navigation', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: WelcomeScreen()));

    // Verify initial screen
    expect(find.text('Hello User'), findsOneWidget);
    expect(find.text('Calley Personal'), findsOneWidget);

    // Tap start calling button
    await tester.tap(find.text('Star Calling Now'));
    await tester.pumpAndSettle();

    // Should navigate to dashboard
    expect(find.text('Welcome to Dashboard'), findsOneWidget);
  });

  testWidgets('Dashboard screen displays correctly', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: DashboardScreen()));

    // Verify initial screen
    expect(find.text('Dashboard'), findsOneWidget);
    expect(find.text('Welcome to Dashboard'), findsOneWidget);
    expect(find.text('Star Calling Now'), findsOneWidget);
  });

  testWidgets('App drawer displays correctly', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: Scaffold(drawer: AppDrawer(), body: Container())));

    // Open drawer
    await tester.dragFrom(const Offset(0, 100), const Offset(300, 100));
    await tester.pump();

    // Verify drawer items
    expect(find.text('Getting Started'), findsOneWidget);
    expect(find.text('Sync Data'), findsOneWidget);
    expect(find.text('Settings'), findsOneWidget);
    expect(find.text('Logout'), findsOneWidget);
  });

  testWidgets('OTP verification screen displays correctly', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: OtpVerificationScreen(email: 'test@example.com')));

    // Verify initial screen
    expect(find.text('Email OTP Verification'), findsOneWidget);
    expect(find.textContaining('test@example.com'), findsOneWidget);
    expect(find.text('Verify'), findsOneWidget);
  });

  testWidgets('Call stats screen displays correctly', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: CallStatsScreen(userId: 'test_user_id')));

    // Verify initial screen shows loading
    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    // Wait for loading to complete (in real app this would load data)
    await tester.pumpAndSettle();

    // Since we can't mock API calls easily in basic tests, just check that screen renders
    expect(find.text('Call Statistics'), findsOneWidget);
  });
}
