import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test1/screen/models/transaction.dart';
import 'package:test1/screen/providers/transaction_provider.dart';

class FormScreen extends StatelessWidget {
  final formKey = GlobalKey<FormState>();

//controller
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("แบบฟอร์มบันทึกข้อมูล"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  decoration: new InputDecoration(labelText: "ชื่อรายการ"),
                  autofocus: true,
                  controller: titleController,
                  validator: (String str) {
                    if (str.isEmpty) {
                      //ชื่อรายการเป็นค่าว่าง
                      return "กรุณาป้อนชื่อรายการ";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: new InputDecoration(labelText: "จำนวนเงิน"),
                  keyboardType: TextInputType.number,
                  controller: amountController,
                  validator: (String str) {
                    if (str.isEmpty) {
                      return "กรุณาระบุจำนวนเงิน";
                    }
                    if (double.parse(str) <= 0) {
                      return "กรุณาป้อนตัวเลขมากกว่า 0";
                    }
                    return null;
                  },
                ),
                FlatButton(
                  child: Text("เพิ่มข้อมูล"),
                  color: Colors.green,
                  textColor: Colors.white,
                  onPressed: () {
                    if (formKey.currentState.validate()) {
                      var title = titleController.text;
                      var amount = amountController.text;

                      print(title);
                      print(amount);

                      //เตรียมข้อมูล
                      Transaction statement = Transaction(
                          title: title,
                          amount: double.parse(amount),
                          date: DateTime.now());

                      //เรียกprovider
                      var provider = Provider.of<TransactionProvider>(context,
                          listen: false);
                      provider.addTransaction(statement);
                      Navigator.pop(context);
                    }
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
