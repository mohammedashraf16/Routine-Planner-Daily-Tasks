import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class CustomAnimatedTextKitWidget extends StatelessWidget {
  const CustomAnimatedTextKitWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedTextKit(
      animatedTexts: [
        TypewriterAnimatedText(
          textAlign: TextAlign.center,
          AppLocalizations.of(context)!.add_new_task,
          textStyle: Theme
              .of(context)
              .textTheme
              .bodyLarge,
          speed: const Duration(milliseconds: 100),
        ),
      ],
      totalRepeatCount: Duration.millisecondsPerSecond,
      pause: const Duration(milliseconds: 100),
      displayFullTextOnTap: true,
      stopPauseOnTap: true,
    );
  }
}
