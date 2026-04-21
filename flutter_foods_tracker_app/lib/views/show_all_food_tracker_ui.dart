// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_task_app/views/add_food_tracker_ui.dart';
import 'package:flutter_task_app/views/update_delete_food_tracker_ui.dart';

class ShowAllFoodTrackerUi extends StatefulWidget {
  const ShowAllFoodTrackerUi({super.key});

  @override
  State<ShowAllFoodTrackerUi> createState() => _ShowAllFoodTrackerUiState();
}

class _ShowAllFoodTrackerUiState extends State<ShowAllFoodTrackerUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text(
          'FOOD TRACKER',
          style: TextStyle(color: Colors.white),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //เปิดไปหน้า ad task_ui แบบย้อนกลับได้
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddFoodTrackerUi(),
            ),
          );
        },
        backgroundColor: Colors.deepOrange,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      // ตำแหน่งของ floatingAction
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
