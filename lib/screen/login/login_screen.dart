import 'package:firebasetask/screen/login/view_model/login_view_model.dart';
import 'package:firebasetask/screen/login/widget/email_form_field.dart';
import 'package:firebasetask/screen/login/widget/password_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isValue = false;
  List<String> networkLink = [
    'assets/images/google.png',
    'assets/images/apple.png',
    'assets/images/google.png',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xFF000000),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/main.png',
                  width: 280,
                  height: 255,
                ),
                const SizedBox(height: 10),
                const Text(
                  'LOGIN',
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                EmailFormField(
                  controller: emailController,
                ),
                const SizedBox(height: 10),
                PasswordFormField(
                  controller: passwordController,
                ),
                const SizedBox(height: 15),
                Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Switch(
                      value: isValue,
                      onChanged: (value) {
                        isValue = !isValue;
                        setState(() {});
                      },
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: Text(
                        'Remember Me',
                        style: TextStyle(
                          color: const Color(0xFFFFFFFF).withOpacity(0.5),
                          fontSize: 14,
                        ),
                      ),
                    ),
                    Text(
                      'Forgot Password?',
                      style: TextStyle(
                        color: const Color(0xFFFFFFFF).withOpacity(0.5),
                        fontSize: 14,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 25),
                Ink(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0xFF262626),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: InkWell(
                      borderRadius: BorderRadius.circular(50),
                      onTap: () {
                        context.read<LoginViewModel>().login(context);
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 17),
                        child: const Center(
                          child: Text(
                            'LOGIN',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      )),
                ),
                const SizedBox(height: 13),
                const Text(
                  'OR',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Log in with',
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 10),
                      width: 45,
                      height: 45,
                      decoration: const BoxDecoration(
                          color: Color(0xFF262626), shape: BoxShape.circle),
                      child: TextButton(
                        onPressed: (){},
                        child: Center(
                          child: SvgPicture.asset('assets/icons/google.svg'),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 10),
                      width: 45,
                      height: 45,
                      decoration: const BoxDecoration(
                          color: Color(0xFF262626), shape: BoxShape.circle),
                      child: TextButton(
                        onPressed: (){},
                        child: Center(
                          child: SvgPicture.asset("assets/icons/apple.svg"),
                        ),
                      ),
                    ),
                    Container(
                      width: 45,
                      height: 45,
                      decoration: const BoxDecoration(
                          color: Color(0xFF262626), shape: BoxShape.circle),
                      child: TextButton(
                        onPressed: (){},
                        child: Center(
                          child: SvgPicture.asset("assets/icons/facebook.svg"),
                        ),
                      ),
                    ),
                  ]
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
