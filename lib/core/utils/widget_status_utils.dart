import 'package:flutter/material.dart';

class WidgetStatusUtils {
  static int obterStatus(List<bool> statusTarefa) {
    for (int buttonIndex = 0;
        buttonIndex < statusTarefa.length;
        buttonIndex++) {
      final statusAtual = statusTarefa[buttonIndex];
      if (statusAtual) {
        return buttonIndex;
      }
    }
    return 0;
  }

  static List<bool> obterStatusPorIndex(int index) {
    final List<bool> statusTarefa = [false, false, false];
    statusTarefa[index] = true;
    return statusTarefa;
  }

  static IconData obterIconeStatus(int index) {
    switch (index) {
      case 0:
        return Icons.done;
      case 1:
        return Icons.pending;
      default:
        return Icons.cancel;
    }
  }
}
