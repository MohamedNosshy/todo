import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';

import 'package:google_fonts/google_fonts.dart';

import '../../shared/cubit/login/login_cubit.dart';
import '../../shared/cubit/login/states.dart';
import '../signup_screen/register_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    final _formKey = GlobalKey<FormState>();
    return BlocProvider(
      create: (BuildContext context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStats>(
        listener: (context, stats) {},
        builder: (context, stats) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.white,
            ),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'LOGIN',
                        style: GoogleFonts.lato(
                            fontSize: 40, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'login now to manage your tasks',
                        style:
                            GoogleFonts.lato(fontSize: 20, color: Colors.grey),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              TextFormField(
                                controller: emailController,
                                keyboardType: TextInputType.emailAddress,
                                validator: (value) {
                                  if (value!.isEmpty)
                                    return 'pleas enter your email';
                                },
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    prefixIcon: Icon(Icons.email_outlined),
                                    labelText: 'Email Address'),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                obscureText:
                                    LoginCubit.get(context).isShowePassword,
                                onFieldSubmitted: (value) {
                                  if (_formKey.currentState!.validate()) {
                                    LoginCubit.get(context).userLogin(
                                        email: emailController.text,
                                        password: passwordController.text,
                                        context: context);
                                  }
                                },
                                controller: passwordController,
                                keyboardType: TextInputType.visiblePassword,
                                validator: (value) {
                                  if (value!.isEmpty)
                                    return 'pleas enter your password';
                                },
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    prefixIcon: Icon(Icons.lock),
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        LoginCubit.get(context).icon,
                                      ),
                                      onPressed: () {
                                        LoginCubit.get(context).showePassword();
                                      },
                                    ),
                                    labelText: 'Password'),
                              )
                            ],
                          )),
                      SizedBox(
                        height: 30,
                      ),
                      Conditional.single(
                          fallbackBuilder: (BuildContext context) =>
                              Center(child: CircularProgressIndicator()),
                          conditionBuilder: (BuildContext context) =>
                              stats is! LoginLoadinglStats,
                          context: context,
                          widgetBuilder: (BuildContext context) {
                            return Container(
                              width: double.infinity,
                              color: Colors.blue,
                              child: MaterialButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    LoginCubit.get(context).userLogin(
                                        email: emailController.text,
                                        password: passwordController.text,
                                        context: context
                                    );

                                  }
                                },
                                child: Text(
                                  'LOGIN',
                                  style: GoogleFonts.lato(
                                      color: Colors.white, fontSize: 20),
                                ),
                              ),
                            );
                          }),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Don\'t have an account ?  ',
                            style: GoogleFonts.lato(
                                fontSize: 15, fontWeight: FontWeight.w500),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => RegisterScreen()),
                                );
                              },
                              child: Text('REGISTER'))
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
