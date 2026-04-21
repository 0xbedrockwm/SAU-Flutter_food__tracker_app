//ไฟล์ที่ map กับข้อมูลในตาราง
class Task {
  //ตัวแปรที่ล้อชื่อกับคอลลัมน์ในตาราง
  String? id;
  String? foodDate;
  String? foodMeal;
  String? foodName;
  String? foodPrice;
  String? foodPerson;
  String? foodImageUrl;

  //Contructor
  //ที่เอาไว้แพ็คข้อมูลเวลาส่งไป insert / update ไปยัง supabase
  //ทีเอาไว้แพ็คข้อมูลส่งค่าระหว่างหน้าจอ หรือส่งข้อมูลไปมาใดๆ
  Task({
    this.id,
    this.foodDate,
    this.foodMeal,
    this.foodName,
    this.foodPrice,
    this.foodPerson,
    this.foodImageUrl,
  });

  //คำสั่งในการแปลข้อมูลจาก supabase ซึ่งเป็น JSON มาใช้ในแอพ -> fromJsOn
  factory Task.fromJson(Map<String, dynamic> json) => Task(
        id: json['id'],
        foodDate: json['foodDate'],
        foodMeal: json['foodMeal'],
        foodName: json['foodName'],
        foodPrice: json['foodPrice'],
        foodPerson: json['foodPerson'],
        foodImageUrl: json['foodImageUrl'],
      );

  //คำสั่งในการแปลงข้องมูลจาก แอพไปยัง supabase -> toJson
  //คำสั่งในการแปลงข้องมูลจาก แอพไปยัง supabase -> toJson
  Map<String, dynamic> toJson() => {
        'id': id,
        'foodDate': foodDate,
        'foodMeal': foodMeal,
        'foodName': foodName,
        'foodPrice': foodPrice,
        'foodPerson': foodPerson,
        'foodImageUrl': foodImageUrl,
      };
}
