import 'package:flutter/material.dart';
import 'package:to_do_list/modal/items.dart';
import 'widget/card_modal_bottom.dart';
import 'widget/card_body_widget.dart';


void main() {
  runApp( MaterialApp(
    home:MyApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatefulWidget {
   MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<DataItems> items = [

  ];

  void _handleaddTask(String name){
    final newItem = DataItems(id: DateTime.now().toString(),name: name);
    setState(() {
      items.add(newItem);
    });
  }
  void _handleDeleteTask (String id){

    setState(() {
      items.removeWhere((item) => item.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    print('rebuild');
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text(
          'ToDoList',
          style: TextStyle(fontSize: 30),
        )),
      ),
      body:   SingleChildScrollView(
        padding:  const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
        child: Column(
          children: items.map((item) =>  CardBody(
            index: items.indexOf(item),
            item: item,
            handleDelete: _handleDeleteTask,)).toList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showModalBottomSheet(
            isScrollControlled: true, // xoay ngang van show dc
            context: context,
            builder:(BuildContext content){
            return  ModalBottom(addTask: _handleaddTask); // container
          },
          );
        },
        child: const Icon(
          Icons.add,
          size: 40,
        ),
      ),
    );
  }
}





