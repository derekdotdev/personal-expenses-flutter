import 'package:flutter/material.dart';

import '../widgets/transaction_item.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  const TransactionList(this.transactions, this.deleteTx, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var themeErrorColor = Theme.of(context).errorColor;

    return transactions.isEmpty
        ? LayoutBuilder(builder: (ctx, constraints) {
            return Column(
              children: [
                const Text('No transactions added yet!'),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: constraints.maxHeight * 0.6,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            );
          })
        // ListView loads all children (even what's not visible)
        // ListView.builder() only loads what's visible on screen!
        // Builder is preferred
        : ListView.builder(
            itemBuilder: (ctx, index) {
              return TransactionItem(
                  transaction: transactions[index],
                  themeErrorColor: themeErrorColor,
                  deleteTx: deleteTx);
            },
            itemCount: transactions.length,
            // Instead of a array of widgets, use map method (toList)
            // to transform list of transaction objects into a list of widgets
            // children: transactions.map((tx) {}).toList(),
          );
  }
}
