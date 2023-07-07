import 'dart:convert';
import 'package:tech_bumble/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../model/data_model.dart';

class DataProvider extends ChangeNotifier {
  List<DataModel> dataList = [];

  Future<void> fetchData() async {
    try {
      final response = await http.get(Uri.parse('${Constants.baseUrl}/items'));
      print(response);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        if (data['items'] != null) {
          final List<dynamic> items = data['items'];
          dataList = items
              .map((item) => DataModel(id: item['id'], name: item['name']))
              .toList();
          // print('Data Fetched: $dataList');
        } else {
          // print('No items found in the response');
        }
      } else {
        // print('Failed to fetch data. Error code: ${response.statusCode}');
      }
      notifyListeners();
    } catch (e) {
      debugPrint('Error occurred during HTTP request: $e');
    }
  }

  Future<void> updateData({
    required String id,
    required String name,
  }) async {
    try {
      final apiUrl = '${Constants.baseUrl}/$id';
      final response = await http.put(
        Uri.parse(apiUrl),
        body: jsonEncode({'name': name}),
      );

      if (response.statusCode == 200) {
        // Data updated successfully
        debugPrint('Data updated successfully');
        final dataIndex = dataList.indexWhere((data) => data.id == id);
        if (dataIndex != -1) {
          dataList[dataIndex].name = name;
          notifyListeners();
        }
      } else {
        debugPrint('Failed to update data. Error code: ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('Error occurred during API call: $e');
    }
  }

  Future<void> deleteData({
    required String id,
  }) async {
    try {
      final apiUrl = '${Constants.baseUrl}/$id';
      final response = await http.delete(
        Uri.parse(apiUrl),
      );

      if (response.statusCode == 200) {
        // Data updated successfully
        dataList.removeWhere((data) => data.id == id);
        notifyListeners();

        debugPrint('Data deleted: $id');
      } else {
        debugPrint('Failed to update data. Error code: ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('Error occurred during API call: $e');
    }
  }

  void postData({
    required String name,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('${Constants.baseUrl}/'),
        body: jsonEncode({'name': name}),
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        // Data posted successfully
        debugPrint('Data posted successfully');
        fetchData();
        notifyListeners();
      } else {
        debugPrint('Failed to post data. Error code: ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('Error occurred during API call: $e');
    }
  }
}
