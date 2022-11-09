import 'package:base_structure/home/infrastructure/model/transaction.dart';
import 'package:hive/hive.dart';

class Boxes {
  static Box<Transaction> getTransactions() => Hive.box('transaction');
}
