
class Temperatures {
  String status;
  List<Datum> data;
  String message;

  Temperatures({
    required this.status,
    required this.data,
    required this.message,
  });

  factory Temperatures.fromJson(Map<String, dynamic> json) {
    return Temperatures(
      status: json['status'],
      data: List<Datum>.from(json['data'].map((x) => Datum.fromJson(x))),
      message: json['message'],
    );
  }
}

class Datum {
  int id;
  String employeeName;
  int employeeSalary;
  int employeeAge;
  String profileImage;

  Datum({
    required this.id,
    required this.employeeName,
    required this.employeeSalary,
    required this.employeeAge,
    required this.profileImage,
  });

  factory Datum.fromJson(Map<String, dynamic> json) {
    return Datum(
      id: json['id'],
      employeeName: json['employee_name'],
      employeeSalary: json['employee_salary'],
      employeeAge: json['employee_age'],
      profileImage: json['profile_image'],
    );
  }
}