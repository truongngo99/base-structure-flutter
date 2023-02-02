import 'package:base_structure/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: width,
          height: height,
          child: Row(
            children: [
              Expanded(
                  child: Container(
                padding: const EdgeInsets.only(top: 94, bottom: 94, left: 56),
                color: Colors.amber,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text(data)],
                ),
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
    );
  }
}
