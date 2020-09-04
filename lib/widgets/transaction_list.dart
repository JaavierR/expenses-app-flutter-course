import 'package:flutter/material.dart';

import '../models/transaction.dart';
import './transaction_item.dart';

class TransacionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  TransacionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(
            builder: (ctx, contraints) {
              return Column(
                children: <Widget>[
                  Text('No Transactions Added Yet!',
                      style: Theme.of(context).textTheme.headline6),
                  SizedBox(
                    height: contraints.maxHeight * 0.1,
                  ),
                  Container(
                    height: contraints.maxHeight * 0.6,
                    child: Image.asset(
                      'assets/img/waiting.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              );
            },
          )
        : ListView.builder(
            itemBuilder: (context, index) {
              return TransactionItem(
                transaction: transactions[index],
                deleteTx: deleteTx,
              );
            },
            itemCount: transactions.length,
          );
  }
}
