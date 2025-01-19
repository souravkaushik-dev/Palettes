import 'package:flutter/cupertino.dart';

class SaveDialog extends StatelessWidget {
  const SaveDialog({required this.stream, super.key});

  final Stream<String> stream;

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: const Text('Save'),
      content: StreamBuilder<String>(
        stream: stream,
        builder: (context, snapshot) {
          Widget content;
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
            case ConnectionState.active:
              content = const CupertinoActivityIndicator();
              break;
            case ConnectionState.done:
              if (snapshot.hasError) {
                content = Text('Error: ${snapshot.error}');
              } else {
                content = Text('Result: ${snapshot.data}');
              }
              break;
          }

          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 10),
              content,
              const SizedBox(height: 10),
            ],
          );
        },
      ),
    );
  }
}
