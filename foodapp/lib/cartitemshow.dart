import 'package:flutter/material.dart';
import 'package:foodapp/ItemModal.dart';
import 'package:foodapp/main.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'button.dart';

class Mycarditem extends StatefulWidget {
  Mycarditem({
    Key? key,
  }) : super(key: key);

  @override
  State<Mycarditem> createState() => _MycarditemState();
}

class _MycarditemState extends State<Mycarditem> {
  Box<ItemModal>? finalbox;

  @override
  void initState() {
    //widgetholder1 = firstwidget();
    super.initState();
    finalbox = Hive.box<ItemModal>(BoxName);
  }

  Box<ItemModal>? todos;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Your Cart'),
          centerTitle: true,
          backgroundColor: Colors.pink),
      body: Column(
        children: [
          ValueListenableBuilder(
            valueListenable: finalbox!.listenable(),
            builder: (context, Box<ItemModal> todos, _) {
              List<int> keys = todos.keys.cast<int>().toList();

              if (keys.isEmpty) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: 170,
                    ),
                    Column(children: [
                      Container(
                        width: 350,
                        height: 350,
                        child: Image.asset('assets/images/cart3.png'),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ]),
                  ],
                );
              }

              return ListView.separated(
                itemBuilder: (_, index) {
                  final int key = keys[index];
                  final ItemModal todo = todos.get(key) as ItemModal;

                  return ListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8),
                              child: Text(todo.itemname,
                                  style: TextStyle(
                                    color: Colors.green[800],
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  )),
                            ),
                            Text('Qnt :${todo.qty}'),
                          ],
                        ),
                        Container(
                          width: 86,
                          height: 70,
                          child: Image.asset(todo.itemimage),
                        ),
                        Text('Price:'),
                        Text('Rs ${todo.price}'),
                        PopupMenuButton(
                          onSelected: (item) {
                            todos.deleteAt(index);
                          },
                          itemBuilder: (context) {
                            return [
                              PopupMenuItem(
                                value: 'delete',
                                child: Text('Delete'),
                              ),
                            ];
                          },
                        ),
                      ],
                    ),
                    subtitle: Text('Item Id:${todo.id}'),
                  );
                },
                separatorBuilder: (_, index) => Divider(
                  color: Colors.deepPurple[200],
                ),
                itemCount: keys.length,
                shrinkWrap: true,
              );
            },
          ),
        ],
      ),
    );
  }
}
