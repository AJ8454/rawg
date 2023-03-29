import 'package:rawg/src/app/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:rawg/src/app/features/global/custom_rounded_button.dart';
import 'package:rawg/src/app/features/global/custom_text_form_field_widget.dart';
import 'package:rawg/src/app/features/global/snackbar_message.dart';
import 'package:rawg/src/core/responsive/app_responsive.dart';
import 'package:rawg/src/core/routes/app_navigator.dart';
import 'package:rawg/src/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({super.key});
  static const route = "/ForgetPassword";

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
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
        if (state is AuthPasswordChangedState) {
          SnackBarMessage().showSuccessSnackBar(
              message: "Password Changed", context: context);
          AppNavigator.pop(context);
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
                    Text(
                      "Forget Password",
                      style: AppResponsive.responsiveTextStyle(
                        context,
                        fsize: AppResponsive.kmaxExtraLargeFont(context) + 10,
                        fweight: FontWeight.bold,
                        tColor: AppColor.blue,
                      ),
                    ),
                    const SizedBox(height: 20),
                    CustomTextFormField(
                      controller: emailController,
                      labelText: "Email",
                      hintText: "Enter Email",
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Please Enter Email";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    CustomTextFormField(
                      controller: passwordController,
                      labelText: "New Password",
                      hintText: "Enter New Password",
                      obscureText: true,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Please Enter Password";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    CustomTextFormField(
                      controller: confirmPasswordController,
                      labelText: "Confirm Password",
                      hintText: "Enter Confirm Password",
                      obscureText: true,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Please Enter Password";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: CustomRoundedButtonWidget(
                        onClicked: () {
                          if (_formKey.currentState!.validate()) {
                            BlocProvider.of<AuthenticationBloc>(context).add(
                                ForgetPasswordEvent(emailController.text,
                                    confirmPasswordController.text));
                          }
                        },
                        child: const Text("Changed Password"),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: TextButton(
                        onPressed: () {
                          AppNavigator.pop(context);
                        },
                        child: const Text("Already have an account?  Login"),
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
    ));
  }
}
