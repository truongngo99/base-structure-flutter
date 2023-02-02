import 'package:auto_route/auto_route.dart';
import 'package:base_structure/core/presentation/route/app_route.dart';
import 'package:base_structure/core/presentation/widgets/common_button.dart';
import 'package:base_structure/presentation/login/widgets/login_custom_textfield.dart';
import 'package:base_structure/theme/constants.dart';
import 'package:flutter/material.dart';

class LoginContentWidget extends StatefulWidget {
  const LoginContentWidget(
      {super.key, required this.formKey, required this.themeData});

  final GlobalKey<FormState> formKey;
  final ThemeData themeData;

  @override
  State<LoginContentWidget> createState() => _LoginContentWidgetState();
}

class _LoginContentWidgetState extends State<LoginContentWidget> {
  TextEditingController? idTextEdtController;

  TextEditingController? passwordTextEdtController;
  @override
  void initState() {
    idTextEdtController = TextEditingController();
    passwordTextEdtController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    idTextEdtController!.dispose();
    passwordTextEdtController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Container(
        color: widget.themeData.colorScheme.background,
        padding: const EdgeInsets.only(
            top: AppPadding.p92,
            bottom: AppPadding.p92,
            left: AppPadding.p56,
            right: AppPadding.p56),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppString.loginTitle,
              style: widget.themeData.textTheme.headlineLarge
                  ?.copyWith(color: widget.themeData.colorScheme.onTertiary),
            ),
            const SizedBox(
              height: AppPadding.p16,
            ),
            Text(
              AppString.welcomeTitle,
              style: widget.themeData.textTheme.headlineSmall?.copyWith(
                  color: widget.themeData.colorScheme.onTertiary
                      .withOpacity(0.56)),
            ),
            Text(
              AppString.loginGuideTitle,
              style: widget.themeData.textTheme.headlineSmall?.copyWith(
                  color: widget.themeData.colorScheme.onTertiary
                      .withOpacity(0.56)),
            ),
            const SizedBox(
              height: AppPadding.p32,
            ),
            Text(
              AppString.idLabel,
              style: widget.themeData.textTheme.bodyLarge
                  ?.copyWith(color: widget.themeData.colorScheme.tertiary),
            ),
            const SizedBox(
              height: AppPadding.p8,
            ),
            CustomTextField(
              themeData: widget.themeData,
              textEditingController: idTextEdtController!,
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(
              height: AppPadding.p32,
            ),
            Text(
              AppString.passwordLabel,
              style: widget.themeData.textTheme.bodyLarge
                  ?.copyWith(color: widget.themeData.colorScheme.tertiary),
            ),
            const SizedBox(
              height: AppPadding.p8,
            ),
            CustomTextField(
              themeData: widget.themeData,
              textEditingController: passwordTextEdtController!,
              textInputAction: TextInputAction.done,
            ),
            const SizedBox(
              height: AppPadding.p56,
            ),
            CommonButton(
                width: double.infinity,
                height: AppButtonSize.bigButtonHeight,
                contentWidget: Text(
                  AppString.loginButtonLabel,
                  style: widget.themeData.textTheme.titleSmall
                      ?.copyWith(color: widget.themeData.colorScheme.onSurface),
                ),
                onPressed: () {
                  if (widget.formKey.currentState!.validate()) {
                    //check if form data are valid
                    AutoRouter.of(context).replace(const HomeRoute());
                  }
                })
          ],
        ),
      ),
    );
  }
}
