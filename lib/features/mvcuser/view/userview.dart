import 'package:flutter/material.dart';
import '../controller/usercontroller.dart';
import '../model/usermvcmodel.dart';
import '../../../core/network/ApiResult.dart';

import 'package:flutter/material.dart';
import '../controller/usercontroller.dart';
import '../model/usermvcmodel.dart';
import '../../../core/network/ApiResult.dart';

class UserView extends StatefulWidget {
  @override
  _UserViewState createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {
  late UserController _controller;
  late Future<ApiResult<UserModelMvc>> _user;

  @override
  void initState() {
    super.initState();
    _controller = UserController();
    _user = _controller.fetchUserData();  // جلب البيانات عند بدء الشاشة
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('User Data')),
      body: Center(
        child: FutureBuilder<ApiResult<UserModelMvc>>(
          future: _user, // ربط FutureBuilder بالـ Future
          builder: (context, snapshot) {
            // التحقق من حالة الاتصال بالـ Future
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();  // عرض مؤشر التحميل أثناء جلب البيانات
            }

            // عرض الخطأ إذا حدث
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }

            // عرض البيانات عندما تكون جاهزة
            if (snapshot.hasData) {
              ApiResult<UserModelMvc> result = snapshot.data!;
              if (result.isSuccess) {
                final user = result.data;
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('User Name: ${user?.name ?? 'N/A'}'),
                    Text('User Phone: ${user?.phone ?? 'N/A'}'),
                    Text('User Email: ${user?.email ?? 'N/A'}'),
                  ],
                );
              } else {
                return Text('Error: ${result.error ?? 'Unknown Error'}');  // عرض رسالة الخطأ إذا فشل تحميل البيانات
              }
            }

            // في حالة عدم وجود بيانات أو تم تحميلها
            return ElevatedButton(
              onPressed: () {
                setState(() {
                  _user = _controller.fetchUserData();  // إعادة جلب البيانات عند الضغط على الزر
                });
              },
              child: Text('Fetch User Data'),
            );
          },
        ),
      ),
    );
  }
}
