import 'dart:io';
import 'package:dart_io_project/dio_provider.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import 'json.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: null,
        title: const Center(
          child: Text(
            'dio CURD operation',
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 190.0),
          child: Column(mainAxisSize: MainAxisSize.max, children: [
            Container(
              transform: null,
              child: Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: GestureDetector(
                  onTap: () async {
                    var datas1 = DioProvider().get('/user').catchError((err) {});
                    // ignore: unnecessary_null_comparison
                    if (datas1 == null) {
                      return debugPrint('something went wrong');
                    } else {
                      debugPrint('successfull');
                    }
                  },
                  child: Container(
                    height: 60,
                    width: 380,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black,
                          spreadRadius: 1,
                          blurRadius: 8,
                          offset: Offset(4, 4),
                        ),
                        BoxShadow(
                          color: Colors.white,
                          spreadRadius: 2,
                          blurRadius: 8,
                          offset: Offset(-4, -4),
                        ),
                      ],
                    ),
                    child: const Center(
                      child: Text(
                        "CREATE",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              transform: null,
              child: Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: GestureDetector(
                  onTap: () async {
                    var datas2 = DioProvider().get('/user').catchError((err) {});
                    if(datas2 == null){
                      return debugPrint('something wnent wrong');
                    }else{
                      debugPrint('successfull');
                    }
                  },
                  child: Container(
                    height: 60,
                    width: 380,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black,
                          spreadRadius: 1,
                          blurRadius: 8,
                          offset: Offset(4, 4),
                        ),
                        BoxShadow(
                          color: Colors.white,
                          spreadRadius: 2,
                          blurRadius: 8,
                          offset: Offset(-4, -4),
                        ),
                      ],
                    ),
                    child: const Center(
                      child: Text(
                        "UPDATE",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              transform: null,
              child: Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: GestureDetector(
                  onTap: () async {
                    var datas3 = DioProvider().get('/user').catchError((err) {});
                    if(datas3 == null){
                      return debugPrint('something went wrong');

                    }else{
                      debugPrint('successfull');
                    }
                  },
                  child: Container(
                    height: 60,
                    width: 380,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black,
                          spreadRadius: 1,
                          blurRadius: 8,
                          offset: Offset(4, 4),
                        ),
                        BoxShadow(
                          color: Colors.white,
                          spreadRadius: 2,
                          blurRadius: 8,
                          offset: Offset(-4, -4),
                        ),
                      ],
                    ),
                    child: const Center(
                      child: Text(
                        "EDIT",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              transform: null,
              child: Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: GestureDetector(
                  onTap: () async {
                    var datas3 = DioProvider().get('/user').catchError((err) {});
                    if(datas3 == null){
                      return debugPrint('something went wrong');
                    }else{
                      debugPrint('successfull');
                    }
                  },
                  child: Container(
                    height: 60,
                    width: 380,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black,
                          spreadRadius: 1,
                          blurRadius: 8,
                          offset: Offset(4, 4),
                        ),
                        BoxShadow(
                          color: Colors.white,
                          spreadRadius: 2,
                          blurRadius: 8,
                          offset: Offset(-4, -4),
                        ),
                      ],
                    ),
                    child: const Center(
                      child: Text(
                        "DELETE",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

Future<void> createFile(String path, List<int> bytes) async {
  final file = File(path);
  await file.create(recursive: true);
  await file.writeAsBytes(bytes);
}

Future<List<int>> readFile(String path) async {
  final file = File(path);
  if (await file.exists()) {
    return file.readAsBytes();
  } else {
    throw Exception('File does not exist');
  }
}

Future<void> updateFile(String path, List<int> bytes) async {
  final file = File(path);
  if (await file.exists()) {
    await file.writeAsBytes(bytes);
  } else {
    throw Exception('File does not exist');
  }
}

Future<void> deleteFile(String path) async {
  final file = File(path);
  if (await file.exists()) {
    await file.delete();
  } else {
    throw Exception('File does not exist');
  }
}

void requestpermission() async {
  var status = await Permission.storage.status;
  if (!status.isGranted) {
    await Permission.storage.request();
  }
}
