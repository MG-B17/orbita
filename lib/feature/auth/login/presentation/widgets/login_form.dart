import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hackthon/core/utils/widgets/loading_widget.dart';
import 'package:hackthon/feature/auth/controller/auth_cubit.dart';
import 'package:hackthon/feature/auth/controller/auth_states.dart';
import '../../../../../config/navigation/navigation.dart';
import '../../../../../core/utils/color/app_color.dart';
import '../../../../../core/utils/strings/app_strings.dart';
import '../../../../../core/utils/validator/app_validator.dart';
import '../../../../../core/utils/widgets/custom_button.dart';
import '../../../../../core/utils/widgets/custom_text_field.dart';
import '../../../../../core/utils/widgets/error_dialog.dart';
import '../../../reset_password/presentation/screen/reset_screen.dart';

class LoginForm extends StatelessWidget {
  LoginForm({super.key});

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomTextField(
                  controller: _emailController,
                  prefixIcon: Icons.person_rounded,
                  hintText: AppStrings.email,
                  keyBoardType: TextInputType.name,
                  validator: (input) {
                    return AppValidator.validate(
                      input: input!,
                      type: ValidationType.fullname,
                    );
                  },
                ),
                SizedBox(height: 30),
                CustomTextField(
                  hideInput: true,
                  prefixIcon: Icons.lock_outline,
                  controller: _passwordController,
                  hintText: AppStrings.password,
                  keyBoardType: TextInputType.visiblePassword,
                  validator: (input) {
                    return AppValidator.validate(
                      input: input!,
                      type: ValidationType.password,
                    );
                  },
                ), //password
                SizedBox(height: 5),
                TextButton(
                  onPressed: () {
                    PushNavigation().navigation(context: context, screen: ResetScreen());
                  },
                  child: Text(
                    AppStrings.forgetPassword,style: TextStyle(color: AppColor.greyColor,), textAlign: TextAlign.end,),
                ),
                SizedBox(height: 20,),
                BlocConsumer<AuthCubit,AuthStates>(
                  listener: (context,state){
                    if(state is LoginSuccessful){
                    //  PushNavigation().navigation(context: context, screen: screen);
                    }else if (state is LoginFail){
                      showDialog(context: context, builder:(context)=>AppDialog(errorMessage: state.errorMessage));
                    }
                  },
                  builder: (context,state){
                    return state is LoadingLogin ?LoadingWidget():CustomButton(
                      width: 295,
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          AuthCubit.get(context).login(userName: _emailController.text, password:_passwordController.text,);
                        }
                      },
                      buttonText: AppStrings.login,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
