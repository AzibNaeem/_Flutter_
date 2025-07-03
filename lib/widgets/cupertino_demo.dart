import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

class CupertinoDemo extends StatelessWidget {
  const CupertinoDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Cupertino Demo'),
      ),
      child: Center(
        child: CupertinoButton(
          color: CupertinoColors.activeGreen,
          child: const Text('Press Me'),
          onPressed: () {
            showCupertinoDialog(
              context: context,
              builder: (BuildContext context) => CupertinoAlertDialog(
                title: const Text('Hello!'),
                content: const Text('This is a Cupertino dialog'),
                actions: <CupertinoDialogAction>[
                  CupertinoDialogAction(
                    isDefaultAction: true,
                    onPressed: () => Navigator.pop(context),
                    child: const Text('OK'),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
