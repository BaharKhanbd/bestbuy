import 'dart:convert';

import 'package:bestbuy/model/product_category_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProductCategoryController extends ChangeNotifier {
  List<ProductCategoryModel> categoryList = [];
  bool isLoading = false;

  Future<void> getPostApi() async {
    isLoading = true;
    notifyListeners(); // Notify listeners to update UI

    try {
      final response = await http
          .get(Uri.parse("https://api.escuelajs.co/api/v1/categories"));
      var data = jsonDecode(response.body.toString());

      if (response.statusCode == 200) {
        categoryList.clear(); // Clear existing data
        for (Map<String, dynamic> item in data) {
          categoryList.add(ProductCategoryModel.fromJson(item));
        }
      } else {
        // Handle other status codes
      }
    } catch (e) {
      // Handle exceptions
    } finally {
      isLoading = false;
      notifyListeners(); // Notify listeners to update UI
    }
  }
}
