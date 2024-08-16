import 'package:flutter/material.dart';

class TransactionsPage extends StatelessWidget {
  final List<dynamic> transactions;

  const TransactionsPage({super.key, required this.transactions});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transactions'),
      ),
      body: ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (context, index) {
          final transaction = transactions[index];
          return ListTile(
            title: Text(transaction['description']),
            subtitle: Text('Amount: \$${transaction['amount'].toStringAsFixed(2)}'),
            trailing: Text(transaction['transactionType']),
          );
        },
      ),
    );
  }
}