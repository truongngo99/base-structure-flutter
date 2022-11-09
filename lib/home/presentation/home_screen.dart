import 'package:auto_route/auto_route.dart';
import 'package:base_structure/core/presentation/route/app_route.dart';
import 'package:base_structure/flavors.dart';
import 'package:base_structure/gen/colors.gen.dart';
import 'package:base_structure/home/infrastructure/boxes.dart';
import 'package:base_structure/home/infrastructure/model/transaction.dart';
import 'package:base_structure/home/presentation/widget/transaction_dialog.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    Hive.box("transaction").close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(F.title),
      ),
      body: ValueListenableBuilder(
          valueListenable: Boxes.getTransactions().listenable(),
          builder: (context, box, widget) {
            final transactions = box.values.toList().cast<Transaction>();
            return buildContent(transactions);
          }),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => showDialog(
          context: context,
          builder: (context) => TransactionDialogScreen(
            onClickDone: addTransaction,
          ),
        ),
      ),
    );
  }

  Widget buildContent(List<Transaction> transaction) {
    if (transaction.isEmpty) {
      return const Center(
        child: Text(
          "No expenses yet!",
          style: TextStyle(fontSize: 24),
        ),
      );
    } else {
      final netExpense = transaction.fold<double>(
        0,
        (previousValue, element) => element.isExpense
            ? previousValue - element.amount
            : previousValue + element.amount,
      );
      final newExpenseString = "\$${netExpense.toStringAsFixed(2)}";
      final color =
          netExpense > 0 ? ColorName.greenPrimary : ColorName.redPrimary;
      return Column(
        children: [
          const SizedBox(
            height: 24,
          ),
          Text(
            "Net Expense: $newExpenseString",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20, color: color),
          ),
          const SizedBox(
            height: 24,
          ),
          Expanded(
              child: ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: transaction.length,
                  itemBuilder: (context, index) {
                    final trans = transaction[index];
                    return buildTransaction(trans, context);
                  }))
        ],
      );
    }
  }

  Widget buildTransaction(Transaction transaction, BuildContext context) {
    final color =
        transaction.isExpense ? ColorName.redPrimary : ColorName.greenPrimary;
    final date = DateFormat.yMMMd().format(transaction.createDate);
    final amount = "\$ ${transaction.amount.toStringAsFixed(2)}";

    return Card(
      color: Colors.white,
      child: ExpansionTile(
        tilePadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        title: Text(
          transaction.name,
          maxLines: 2,
          style: TextStyle(
            color: color,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        subtitle: Text(date),
        trailing: Text(
          amount,
          style: TextStyle(
            color: color,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        children: [
          buildButton(context, transaction),
        ],
      ),
    );
  }

  Widget buildButton(BuildContext context, Transaction trans) => Row(
        children: [
          Expanded(
            child: TextButton.icon(
              onPressed: () => context.router.push(TransactionDialogRoute(
                  transaction: trans,
                  onClickDone: (name, amount, isExpense) =>
                      editTransaction(trans, name, amount, isExpense))),
              icon: const Icon(Icons.edit),
              label: const Text("Edit"),
            ),
          ),
          Expanded(
            child: TextButton.icon(
              label: const Text('Delete'),
              icon: const Icon(Icons.delete),
              onPressed: () => deleteTransaction(trans),
            ),
          )
        ],
      );

  Future addTransaction(String name, double amount, bool isExpense) async {
    final transaction = Transaction()
      ..name = name
      ..createDate = DateTime.now()
      ..amount = amount
      ..isExpense = isExpense;
    final box = Boxes.getTransactions();
    box.add(transaction);

    // final mybox = Boxes.getTransactions();
    // final myTransaction = mybox.get('key');
    // mybox.values;
    // mybox.keys;
  }

  void editTransaction(
    Transaction transaction,
    String name,
    double amount,
    bool isExpense,
  ) {
    transaction.name = name;
    transaction.amount = amount;
    transaction.isExpense = isExpense;
    transaction.save();
  }

  void deleteTransaction(Transaction transaction) {
    transaction.delete();
  }
}
