// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  static const String _title = "Bianca's to-do list";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test Project',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: Scaffold(
          appBar: AppBar(
            title: const Text(_title),
            actions: [Icon(Icons.anchor)],
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              ),
              NameController(),
            ],
          )),
    );
  }
}

class NameController extends StatefulWidget {
  const NameController({Key? key}) : super(key: key);

  @override
  State<NameController> createState() => _NameControllerState();
}

class _NameControllerState extends State<NameController> {
  final _controller = TextEditingController();

  Column someColumn = Column(
    children: [],
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      TextField(
        controller: _controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          prefixIcon: Icon(Icons.bookmark_border),
          hintText: 'Nova tarefa',
        ),
      ),
      ElevatedButton(
        style:
            ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20)),
        onPressed: () {
          setState(() {
            someColumn.children.add(Text(_controller.text));
          });
        },
        child: const Text('Cadastrar'),
      ),
      someColumn
    ]);
  }
}

class CheckboxBuilder extends StatefulWidget {
  const CheckboxBuilder({Key? key}) : super(key: key);

  @override
  State<CheckboxBuilder> createState() => _CheckboxBuilderState();
}

class _CheckboxBuilderState extends State<CheckboxBuilder> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    String taskName = "Tarefa 1";

    var styling = TextDecoration.none;

    _updateStyle(TextDecoration style) {
      setState(() {
        style = TextDecoration.lineThrough;
      });
    }

    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.green;
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          padding: const EdgeInsets.all(25),
          child: Text(
            taskName,
            style: TextStyle(decoration: styling, fontSize: 18),
          ),
        ),
        Spacer(),
        Container(
          padding: const EdgeInsets.all(25),
          child: Checkbox(
            checkColor: Colors.white,
            fillColor: MaterialStateProperty.resolveWith(getColor),
            value: _isSelected,
            onChanged: (bool? value) {
              _updateStyle(styling);
              setState(() {
                _isSelected = value!;
              });
            },
          ),
        ),
      ],
    );
  }
}
