import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'user_data.dart';
import 'package:intl/intl.dart';

class AccountsPage extends StatefulWidget {
  const AccountsPage({super.key});

  @override
  _AccountsPageState createState() => _AccountsPageState();
}

class _AccountsPageState extends State<AccountsPage> {
  final List<bool> _isExpanded = [];

  double _calculateBalance(List<dynamic> transactions) {
    double balance = 0.0;
    for (var transaction in transactions) {
      if (transaction['transactionType'] == 'credit') {
        balance += transaction['amount'];
      } else if (transaction['transactionType'] == 'debit') {
        balance -= transaction['amount'];
      }
    }
    return balance;
  }

  int? _expandedIndex;

  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<UserData>(context).userData;
    final accounts = userData?['accounts'] ?? [];
    _isExpanded.addAll(List.generate(accounts.length, (index) => false));

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: AppBar(
          elevation: 1,
          title: SvgPicture.asset(
            'assets/images/logo.svg',
          ),
          centerTitle: true,
        ),
      ),
      body: ListView.builder(
        itemCount: accounts.length,
        itemBuilder: (context, index) {
          final account = accounts[index];
          final balance = _calculateBalance(account['transactions']);
          return Card(
            child: ExpansionTile(
              key: Key(index.toString()),
              title: Text('Account Number: ${account['accountNumber']}'),
              subtitle: Text('Account Type: ${account['accountType']}\nBalance: \$${balance.toStringAsFixed(2)}'),
              initiallyExpanded: _expandedIndex == index,
              onExpansionChanged: (expanded) {
                setState(() {
                  _expandedIndex = expanded ? index : null;
                });
              },
              children: account['transactions'].map<Widget>((transaction) {
                final date = DateFormat.yMMMd().format(DateTime.parse(transaction['transactionDate']));
                final isCredit = transaction['transactionType'] == 'credit';
                final amountColor = isCredit ? Colors.green : Colors.red;
                return ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(transaction['description']),
                          Text(date, style: TextStyle(color: Colors.grey)),
                        ],
                      ),
                      Text(
                        '\$${transaction['amount'].toStringAsFixed(2)}',
                        style: TextStyle(color: amountColor),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          );
        },
      ),
    );
  }
}