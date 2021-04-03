import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:queen_alerts/src/dialogs/dto/animation_options.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:lottie/lottie.dart';

class InfoQueenDialog extends HookWidget {
  final String title;
  final String subtitle;
  final DialogOptions animationOptions;

  InfoQueenDialog({
    required this.title,
    required this.subtitle,
    required this.animationOptions,
  });

  @override
  Widget build(BuildContext context) {
    final controller = useAnimationController(duration: animationOptions.duration);
    final size = MediaQuery.of(context).size;
    final child = ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: size.height * .9,
        maxWidth: size.width * .9,
        minHeight: size.height * .45,
        minWidth: size.width * 0.8,
      ),
      child: Card(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: size.width * .02,
            vertical: size.height * .02,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Lottie.asset(
                'sucesso.json',
                height: size.height * .3,
                repeat: false,
                fit: BoxFit.fill,
                controller: controller,
                onLoaded: (_) async {
                  // await Future.delayed(animationOptions.duration);
                  controller.duration = Duration(seconds: 2);
                  await controller.forward();
                },
              ),
              Text(
                title,
                style: Theme.of(context).textTheme.headline6,
              ),
              Text(
                subtitle,
                style: Theme.of(context).textTheme.bodyText2,
              ),
              MaterialButton(
                // color: Colors.blue,
                onPressed: () {},
                child: Text(
                  'Ok',
                  style: Theme.of(context).textTheme.button,
                ),
              ),
            ],
          ),
        ),
      ),
    );

    return ScreenTypeLayout.builder(
      desktop: (_) {
        return ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: size.height * .9,
            maxWidth: size.width * .9,
            minHeight: size.height * .45,
            minWidth: size.width * 0.4,
          ),
          child: Card(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: size.width * .02,
                vertical: size.height * .02,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Lottie.asset(
                  //   'assets/sucesso.json',
                  //   package: 'queen_alerts',
                  //   height: size.height * .2,
                  //   repeat: false,
                  //   fit: BoxFit.fill,
                  //   controller: controller,
                  //   onLoaded: (_) async {
                  //     // await Future.delayed(animationOptions.duration);
                  //     controller.duration = Duration(seconds: 2);
                  //     await controller.forward();
                  //   },
                  // ),
                  Text(
                    title,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  Text(
                    subtitle,
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  MaterialButton(
                    color: Theme.of(context).buttonColor,
                    onPressed: () {},
                    child: Text(
                      'Ok',
                      style: Theme.of(context).textTheme.button,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      mobile: (_) => child,
    );
  }
}
