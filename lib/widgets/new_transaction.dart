import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            // Title
            TextField(
              controller: titleController,
              // onChanged: (value) {
              //   titleInput = value;
              // },
              cursorColor: Colors.purple,
              decoration: const InputDecoration(
                labelText: 'Title',
                hintStyle: const TextStyle(color: Colors.purple),
              ),
            ),
            // Amount
            TextField(
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              controller: amountController,
              // onChanged: (val) => amountInput = val,
              cursorColor: Colors.purple,
              decoration: const InputDecoration(
                labelText: 'Amount',
              ),
            ),
            TextButton(
              onPressed: () {
                addTx(
                  titleController.text,
                  double.parse(amountController.text),
                );
              },
              child: const Text(
                'Add Transaction',
                style: TextStyle(
                  color: Colors.purple,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
