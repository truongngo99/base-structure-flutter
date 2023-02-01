import 'package:base_structure/gen/assets.gen.dart';
import 'package:base_structure/gen/colors.gen.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ItemShipWidget extends ConsumerWidget {
  final bool enable;
  const ItemShipWidget({super.key, required this.enable});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      decoration: BoxDecoration(
        color: enable ? Colors.transparent : ColorName.blueSecondary,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Row(
        children: [
          Assets.images.svg.icFish.svg(
            color: enable ? ColorName.greyPrimary : ColorName.bluePrimary,
          ),
          const SizedBox(
            width: 4,
          ),
          Text("1回目",
              style: textTheme.bodySmall?.copyWith(
                  color: enable ? ColorName.greyPrimary : ColorName.bluePrimary,
                  fontWeight: FontWeight.w700)),
          const SizedBox(
            width: 8,
          ),
          Text("合計11箱/224kg, ◎ミナミマグロ",
              style: textTheme.bodySmall?.copyWith(
                  color: enable ? ColorName.greyPrimary : ColorName.bluePrimary,
                  fontWeight: FontWeight.w700)),
        ],
      ),
    );
  }
}
