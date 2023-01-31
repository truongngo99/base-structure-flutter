import 'package:base_structure/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ItemShipWidget extends ConsumerWidget {
  const ItemShipWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      decoration: BoxDecoration(
        color: const Color(0xFFE9F7FF),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Row(
        children: [
          Assets.images.svg.icFish.svg(),
          const SizedBox(
            width: 4,
          ),
          const Text(
            "1回目",
            style: TextStyle(
              color: Color(0xFF01A7D9),
              fontSize: 15,
              height: 1,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          const Text(
            "合計11箱/224kg, ◎ミナミマグロ",
            style: TextStyle(
              color: Color(0xFF01A7D9),
              fontSize: 15,
              height: 1,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
