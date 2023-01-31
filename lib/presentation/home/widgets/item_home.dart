import 'package:base_structure/gen/assets.gen.dart';
import 'package:base_structure/presentation/home/widgets/item_ship.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ItemHomeWidget extends ConsumerStatefulWidget {
  const ItemHomeWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ItemHomeWidgetState();
}

class _ItemHomeWidgetState extends ConsumerState<ItemHomeWidget> {
  @override
  Widget build(BuildContext context) {
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
            children: [
              Column(
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: const Color(0xFF01A7D9),
                        width: 1,
                      ),
                    ),
                    child: const Text(
                      "操業",
                      style: TextStyle(
                          color: Color(0xFF01A7D9),
                          fontSize: 13,
                          height: 16 / 13,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: const [
                      Text(
                        "06:00",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 48,
                            height: 1,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text(
                        "の記録",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            height: 1,
                            fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Icon(
                        Icons.check,
                        color: Color(0xFF01A7D9),
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
                    shape: BoxShape.circle, color: Color(0xFFF7F7F7)),
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
                      color: Color(0xFFF7F7F7),
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
                      color: Color(0xFF01A7D9),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 14,
          ),
          const Text(
            "35°27.15N 139°22.55E / 899-345 ・はれ・きた6m/s・水温5℃・気温1℃・1020hPa",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              height: 23 / 16,
              color: Color(0xFF718096),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(
              top: 14,
              bottom: 14,
            ),
            height: 1,
            color: const Color(0xFFCBD5E0),
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
                return const ItemShipWidget();
              },
            ),
          )
        ],
      ),
    );
  }
}
