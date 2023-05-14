import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Container(
          padding: const EdgeInsets.all(4.0),
          width: 100.0,
          child: const Text(
            "ID",
            style: TextStyle(fontSize: 18),
          )),
      Container(
          padding: const EdgeInsets.all(4.0),
          width: 100.0,
          child: const Text(
            "Título",
            style: TextStyle(fontSize: 18),
          )),
      Container(
          padding: const EdgeInsets.all(4.0),
          width: 100.0,
          child: const Text(
            "Descrição",
            style: TextStyle(fontSize: 18),
          )),
      Container(
          padding: const EdgeInsets.all(4.0),
          width: 100.0,
          child: const Text(
            "Prioridade",
            style: TextStyle(fontSize: 18),
          )),
      Container(
          padding: const EdgeInsets.all(4.0),
          width: 100.0,
          child: const Text(
            "Status",
            style: TextStyle(fontSize: 18),
          )),
      Container(
          padding: const EdgeInsets.all(4.0),
          width: 100.0,
          child: const Text(
            "Atualizado em",
            style: TextStyle(fontSize: 18),
          )),
      Container(
          padding: const EdgeInsets.all(4.0),
          width: 100.0,
          child: const Text(
            "Criado em",
            style: TextStyle(fontSize: 18),
          )),
    ]);
  }
}
