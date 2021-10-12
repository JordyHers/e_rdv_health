import 'package:e_rdv_health/utils/widgets/customButton.dart';
import 'package:e_rdv_health/utils/widgets/customTextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';


///IMPORT MAIN
import 'package:e_rdv_health/main.dart' as app;

void main(){
group( 'App Test',(){

  ///  1- Implement IntegrationTestWidgetFlutterBinding
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  testWidgets('Full App test ', (tester) async {

    /// 2- Set up app.main();
     app.main();

     /// 3- Set up tester.pumpAndSettle
     await tester.pumpAndSettle();

     /// 4- Set Up finders for phone and Email
    final phoneFormField = find.byType(CustomTextField).first;
    final passwordFormField = find.byType(CustomTextField).last;
    final signInButton = find.byType(CustomButton);

    /// 5- Enter a text in the text field
    await tester.enterText(phoneFormField, '70090009');
    await tester.enterText(passwordFormField, '111111');
    await tester.tap(signInButton);
    await tester.pumpAndSettle();

    /// 6-Find Inkwell
    final firstCard = find.byType(InkWell).first;
    await tester.tap(firstCard);
    await tester.pumpAndSettle();



  });


});


}