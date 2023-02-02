import 'package:base_structure/gen/assets.gen.dart';
import 'package:base_structure/presentation/login/widgets/login_content_widget.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginScreen extends ConsumerWidget {
  LoginScreen({super.key});

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final themeData = Theme.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: SizedBox(
            width: width,
            height: height,
            child: Row(
              children: [
                Expanded(
                    child: LoginContentWidget(
                  formKey: formKey,
                  themeData: themeData,
                )),
                Expanded(
                    child: Assets.images.png.bgLogin.image(
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.fill))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
