


import 'package:flutter/material.dart';
import 'package:have_a_drink/application/view_models/auth_view_model/true_auth_view_model.dart';
import 'package:have_a_drink/domain/repository/auth_repository.dart';

abstract class AuthViewModel{

  factory AuthViewModel(AuthRepository authRepository){
    return TrueAuthViewModel(authRepository);
  }

  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController(); 
  TextEditingController registerEmailController = TextEditingController(); 
  TextEditingController registerPasswordController = TextEditingController();  
  TextEditingController registerRepeatedPasswordController = TextEditingController();  

  void login();
  void register();
  void logout();
}