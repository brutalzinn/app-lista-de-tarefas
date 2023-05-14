import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_notepad/core/database_helper.dart';
import 'package:flutter_app_notepad/core/models/task.dart';
import 'package:flutter_app_notepad/core/utils/widget_status_utils.dart';

class AddNoteView extends StatefulWidget {
  AddNoteView({super.key});
  final TextEditingController textoController = TextEditingController();
  final TextEditingController prioridadeController = TextEditingController();
  final TextEditingController tituloController = TextEditingController();
  final TextEditingController descricaoController = TextEditingController();
  List<bool> statusTarefa = [false, false, false];
  @override
  State<AddNoteView> createState() => _AddNoteViewState();
}

class _AddNoteViewState extends State<AddNoteView> {
  final MaterialStateProperty<Icon?> thumbIcon =
      MaterialStateProperty.resolveWith<Icon?>(
    (Set<MaterialState> states) {
      if (states.contains(MaterialState.selected)) {
        return const Icon(Icons.check);
      }
      return const Icon(Icons.close);
    },
  );

  @override
  Widget build(BuildContext context) {
    final List<bool> statusTarefa = widget.statusTarefa;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Tarefa'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              controller: widget.tituloController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Titulo',
              ),
              keyboardType: TextInputType.multiline,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              controller: widget.descricaoController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Descrição',
              ),
              keyboardType: TextInputType.multiline,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              controller: widget.textoController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Texto',
              ),
              keyboardType: TextInputType.multiline,
              maxLines: null,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
                controller: widget.prioridadeController,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Prioridade',
                ),
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ], //
                keyboardType: TextInputType.number),
          ),
          ToggleButtons(
            isSelected: statusTarefa,
            onPressed: (int index) {
              setState(() {
                for (int buttonIndex = 0;
                    buttonIndex < statusTarefa.length;
                    buttonIndex++) {
                  if (buttonIndex == index) {
                    statusTarefa[buttonIndex] = true;
                  } else {
                    statusTarefa[buttonIndex] = false;
                  }
                }
              });
            },
            children: const <Widget>[
              Icon(Icons.done),
              Icon(Icons.pending),
              Icon(Icons.cancel),
            ],
          ),
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            heroTag: 1,
            onPressed: () {
              Navigator.pop(context);
            },
            backgroundColor: Colors.red,
            child: const Icon(Icons.cancel),
          ),
          FloatingActionButton(
            heroTag: 0,
            onPressed: () {
              Task task = Task(
                  title: widget.tituloController.text,
                  text: widget.textoController.text,
                  priority: int.parse(widget.prioridadeController.text),
                  description: widget.descricaoController.text,
                  criadoEm: DateTime.now(),
                  status: WidgetStatusUtils.obterStatus(statusTarefa));
              DatabaseHelper().addNewTask(task);
              Navigator.pop(context);
            },
            backgroundColor: Colors.green,
            child: const Icon(Icons.save),
          ),
        ],
      ),
    );
  }
}
