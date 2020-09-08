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
        : ListView(
            children: transactions
                .map((tx) => TransactionItem(
                      key: ValueKey(tx.id),
                      transaction: tx,
                      deleteTx: deleteTx,
                    ))
                .toList(),
          );
    // : ListView.builder(
    //     itemBuilder: (context, index) {
    //       return TransactionItem(
    //         // UniqueKey() built into Flutter and it automatically creates
    //         // a unique key for every new item.
    //         // But the UniqueKey() it's called whenever our ListView updates
    //         // and that happens whenever set state is called and when
    //         // our build methods reruns.
    //         // With new key generated constantly, Flutter finds no widgets
    //         // for the elements that now look for widget type + key. Hence
    //         // new state objects are created all the time.
    //         // ValueKey() instead I pass my own identifier
    //         key: ValueKey(transactions[index].id),
    //         transaction: transactions[index],
    //         deleteTx: deleteTx,
    //       );
    //     },
    //     itemCount: transactions.length,
    //   );
  }
}
