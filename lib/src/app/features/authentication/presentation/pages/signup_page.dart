import 'package:rawg/src/app/features/authentication/domain/entities/user_entity.dart';
import 'package:rawg/src/app/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:rawg/src/app/features/global/custom_drop_down_widget.dart';
import 'package:rawg/src/app/features/global/custom_rounded_button.dart';
import 'package:rawg/src/app/features/global/custom_text_form_field_widget.dart';
import 'package:rawg/src/app/features/global/snackbar_message.dart';
import 'package:rawg/src/core/responsive/app_responsive.dart';
import 'package:rawg/src/core/routes/app_navigator.dart';
import 'package:rawg/src/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});
  static const route = '/SignUp';

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController fNameController = TextEditingController();
  final TextEditingController lNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  String selectedGender = '';

  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthenticationBloc, AuthenticationState>(
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
                      SizedBox(height: AppResponsive.height(context) * 0.07),
                      Text(
                        "Sign Up",
                        style: AppResponsive.responsiveTextStyle(
                          context,
                          fsize: AppResponsive.kmaxExtraLargeFont(context) + 10,
                          fweight: FontWeight.bold,
                          tColor: AppColor.redDark,
                        ),
                      ),
                      const SizedBox(height: 20),
                      CustomTextFormField(
                        controller: userNameController,
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
                      Row(
                        children: [
                          Expanded(
                            child: CustomTextFormField(
                              controller: fNameController,
                              labelText: "First Name",
                              hintText: "Enter First Name",
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return "Please Enter First Name";
                                }
                                return null;
                              },
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: CustomTextFormField(
                              controller: lNameController,
                              labelText: "Last Name",
                              hintText: "Enter Last Name",
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return "Please Enter Last Name";
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      CustomDropDownWidget(
                        dropMenuList: const ["Male", "Female", "Other"],
                        labelText: "Gender",
                        hintText: "Select Gender",
                        selectedReturnValue: (value) {
                          selectedGender = value;
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
                          child: const Text("SignUp"),
                          onClicked: () {
                            if (_formKey.currentState!.validate()) {
                              UserEntity userEntity = UserEntity(
                                username: userNameController.text,
                                email: emailController.text,
                                password: confirmPasswordController.text,
                                fName: fNameController.text,
                                lName: lNameController.text,
                                gender: selectedGender,
                                image: "",
                                createdAt: DateTime.now(),
                              );
                              BlocProvider.of<AuthenticationBloc>(context)
                                  .add(SignUpEvent(userEntity));
                            }
                          },
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
        listener: (context, state) {
          if (state is AuthFailureState) {
            SnackBarMessage()
                .showErrorSnackBar(message: state.error, context: context);
          }
          if (state is AuthSignedUpState) {
            SnackBarMessage().showSuccessSnackBar(
                message: "User Created Successfully", context: context);
            AppNavigator.pop(context);
          }
        },
      ),
    );
  }
}
