import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CustomHeader extends ConsumerWidget {
  const CustomHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      // color: Colors.white,
      // height: 84,
      padding: const EdgeInsets.only(right: 45.29),
      // alignment: Alignment.centerLeft,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            padding: const EdgeInsets.all(0),
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 12,
              color: Color(0xFF707070),
            ),
          ),
          IconButton(
            padding: const EdgeInsets.all(0),
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_forward_ios,
              color: Color(0xFF707070),
              size: 12,
            ),
          ),
          const Text(
            "2022/06/12 (日)",
            style: TextStyle(
                fontSize: 18,
                height: 44 / 18,
                fontWeight: FontWeight.w800,
                color: Colors.black),
          ),
          const Icon(Icons.keyboard_arrow_down),
          Text(
            "の記録",
            style: TextStyle(
                color: Colors.grey[700],
                fontSize: 29,
                height: 44 / 29,
                fontWeight: FontWeight.w700),
          ),
          Container(
            margin: const EdgeInsets.only(left: 24),
            padding: const EdgeInsets.symmetric(horizontal: 34, vertical: 6),
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.grey.shade400),
                borderRadius: BorderRadius.circular(5)),
            child: const Text(
              "今日",
              style: TextStyle(
                  color: Color.fromRGBO(0, 0, 0, 0.56),
                  fontSize: 14,
                  height: 1.5,
                  fontWeight: FontWeight.w700),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 24),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.grey.shade400),
              borderRadius: BorderRadius.circular(50),
            ),
            child: Row(
              children: const [
                Icon(
                  Icons.settings,
                  size: 13,
                  color: Color(0xFF707070),
                ),
                SizedBox(
                  width: 6.66,
                ),
                Text(
                  "設定",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Color.fromRGBO(0, 0, 0, 0.56),
                      height: 1.5),
                )
              ],
            ),
          ),
          const Expanded(child: SizedBox.shrink()),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 32),
            decoration: BoxDecoration(
                color: const Color(0xFF01A7D9),
                borderRadius: BorderRadius.circular(100),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF000000).withOpacity(0.02),
                    offset: const Offset(0, 0),
                    blurRadius: 0,
                    spreadRadius: 1,
                  ),
                  BoxShadow(
                    color: const Color(0xFF000000).withOpacity(0.16),
                    offset: const Offset(0, 2),
                    blurRadius: 6,
                    spreadRadius: 0,
                  ),
                ]),
            child: Row(
              children: const [
                Icon(
                  Icons.refresh,
                  color: Colors.white,
                  size: 15,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "記録を送信",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    height: 16 / 14,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
