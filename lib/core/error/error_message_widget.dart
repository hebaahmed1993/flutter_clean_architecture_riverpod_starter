import 'package:flutter/material.dart';

void showErrorSnackbar(BuildContext context, {required String message}) {
  final snackBar = SnackBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    behavior: SnackBarBehavior.floating,
    duration: const Duration(seconds: 10),
    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    content: _CustomSnackbarContent(message: message),
  );

  ScaffoldMessenger.of(context).clearSnackBars();
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

class _CustomSnackbarContent extends StatelessWidget {
  final String message;

  const _CustomSnackbarContent({required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(14),
      decoration: BoxDecoration(
        // color: MyColors.amberColor,
        border: Border.all(),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(Icons.error_outline),
          const SizedBox(width: 12),
          Expanded(child: Text(message, style: TextStyle(fontSize: 14))),
        ],
      ),
    );
  }
}
