import 'package:base_structure/gen/colors.gen.dart';
import 'package:base_structure/presentation/home/widgets/custom_header.dart';
import 'package:base_structure/presentation/home/widgets/item_home.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return Scaffold(
      // backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        toolbarHeight: 84,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        // title: const CustomHeader(),
        flexibleSpace: const Center(
          child: CustomHeader(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 32, right: 46.86),
        child: ListView(
          shrinkWrap: true,
          children: [
            const SizedBox(
              height: 18,
            ),
            Text("恵比寿丸", style: textTheme.bodyMedium),
            const Padding(
              padding: EdgeInsets.only(top: 7, bottom: 16),
              child: Divider(
                color: ColorName.blueDevice,
                thickness: 3,
              ),
            ),
            const ItemHomeWidget(
              enable: false,
            ),
            const ItemHomeWidget(
              enable: true,
            ),
            const ItemHomeWidget(
              enable: true,
            ),
          ],
        ),
      ),
    );
  }
}
