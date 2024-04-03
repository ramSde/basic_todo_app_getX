import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:todo_app_demo_using_getx/todoController.dart';

main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: TodoAPP(),
    );
  }
}

class TodoAPP extends StatelessWidget {
  TodoAPP({super.key});
  final _todocontoller = Get.put(todocontoller());
  final edittext = TextEditingController();
  final task = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Get x todo app"),
        actions: [
          IconButton(
              onPressed: () async {
                await showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: TextField(
                                controller: task,
                                decoration:
                                    InputDecoration(hintText: "Enter edited "),
                              ),
                            ),
                            SizedBox(height: 10),
                            IconButton(
                                onPressed: () {
                                  _todocontoller.addNew(task.text);
                                  Navigator.pop(context);
                                },
                                icon: Icon(Icons.save_sharp))
                          ],
                        ),
                      );
                    });
              },
              icon: Icon(
                Icons.add,
                size: 20,
              ))
        ],
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child:Obx(() => ListView.builder(
            itemCount: _todocontoller.data.length,
            itemBuilder: (context, index) {
              return Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                child: Card(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "${_todocontoller.data[index]}",
                        style: TextStyle(color: Colors.red),
                      ),
                      
                      IconButton(
                          onPressed: () async {
                            await showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    content: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: TextField(
                                            controller: edittext,
                                            decoration: InputDecoration(
                                                hintText: "Enter edited "),
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        IconButton(
                                            onPressed: () {
                                              _todocontoller.edittask(
                                                  index, edittext.text);
                                              Navigator.pop(context);
                                            },
                                            icon: Icon(Icons.save_alt))
                                      ],
                                    ),
                                  );
                                });
                          },
                          icon: Icon(
                            Icons.edit,
                            size: 20,
                          )),
                      
                      IconButton(
                          onPressed: () {
                            _todocontoller.deletetask(index);
                          },
                          icon: Icon(
                            Icons.delete,
                            size: 20,
                          ))
                    ],
                  ),
                ),
              );
            }),
      ),)
    );
  }
}
