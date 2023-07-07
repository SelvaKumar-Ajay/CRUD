import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data_provider/data_provider.dart';

class PostDataDialog extends StatefulWidget {
  const PostDataDialog({super.key});

  @override
  State<PostDataDialog> createState() => _PostDataDialogState();
}

class _PostDataDialogState extends State<PostDataDialog> {
  late TextEditingController _nameController;

  @override
  void initState() {
    super.initState();
    // _nameController = TextEditingController;
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final dataProvider = Provider.of<DataProvider>(context, listen: false);
    return AlertDialog(
      title: const Text('Post Data'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _nameController,
            decoration: const InputDecoration(
              labelText: 'Name',
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            final updatedName = _nameController.text;
            dataProvider.postData(name: updatedName);
            Navigator.of(context).pop();
          },
          child: const Text('Post'),
        ),
      ],
    );
  }
}
