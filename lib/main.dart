import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

void main() {
  runApp(SmartDustbinApp());
}

class SmartDustbinApp extends StatefulWidget {
  @override
  _SmartDustbinAppState createState() => _SmartDustbinAppState();
}

class _SmartDustbinAppState extends State<SmartDustbinApp> {
  List<dynamic> reports = [];
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    fetchReports();
    _timer = Timer.periodic(Duration(seconds: 5), (timer) => fetchReports());
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  Future<void> fetchReports() async {
    final response =
        await http.get(Uri.parse('http://10.10.155.173:5050/api/reports'));

    if (response.statusCode == 200) {
      setState(() {
        reports = json.decode(response.body);
      });
    } else {
      print('Failed to load reports');
    }
  }

  Future<void> completeReport(int id) async {
    final response = await http.post(
      Uri.parse('http://10.10.155.173:5050/api/reset-dustbin'),
      headers: {"Content-Type": "application/json"},
      body: json.encode({"id": id, "bValue": 0, "nbValue": 0}),
    );

    if (response.statusCode == 200) {
      setState(() {
        reports.removeWhere((report) => report['id'] == id);
      });
    } else {
      print('Failed to complete report');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Smart Dustbin Reports')),
        body: RefreshIndicator(
          onRefresh: fetchReports,
          child: reports.isEmpty
              ? Center(child: Text('No reports available'))
              : ListView.builder(
                  itemCount: reports.length,
                  itemBuilder: (context, index) {
                    var report = reports[index];
                    return Card(
                      margin: EdgeInsets.all(10),
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              report['location'],
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 8),
                            RichText(
                              text: TextSpan(
                                style: DefaultTextStyle.of(context).style,
                                children: [
                                  TextSpan(
                                    text: "B: ${report['bValue']}  ",
                                    style: TextStyle(color: Colors.green),
                                  ),
                                  TextSpan(
                                    text: "|  NB: ${report['nbValue']}",
                                    style: TextStyle(color: Colors.red),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 12),
                            Align(
                              alignment: Alignment.centerRight,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green, // Button color
                                  foregroundColor: Colors.white, // Text color
                                ),
                                onPressed: () => completeReport(report['id']),
                                child: Text('Completed'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
        ),
      ),
    );
  }
}
