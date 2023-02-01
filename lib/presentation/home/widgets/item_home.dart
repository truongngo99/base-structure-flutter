import 'package:base_structure/gen/assets.gen.dart';
import 'package:base_structure/gen/colors.gen.dart';
import 'package:base_structure/presentation/home/widgets/item_ship.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ItemHomeWidget extends ConsumerStatefulWidget {
  final bool enable;
  const ItemHomeWidget({super.key, required this.enable});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ItemHomeWidgetState();
}

class _ItemHomeWidgetState extends ConsumerState<ItemHomeWidget> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 30),
      margin: const EdgeInsets.only(bottom: 12),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              offset: Offset(0, 4),
              blurRadius: 16,
              color: Color.fromRGBO(0, 0, 0, 0.1),
            )
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: widget.enable
                            ? ColorName.greyPrimary
                            : ColorName.bluePrimary,
                        width: 1,
                      ),
                    ),
                    child: Text(
                      "操業",
                      style: textTheme.titleSmall?.copyWith(
                        color: widget.enable
                            ? ColorName.greyPrimary
                            : ColorName.bluePrimary,
                      ),
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text("06:00",
                          style: textTheme.headlineLarge?.copyWith(
                            height: 1,
                            fontWeight: FontWeight.w500,
                            color: widget.enable
                                ? ColorName.greyPrimary
                                : ColorName.blackPrimary,
                          )),
                      const SizedBox(
                        width: 6,
                      ),
                      Text("の記録",
                          style: textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.w700,
                            height: 1,
                            color: widget.enable
                                ? ColorName.greyPrimary
                                : ColorName.blackPrimary,
                          )),
                      const SizedBox(
                        width: 6,
                      ),
                      widget.enable
                          ? const SizedBox.shrink()
                          : const Icon(
                              Icons.check,
                              color: ColorName.bluePrimary,
                              size: 24,
                              weight: 22,
                            )
                    ],
                  ),
                ],
              ),
              const Expanded(child: SizedBox.shrink()),
              Container(
                width: 73,
                height: 73,
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: ColorName.greySecondary),
                child: Assets.images.svg.icShip.svg(),
              ),
              const SizedBox(
                width: 12.86,
              ),
              Stack(
                children: [
                  Container(
                    width: 73,
                    height: 73,
                    padding: const EdgeInsets.all(16),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: ColorName.greySecondary,
                    ),
                    child:
                        Assets.images.svg.icFishDash.svg(width: 10, height: 10),
                  ),
                  const Positioned(
                    right: 10,
                    top: 10,
                    child: Icon(
                      Icons.add_circle,
                      size: 18,
                      color: ColorName.bluePrimary,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 14,
          ),
          Text(
            "35°27.15N 139°22.55E / 899-345 ・はれ・きた6m/s・水温5℃・気温1℃・1020hPa",
            style: textTheme.bodyMedium?.copyWith(
                color: widget.enable
                    ? ColorName.greyPrimary
                    : ColorName.blackSecondary),
          ),
          const SizedBox(
            height: 14,
          ),
          const Divider(
            height: 1,
            color: ColorName.greyDevice,
          ),
          const SizedBox(
            height: 14,
          ),
          SizedBox(
            height: 40,
            width: double.infinity,
            child: ListView.builder(
              itemCount: 3,
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return ItemShipWidget(enable: widget.enable);
              },
            ),
          )
        ],
      ),
    );
  }
}
