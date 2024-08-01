import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:universe_it_project/widgets/custom_button.dart';
import 'package:universe_it_project/widgets/custom_text.dart';
import 'package:universe_it_project/widgets/custom_textfield.dart';

class ForgetPass extends StatelessWidget {
   ForgetPass({super.key});
  final TextEditingController emailcontroller = TextEditingController();
  final emailformkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        title: const Text("PASSWORD RECOVERY"),
        titleSpacing: 0.0,
      ),
      body:  Padding(
        padding: EdgeInsets.symmetric(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
          child: Column(
            children: [
              CustomText(
                text:
                    "Please enter a valid email in field an press 'SEND' button. An automated email shall be genarated to be spacified email address with intructions of resetting password.",
                fontsize: 18.0,
                maxline: 10,
                fontweight: FontWeight.w500,
                color: Colors.black54,
              ),
              SizedBox(height: 20.0),
              CustomTextfield(
                hintText: "email",
                suffixIcon: Icon(Icons.email_outlined),
                formKey: emailformkey,
                validation: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an email address';
                  }
                  final emailRegExp = RegExp(r'^[^@]+@[^@]+\.[^@]+$');
                  if (!emailRegExp.hasMatch(value)) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
              ),
              Spacer(),
              CustomButton(
                text: "CREATE ACCOUNT",
                ontap: () {
                  if (
                      emailcontroller.text.isNotEmpty ||
                      emailformkey.currentState!.validate()) {
                    Fluttertoast.showToast(
                      msg: "Send a Code",
                    );
                    emailcontroller.clear();

                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
