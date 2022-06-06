import 'package:flutter/material.dart';
import 'package:foodapp/ItemModal.dart';
import 'package:foodapp/main.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'button.dart';

class Mycarditem extends StatefulWidget {
  final Box<ItemModal> boxnew;
  const Mycarditem({Key? key, required this.boxnew}) : super(key: key);

  @override
  State<Mycarditem> createState() => _MycarditemState();
}

class _MycarditemState extends State<Mycarditem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Your Cart'),
          centerTitle: true,
          backgroundColor: Colors.pink),
      body: Column(
        children: [
          ValueListenableBuilder(
            valueListenable: widget.boxnew.listenable(),
            builder: (context, Box<ItemModal> todos, _) {
              List<int> keys = todos.keys.cast<int>().toList();
              return ListView.separated(
                itemBuilder: (_, index) {
                  final int key = keys[index];
                  final ItemModal todo = todos.get(key) as ItemModal;

                  return ListTile(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(todo.itemname),
                          Text('qnt :${todo.qty}'),
                          todo.itemimage,
                          Text('Price :'),
                          Text('Rs :${todo.price}')
                          // PopupMenuButton(
                          //   onSelected: (item) {
                          //     switch (item) {
                          //       case 'update':
                          //         _namefieldcontroller.text = todo.name;
                          //         _phonfieldcontroller.text = todo.phone;

                          //         break;
                          //       case 'delete':
                          //         todos.deleteAt(index);
                          //     }
                          //   },
                          //   itemBuilder: (context) {
                          //     return [
                          //       PopupMenuItem(
                          //         value: 'delete',
                          //         child: Text('Delete'),
                          //       ),
                          //     ];
                          //   },
                          // ),
                        ],
                      ),
                      subtitle: Text('Item Id:${todo.id}'),
                      leading: Stack(
                        children: [
                          Icon(
                            Icons.circle,
                            size: 42,
                            color: Colors.blue[600],
                          ),
                          Icon(Icons.person, color: Colors.yellow)
                        ],
                        alignment: Alignment.center,
                      ));
                },
                separatorBuilder: (_, index) => Divider(),
                itemCount: keys.length,
                shrinkWrap: true,
              );
            },
          )
        ],
      ),
    );
  }
}
