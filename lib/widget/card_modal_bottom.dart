import 'package:flutter/material.dart';
class ModalBottom extends StatelessWidget {
   ModalBottom({
    super.key,
     required this.addTask
  });
   final Function addTask;
  TextEditingController controller = TextEditingController();
  void _handleOnlclick(BuildContext context){
    final name = controller.text;
    if(name.isEmpty){
      return;
    }
    addTask(name);

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets, // hien thi phim
      child: SingleChildScrollView(
        padding:
        const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
        child:  Column(
          children: [
             TextField(
              controller: controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Your Task',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                    onPressed: () => _handleOnlclick(context),
                    child: const Text('Add Task'))
            ),

          ],
        ),
      ),
    );
  }
}