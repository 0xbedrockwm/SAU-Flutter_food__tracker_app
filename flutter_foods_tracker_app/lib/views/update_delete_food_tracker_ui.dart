// ignore_for_file: unused_local_variable, strict_top_level_inference

import 'package:flutter/material.dart';

class UpdateDeleteFoodTrackerUi extends StatefulWidget {
  const UpdateDeleteFoodTrackerUi({super.key});

  @override
  State<UpdateDeleteFoodTrackerUi> createState() =>
      _UpdateDeleteFoodTrackerUiState();
}

class _UpdateDeleteFoodTrackerUiState extends State<UpdateDeleteFoodTrackerUi> {
  String? selectedMeal;

  get seclectedMeal => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Food Tracker(แก้ไข / ลบ)',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            top: 40,
            bottom: 50,
            left: 40,
            right: 40,
          ),
          child: Center(
            child: Column(
              children: [
                //ส่วนแสดง icon กล้องและรูปภาพ
                Icon(
                  Icons.add_a_photo_rounded,
                  size: 150,
                  color: Colors.grey[300],
                ),
                SizedBox(height: 20),
                //ส่วนป้อนทำอะไร
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'กินอะไร',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    hintText: 'เช่น KFC, MacD หรือ MK',
                  ),
                ),
                SizedBox(height: 20),
                //ทำที่ไหน
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'กินมื้อไหน',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  children: ['เช้า', 'กลางวัน', 'เย็น', 'ว่าง'].map((meal) {
                    final isSelected = seclectedMeal == meal;
                    return Padding(
                      padding: EdgeInsets.only(
                          top: 40, right: 10, bottom: 40, left: 10),
                      child: ChoiceChip(
                        label: Text(meal),
                        selected: isSelected,
                        selectedColor: Colors.green,
                        backgroundColor: Colors.grey[300],
                        labelStyle: TextStyle(
                          color: isSelected ? Colors.white : Colors.black,
                        ),
                        onSelected: (_) {
                          String selectedMeal;
                          setState(() => selectedMeal = meal);
                        },
                      ),
                    );
                  }).toList(),
                ),

                SizedBox(height: 20),
                //ทำกันกี่คน
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'กินกันกี่คน',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    hintText: 'เช่น 2, 5',
                  ),
                ),
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'กินไปวันไหน',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  onTap: () {},
                  readOnly: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    hintText: 'เช่น 2021-01-31',
                    suffixIcon: Icon(
                      Icons.calendar_month_rounded,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                //ส่วนของปุ่มบันทึก
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    fixedSize: Size(
                      MediaQuery.of(context).size.width,
                      50,
                    ),
                  ),
                  child: Text(
                    "บันทึกแก้ไขข้อมูล",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                //ปุ่มยกเลิก
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    fixedSize: Size(
                      MediaQuery.of(context).size.width,
                      50,
                    ),
                  ),
                  child: Text(
                    "ลบข้อมูล",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
