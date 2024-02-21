
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:api/Api_Model.dart';
import 'package:flutter/material.dart';

class EmployeeListScreen extends StatefulWidget {
  @override
  _EmployeeListScreenState createState() => _EmployeeListScreenState();
}

class _EmployeeListScreenState extends State<EmployeeListScreen> {
  late Future<Temperatures> futureTemperatures;

  @override
  void initState() {
    super.initState();
    futureTemperatures = fetchTemperatures();
  }

  Future<Temperatures> fetchTemperatures() async {
    final response =
    await http.get(Uri.parse('https://dummy.restapiexample.com/api/v1/employees'));

    if (response.statusCode == 200) {
      return Temperatures.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load temperatures');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Employee List'),
      ),
      body: Center(
        child: FutureBuilder<Temperatures>(
          future: futureTemperatures,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.data.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(snapshot.data!.data[index].employeeName),
                    subtitle: Text('Salary: ${snapshot.data!.data[index].employeeSalary}'),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}