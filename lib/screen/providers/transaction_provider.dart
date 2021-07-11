import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:test1/screen/models/transaction.dart';

class TransactionProvider with ChangeNotifier {
  //ตัวอย่างข้อมูล
  List<Transaction> transactions = [
    
  ];
  //ดึงข้อมูล
  List<Transaction> getTransaction() {
    return transactions;
  }

  addTransaction(Transaction statement) {
    transactions.insert(0,statement);

    notifyListeners();
  }
}
