import 'package:flutter/material.dart';

import './transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
      id: 't1',
      title: 'New Shoes',
      amount: 69.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Groceries',
      amount: 15.99,
      date: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Card(
              color: Colors.purple,
              child: Text('Chart'),
              elevation: 7,
            ),
          ),
          Column(
            children: transactions.map((tx) {
              return Card(
                child: Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 15,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.cyan,
                          width: 2,
                        ),
                      ),
                      padding: EdgeInsets.all(10),
                      child: Text(
                        tx.amount.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.cyan,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          tx.title,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          tx.date.toString(),
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}