import 'package:rawg/src/app/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:rawg/src/app/features/authentication/presentation/pages/forget_password_page.dart';
import 'package:rawg/src/app/features/authentication/presentation/pages/signup_page.dart';
import 'package:rawg/src/app/features/global/custom_rounded_button.dart';
import 'package:rawg/src/app/features/global/custom_text_form_field_widget.dart';
import 'package:rawg/src/app/features/global/snackbar_message.dart';
import 'package:rawg/src/app/features/home/presentation/pages/home_page.dart';
import 'package:rawg/src/core/responsive/app_responsive.dart';
import 'package:rawg/src/core/routes/app_navigator.dart';
import 'package:rawg/src/core/utils/app_colors.dart';
import 'package:rawg/src/core/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  static const route = '/Login';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) {
          if (state is AuthFailureState) {
            SnackBarMessage()
                .showErrorSnackBar(message: state.error, context: context);
          }
          if (state is AuthLoggedInState) {
            AppNavigator.pushReplace(context, HomePage.route);
          }
        },
        builder: (context, state) {
          if (state is AuthLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return Padding(
              padding: const EdgeInsets.all(AppResponsive.kdefaultPadding),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: AppResponsive.height(context) * 0.2),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          AppStrings.appName,
                          style: AppResponsive.responsiveTextStyle(
                            context,
                            fsize:
                                AppResponsive.kmaxExtraLargeFont(context) + 25,
                            fweight: FontWeight.bold,
                            tColor: AppColor.redDark,
                            fontFamily: AppStrings.rexotickFont,
                            letterSpacing: 3,
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Text(
                        "Login",
                        style: AppResponsive.responsiveTextStyle(
                          context,
                          fsize: AppResponsive.kmaxExtraLargeFont(context) + 10,
                          fweight: FontWeight.bold,
                          tColor: AppColor.redDark,
                        ),
                      ),
                      const SizedBox(height: 20),
                      CustomTextFormField(
                        controller: usernameController,
                        labelText: "Username",
                        hintText: "Enter Username",
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Please Enter Username";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      CustomTextFormField(
                        controller: passwordController,
                        labelText: "Password",
                        hintText: "Enter Password",
                        obscureText: true,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Please Enter Password";
                          }
                          return null;
                        },
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: TextButton(
                          onPressed: () {
                            AppNavigator.push(
                                context, ForgetPasswordPage.route);
                          },
                          child: const Text("Forget Password"),
                        ),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        child: CustomRoundedButtonWidget(
                          onClicked: () {
                            if (_formKey.currentState!.validate()) {
                              BlocProvider.of<AuthenticationBloc>(context).add(
                                  LoginEvent(usernameController.text,
                                      passwordController.text));
                            }
                          },
                          child: const Text("Login"),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: TextButton(
                          onPressed: () {
                            AppNavigator.push(context, SignUpPage.route);
                          },
                          child:
                              const Text("Don't have an account yet?  Sign Up"),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
