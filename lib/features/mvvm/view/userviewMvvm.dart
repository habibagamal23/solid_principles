import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:solid_p/core/network/apiConsumer.dart';
import '../../../core/di/di.dart';
import '../../../core/network/dio_service.dart';
import '../model/repo.dart';
import '../viewmodel/userviewmodel.dart';

class UserViewMvvm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => UserViewModel(
          userRepository: UserRepositoryMvvm(dioService: getit<ApiConsumer>())),
      child: Scaffold(
        appBar: AppBar(title: Text('User Data')),
        body: Consumer<UserViewModel>(
          builder: (context, viewModel, child) {
            if (viewModel.isLoading) {
              return Center(child: CircularProgressIndicator());  // عرض مؤشر التحميل أثناء جلب البيانات
            }

            if (viewModel.errorMessage.isNotEmpty) {
              return Center(child: Text('Error: ${viewModel.errorMessage}'));  // عرض رسالة الخطأ
            }

            if (viewModel.user != null) {
              final user = viewModel.user!;
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('User Name: ${user.name}'),
                  Text('User Phone: ${user.phone}'),
                  Text('User Email: ${user.email}'),
                ],
              );
            }

            return ElevatedButton(
              onPressed: () {
                viewModel.fetchUserData();  // جلب البيانات عند الضغط على الزر
              },
              child: Text('Fetch User Data'),
            );
          },
        ),
      ),
    );
  }
}
