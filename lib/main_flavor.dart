import 'package:base_structure/core/presentation/app_widget.dart';
import 'package:base_structure/flavors.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void buildFlavor(Flavor flavor) {
  F.appFlavor = flavor;
  runApp(ProviderScope(child: AppWidget()));
}
