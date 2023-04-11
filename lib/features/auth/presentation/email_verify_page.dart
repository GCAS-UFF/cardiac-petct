import 'package:cardiac_petct/src/shared/resources/images.dart';
import 'package:cardiac_petct/src/ui/petct_elevated_button.dart';
import 'package:cardiac_petct/src/ui/petct_outlined_button.dart';
import 'package:flutter/material.dart';

class EmailVerifyPage extends StatefulWidget {
  const EmailVerifyPage({super.key});

  @override
  State<EmailVerifyPage> createState() => _EmailVerifyPageState();
}

class _EmailVerifyPageState extends State<EmailVerifyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 22),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              'Confirmação de email',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              'Acesse sua conta de email e clique no link de verificação.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(
              height: 56,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  Images.emailVerifyIllustration,
                ),
              ],
            ),
            const SizedBox(
              height: 56,
            ),
            Row(
              children: [
                Expanded(
                  child: PetctElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      'Email confirmado',
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Expanded(
                  child: PetctOutlinedButton(
                    onPressed: () {},
                    child: const Text(
                      'Reenviar email',
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
