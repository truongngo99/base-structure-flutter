import 'package:base_structure/presentation/home/widgets/custom_header.dart';
import 'package:base_structure/presentation/home/widgets/item_home.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        toolbarHeight: 84,
        backgroundColor: Colors.white,
        // title: const CustomHeader(),
        flexibleSpace: const Center(child: CustomHeader()),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 32, right: 46.86),
        child: ListView(
          shrinkWrap: true,
          children: [
            const SizedBox(
              height: 18,
            ),
            const Text(
              "恵比寿丸",
              style: TextStyle(
                  color: Color(0xFF2D3748),
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  height: 36 / 22),
            ),
            Container(
              color: const Color(0xFF01A7D9),
              margin: const EdgeInsets.only(top: 7, bottom: 16),
              height: 3,
            ),
            const ItemHomeWidget(),
            const ItemHomeWidget(),
            const ItemHomeWidget(),
            // ListView.builder(
            //   shrinkWrap: true,
            //   physics: const FixedExtentScrollPhysics(),
            //   itemCount: 3,
            //   itemBuilder: (context, index) {
            //     return const ItemHomeWidget();
            //   },
            // )
          ],
        ),
      ),
    );
  }
}
