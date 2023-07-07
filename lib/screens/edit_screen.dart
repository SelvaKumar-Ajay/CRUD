import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech_bumble/data_provider/data_provider.dart';

class EditDialog extends StatefulWidget {
  final String id;
  final String name;

  const EditDialog({
    Key? key,
    required this.id,
    required this.name,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _EditDialogState createState() => _EditDialogState();
}

class _EditDialogState extends State<EditDialog> {
  late TextEditingController _nameController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.name);
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
      title: const Text('Edit Data'),
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
            dataProvider.updateData(id: widget.id, name: updatedName);
            Navigator.of(context).pop();
          },
          child: const Text('Update'),
        ),
      ],
    );
  }
}
