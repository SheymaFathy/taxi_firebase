import 'package:fb_taxi/res/font_manager.dart';
import 'package:fb_taxi/res/validator_manager.dart';
import 'package:fb_taxi/screen/auth/auth_controller.dart';
import 'package:fb_taxi/screen/auth/page/opt.dart';
import 'package:fb_taxi/screen/auth/page/register.dart';
import 'package:fb_taxi/screen/auth/widget/row_text_button.dart';
import 'package:fb_taxi/widget/button_primary.dart';
import 'package:fb_taxi/widget/snackbar_def.dart';
import 'package:fb_taxi/widget/text_form_fiels_def.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    TextEditingController phone = TextEditingController();
    AuthController authController = Get.find();
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.sizeOf(context).height,
          width: MediaQuery.sizeOf(context).width,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Form(
              autovalidateMode: AutovalidateMode.always,
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.asset(
                    'lib/asset/images/logo.png',
                    fit: BoxFit.cover,
                  ),
                  const Text(
                    "تسجيل الدخول",
                    style: FontManager.w600s30cB,
                  ),
                  TextFormFieldRadius(
                    controller: phone,
                    hint: "رقم الهاتف",
                    validator: (value) => ValidatorManager.phone(value),
                    keyType: TextInputType.phone,
                  ),
                  ButtonPrimary(
                      press: () async {
                        if (formKey.currentState!.validate()) {
                          var b = await authController.login(phone.text);
                          if (b) {
                            Get.to(OptScreen(phone: phone.text));
                          } else {
                            snackbarDef("خطأ", "الرقم غير موجود");
                          }
                        }
                      },
                      text: "تسجيل دخول"),
                  RowTextButton(
                    text: "لا تملك حساب بعد؟",
                    textButton: "أنشأ حساب مجاناً",
                    press: () => Get.offAll(const RegisterScreen()),
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
