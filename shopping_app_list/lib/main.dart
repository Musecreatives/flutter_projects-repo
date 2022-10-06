import 'package:flutter/material.dart';
import './utils/dbhelper.dart';
import './models/shopping_list.dart';
import './models/list_items.dart';
import './UI/items_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shopping List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ShList(),
    );
  }
}

class ShList extends StatefulWidget {
  const ShList({super.key});

  @override
  State<ShList> createState() => _ShListState();
}

class _ShListState extends State<ShList> {
  List<ShoppingList>? shoppingList;
  DbHelper helper = DbHelper();
  @override
  Widget build(BuildContext context) {
    showData();
    return Scaffold(
        appBar: AppBar(
          title: const Text('Shopping List'),
        ),
        body: ListView.builder(
          itemCount: (shoppingList != null) ? shoppingList!.length : 0,
          itemBuilder: (BuildContext context, index) {
            return ListTile(
              title: Text(shoppingList![index].name),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ItemsScreen(shoppingList![index]),
                  ),
                );
              },
              trailing: IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () {},
              ),
            );
          },
        ));
  }

  Future showData() async {
    await helper.openDb();
    shoppingList = await helper.getLists();
    setState(() {
      shoppingList = shoppingList;
    });
  }
}
