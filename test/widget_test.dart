import 'package:flutter_test/flutter_test.dart';
import 'package:profile_app/main.dart';

void main() {
  testWidgets('Viet Hoang Profile smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const ProfileApp());

    expect(find.text('Profile'), findsOneWidget);
    expect(find.text('Việt Hoàng'), findsOneWidget);
    expect(find.text('Công nghệ phần mềm'), findsOneWidget);
    expect(find.text('Hà Nội, Việt Nam'), findsOneWidget);
    expect(find.text('Hoangtv3108@gmail.com'), findsOneWidget);
    expect(find.text('0946506675'), findsOneWidget);
  });
}
