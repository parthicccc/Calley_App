import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cstech_assignment/app.dart';

void main() {
  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  testWidgets('Calley app loads successfully', (WidgetTester tester) async {
    // Build the app
    await tester.pumpWidget(const CalleyApp());

    // Basic smoke test to ensure app runs without errors
    expect(find.byType(CalleyApp), findsOneWidget);
  });
}
