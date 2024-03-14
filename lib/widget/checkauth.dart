import 'package:descartebem/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../pages/autenticacao_page.dart';
import '../pages/home_page.dart';

class CheckAuth extends StatelessWidget {
  const CheckAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => AuthService.to.userIsAuthenticated.value
        ? HomePage()
        : AutenticacaoPage());
    //return Obx(() => AuthService().
    //userIsAuthenticated ? HomePage() : AutenticacaoPage();
  }
}
