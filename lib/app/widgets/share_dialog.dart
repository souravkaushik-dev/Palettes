import 'package:flutter/cupertino.dart';

class ShareDialog extends StatelessWidget {
  const ShareDialog({
    required this.onPressedFile,
    required this.onPressedLink,
    super.key,
  });

  final VoidCallback onPressedFile;
  final VoidCallback onPressedLink;

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: const Text('Share'),
      content: const Text('How do you want to share the image?'),
      actions: <CupertinoDialogAction>[
        CupertinoDialogAction(
          isDefaultAction: true,
          onPressed: () {
            Navigator.of(context).pop(); // Close the dialog before executing the action
            onPressedFile(); // Call the callback for sharing as file
          },
          child: const Text('File'),
        ),
        CupertinoDialogAction(
          isDefaultAction: true,
          onPressed: () {
            Navigator.of(context).pop(); // Close the dialog before executing the action
            onPressedLink(); // Call the callback for sharing as link
          },
          child: const Text('Link'),
        ),
      ],
    );
  }
}
