import 'package:fb_taxi/models/user_register.dart';
import 'package:fb_taxi/res/font_manager.dart';
import 'package:fb_taxi/res/validator_manager.dart';
import 'package:fb_taxi/screen/auth/auth_controller.dart';
import 'package:fb_taxi/screen/auth/page/login.dart';
import 'package:fb_taxi/screen/auth/page/opt.dart';
import 'package:fb_taxi/screen/auth/widget/row_text_button.dart';
import 'package:fb_taxi/widget/button_primary.dart';
import 'package:fb_taxi/widget/snackbar_def.dart';
import 'package:fb_taxi/widget/text_form_fiels_def.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.find();
    final formKey = GlobalKey<FormState>();
    TextEditingController name = TextEditingController();
    TextEditingController phone = TextEditingController();
    TextEditingController email = TextEditingController();
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.sizeOf(context).height,
          width: MediaQuery.sizeOf(context).width,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Form(
              key: formKey,
              autovalidateMode: AutovalidateMode.always,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.asset(
                    'lib/asset/images/logo.png',
                    fit: BoxFit.cover,
                  ),
                  const Text(
                    "انشاء حساب",
                    style: FontManager.w600s30cB,
                  ),
                  TextFormFieldRadius(
                    controller: name,
                    hint: "الاسم",
                    validator: (value) => ValidatorManager.name(value),
                  ),
                  TextFormFieldRadius(
                    controller: phone,
                    hint: "رقم الهاتف",
                    validator: (value) => ValidatorManager.phone(value),
                    keyType: TextInputType.phone,
                  ),
                  TextFormFieldRadius(
                    controller: email,
                    hint: "البريد الإلكتروني",
                    keyType: TextInputType.name,
                    // validator: (value) => ValidatorManager.email(value),
                  ),
                  ButtonPrimary(
                      press: () async {
                        if (formKey.currentState!.validate()) {
                          var user = UserRegister(
                              name: name.text,
                              phone: phone.text,
                              email: email.text);
                          var b = await authController.register(user);
                          if (b) {
                            Get.to(OptScreen(phone: phone.text));
                          } else {
                            snackbarDef(
                                "خطأ", "هناك خطأ ما الرجاء التواصل مع المسؤول");
                          }
                        }
                      },
                      text: "انشاء حساب"),
                  RowTextButton(
                    text: "هل تملك حساب؟",
                    textButton: "سجل دخول",
                    press: () => Get.offAll(const LoginScreen()),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
