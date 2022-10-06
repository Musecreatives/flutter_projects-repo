import 'package:flutter/material.dart';
import '../utils/dbhelper.dart';
import '../models/shopping_list.dart';

class ShoppingListDialog {
  final txtName = TextEditingController();
  final txtPriority = TextEditingController();

  Widget buildDialog(
      BuildContext context, ShoppingList? shoppingList, boolisNew) {
    DbHelper helper = DbHelper();
    if (!isNew) {
      txtName.text = list.name;
      txtPriority.text = list.priority.toString();
    }
  }
}
