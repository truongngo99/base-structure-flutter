import 'package:base_structure/core/presentation/app_widget.dart';
import 'package:base_structure/flavors.dart';
import 'package:base_structure/home/infrastructure/model/transaction.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

Future<void> buildFlavor(Flavor flavor) async {
  F.appFlavor = flavor;
  await Hive.initFlutter();
  Hive.registerAdapter(TransactionAdapter());
  await Hive.openBox<Transaction>("transaction");
  runApp(ProviderScope(child: AppWidget()));
}
