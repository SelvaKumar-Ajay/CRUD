import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech_bumble/data_provider/data_provider.dart';

class DeleteDialog extends StatelessWidget {
  final String id;
  const DeleteDialog({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    final dataProvider = Provider.of<DataProvider>(context, listen: false);
    return AlertDialog(
        title: const Text('Delete Data'),
        content: const Text('Are you sure you want to delete this data?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              dataProvider.deleteData(id: id);

              Navigator.of(context).pop();
            },
            child: const Text('Delete'),
          ),
        ]);
  }
}
