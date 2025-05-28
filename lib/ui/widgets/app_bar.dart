import 'package:flutter/material.dart';

class appBar {
  PreferredSizeWidget criar(
    BuildContext context,
    String titulo, {
    List<Widget>? actions,
  }) {
    return AppBar(
      title: Text(titulo),
      backgroundColor: const Color(0XFF1A237E),
      centerTitle: true,
      elevation: 2,
      leading:
          ModalRoute.of(context)?.canPop == true
              ? IconButton(
                icon: const Icon(Icons.arrow_back_outlined),
                onPressed: () => Navigator.of(context).pop(),
              )
              : null,
      actions: actions,
    );
  }
}
