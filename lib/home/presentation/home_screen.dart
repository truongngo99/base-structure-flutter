import 'package:auto_route/auto_route.dart';
import 'package:base_structure/core/presentation/route/app_route.dart';
import 'package:base_structure/flavors.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(F.title),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                key: const Key("btnDetail"),
                onPressed: () => context.router.push(const DetailRoute()),
                child: const Text(key: Key("gotodetail"), "Go To Detail")),
            ElevatedButton(
              key: const Key("btnGRPC"),
              onPressed: () => context.router.push(const BookRoute()),
              child: const Text("Go To Demo gRPC"),
            ),
          ],
        ),
      ),
    );
  }
}
