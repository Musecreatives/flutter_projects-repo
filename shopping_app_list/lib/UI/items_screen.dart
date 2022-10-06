import 'package:flutter/material.dart';
import '../models/list_items.dart';
import '../models/shopping_list.dart';
import '../utils/dbhelper.dart';

class ItemsScreen extends StatefulWidget {
  final ShoppingList shoppingList;
  const ItemsScreen(this.shoppingList, {super.key});

  @override
  State<ItemsScreen> createState() => _ItemsScreenState(shoppingList);
}

class _ItemsScreenState extends State<ItemsScreen> {
  DbHelper? helper;
  List<ListItem>? items;
  final ShoppingList shoppingList;
  _ItemsScreenState(this.shoppingList);
  @override
  Widget build(BuildContext context) {
    helper = DbHelper();
    showData(shoppingList.id);
    return Scaffold(
      appBar: AppBar(
        title: Text(shoppingList.name),
      ),
      body: ListView.builder(
        itemCount: (items != null) ? items!.length : 0,
        itemBuilder: (BuildContext context, index) {
          return ListTile(
            title: Text(items![index].name),
            subtitle: Text(
                'Quantity: ${items![index].quantity} - Note: ${items![index].note}'),
            onTap: () {},
            trailing: IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () {},
            ),
          );
        },
      ),
    );
  }

  Future showData(int idList) async {
    await helper!.openDb();
    items = await helper!.getItems(idList);
    setState(() {
      items = items;
    });
  }
}                                 