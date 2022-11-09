import 'package:auto_route/auto_route.dart';
import 'package:base_structure/home/infrastructure/model/transaction.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TransactionDialogScreen extends ConsumerStatefulWidget {
  final Transaction? transaction;
  final Function(String name, double amount, bool isExpense) onClickDone;
  const TransactionDialogScreen(
      {super.key, this.transaction, required this.onClickDone});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _TransactionDialogScreenState();
}

class _TransactionDialogScreenState
    extends ConsumerState<TransactionDialogScreen> {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final amountController = TextEditingController();

  bool isExpense = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.transaction != null) {
      final transaction = widget.transaction!;
      nameController.text = transaction.name;
      amountController.text = transaction.amount.toString();
      isExpense = transaction.isExpense;
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    nameController.dispose();
    amountController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.transaction != null;
    final title = isEditing ? "Edit Transaction" : "Add Transaction";
    return AlertDialog(
      title: Text(title),
      content: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 8,
              ),
              buildName(),
              const SizedBox(
                height: 8,
              ),
              buildAmount(),
              const SizedBox(
                height: 8,
              ),
              buildRadioButtons(),
            ],
          ),
        ),
      ),
      actions: [
        buildCannelButton(context),
        buildAddButton(context, isEditing: isEditing),
      ],
    );
  }

  Widget buildName() => TextFormField(
        controller: nameController,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          hintText: "Enter Name",
        ),
        validator: (name) =>
            name != null && name.isEmpty ? "Enter a name" : null,
      );

  Widget buildAmount() => TextFormField(
        controller: amountController,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          hintText: "Enter Amount",
        ),
        keyboardType: TextInputType.number,
        validator: (amount) => amount != null && double.tryParse(amount) == null
            ? "Enter a valid number"
            : null,
      );

  Widget buildRadioButtons() => Column(
        children: [
          RadioListTile(
            title: const Text("Expense"),
            value: true,
            groupValue: isExpense,
            onChanged: (value) => setState(() => isExpense = value!),
          ),
          RadioListTile(
            title: const Text("Income"),
            value: false,
            groupValue: isExpense,
            onChanged: (value) => setState(() => isExpense = value!),
          ),
        ],
      );
  Widget buildCannelButton(BuildContext context) => TextButton(
        onPressed: () => context.router.pop(),
        child: const Text("Cancel"),
      );

  Widget buildAddButton(BuildContext context, {required bool isEditing}) {
    final text = isEditing ? "Save" : "Add";
    return TextButton(
      onPressed: () async {
        final isValid = formKey.currentState!.validate();

        if (isValid) {
          final name = nameController.text;
          final amount = double.tryParse(amountController.text) ?? 0;
          widget.onClickDone(name, amount, isExpense);
          context.router.pop();
        }
      },
      child: Text(text),
    );
  }
}
