import 'package:flutter/material.dart';

class Supplies extends StatefulWidget{
  const Supplies({super.key});

  @override
  State<Supplies> createState() =>SuppliesState();
}

class SuppliesState extends State<Supplies>{
  List todos = [];
  String text = '';
  final TextEditingController input = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Necessary Supplies List"),
      ),
      body: ListView.builder(
          itemCount: todos.length,
          itemBuilder: (context, index) {
            return Card(
              color: Colors.teal,
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: ListTile(
                  title: Text(todos[index]),
                  trailing: SizedBox(
                    width: 100,
                    child: Row(
                      children: [
                        Expanded(child: IconButton(onPressed: () {
                          showDialog(context: context, builder: (context) =>
                              SimpleDialog(contentPadding: const EdgeInsets.all(20),
                                children: [
                                  TextField(
                                    onChanged: (value) {
                                      setState(() {
                                        text = value;
                                      });
                                    },
                                  ),
                                  ElevatedButton(onPressed: () {
                                    setState(() {
                                      todos[index] = text;
                                    });
                                    Navigator.pop(context);
                                  }, child: const Text("Update"))
                                ],
                              ));
                        }, icon: const Icon(Icons.edit))),
                        Expanded(child: IconButton(onPressed: () {
                          setState(() {
                            todos.removeAt(index);
                          });
                        }, icon: const Icon(Icons.delete))),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: (){
            showDialog(context: context, builder: (context)=>
                SimpleDialog( contentPadding: const EdgeInsets.all(20),
                  children: [
                    TextField(
                      controller: input,
                      decoration: const InputDecoration(hintText: "Type in what you want to do"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          Navigator.of(context).pop();
                          todos.add(input.text);
                        });
                        input.clear();
                      },
                      child: const Text("Add"),
                    ),
                  ],
                )
            );
          }, child: const Icon(Icons.add)
      ),
    );
  }
}
