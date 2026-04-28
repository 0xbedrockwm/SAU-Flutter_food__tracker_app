// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_task_app/views/add_food_tracker_ui.dart';
import 'package:flutter_task_app/views/update_delete_food_tracker_ui.dart';
import 'package:flutter_task_app/services/supabase_service.dart';
import 'package:flutter_task_app/models/task.dart';

class ShowAllFoodTrackerUi extends StatefulWidget {
  const ShowAllFoodTrackerUi({super.key});

  @override
  State<ShowAllFoodTrackerUi> createState() => _ShowAllFoodTrackerUiState();
}

class _ShowAllFoodTrackerUiState extends State<ShowAllFoodTrackerUi> {
  // สร้าง instance/object/ตัวแทนของ SupabaseService เพื่อเรียกใช้ฟังก์ชันการทำงานต่างๆ กับ Supabase
  final service = SupabaseService();

  // สร้างตัวแปรเพื่อเก็บข้อมูลที่จะดึงมาจาก Supabase เพื่อไปแสดงใน ListView
  List<Task> tasks = [];

  // สร้างเมธอดเพื่อดึงข้อมูล แล้วเอาข้อมูลที่ดึงมากำหนดให้กับตัวแปร
  void loadTasks() async {
    print('Loading tasks...');
    //ดึงข้อมูลจาก Supabase
    final data = await service.getAllTask();

    //เอาข้อมูลที่ดึงมา กำหนดให้กับตัวแปร
    setState(() {
      print('xxxxxxxxxxxxx');
      tasks = data;
      print('yyyyyyyyyyyyy');
    });
  }

  @override
  void initState() {
    super.initState();

    //เรียกใช้เมธอด loadTasks() ใ้หทำงานตอนหน้าจอถูกเปิด
    loadTasks();
  }

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
      // ส่วนของ Body
      body: Center(
        child: Column(
          children: [
            //ส่วนแสดงรูปโลโก้
            SizedBox(height: 50),
            Image.asset(
              'assets/images/logo.png',
              width: 120,
              height: 120,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 50),
            //ส่วนของ ListView แสดงรายการข้อมูลงานที่ดึงมาจาก Supabase
            Expanded(
              child: ListView.builder(
                // จำนวนรายการใน ListView
                itemCount: tasks.length,
                // สร้างหน้าตาของแต่ละรายการใน ListView
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(
                      left: 40,
                      right: 40,
                      top: 5,
                      bottom: 5,
                    ),
                    child: ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UpdateDeleteFoodTrackerUi(),
                          ),
                        );
                      },
                      title: Text(
                        'กินอะไร: ${tasks[index].foodName}',
                      ),
                      subtitle: Text(
                        // ternary operator ____ ? ____ : ______
                        'กินมื้อไหน: ${tasks[index].foodMeal == 'เช้า' ? 'เช้า' : tasks[index].foodMeal == 'กลางวัน' ? 'กลางวัน' : tasks[index].foodMeal == 'เย็น' ? 'เย็น' : tasks[index].foodMeal == 'ว่าง'}',
                      ),
                      trailing: Icon(
                        Icons.info,
                        color: Colors.green,
                      ),
                      leading: tasks[index].foodImageUrl == ''
                          ? Image.asset(
                              'assets/images/task.png',
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                            )
                          : Image.network(
                              tasks[index].foodImageUrl!,
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                            ),
                      tileColor:
                          index % 2 == 0 ? Colors.green[200] : Colors.amber[50],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
