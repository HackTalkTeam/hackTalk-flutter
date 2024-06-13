import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hack_talk/core/helpers/spacing.dart';
import 'package:hack_talk/core/utils/app_assets.dart';
import 'package:hack_talk/core/utils/app_colors.dart';
import 'package:hack_talk/core/utils/app_routes.dart';
import 'package:hack_talk/core/utils/app_strings.dart';
import 'package:hack_talk/core/widgets/button_second_widget.dart';
import 'package:hack_talk/core/widgets/button_widget.dart';
import 'package:hack_talk/core/widgets/custom_text_form_feild.dart';
import 'package:hack_talk/features/auth/logic/app_cubit/app_cubit.dart';
import 'package:hack_talk/features/auth/logic/update_profile/update_profile_cubit.dart';

class PersonInformationScreen extends StatelessWidget {
  PersonInformationScreen({Key? key}) : super(key: key);
  final nameController = TextEditingController(text: AppCubit.get(AppNavigator.context).userModel?.data?.userDate?.name ?? '');
  final emailController = TextEditingController(text: AppCubit.get(AppNavigator.context).userModel?.data?.userDate?.email ?? '');
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UpdateProfileCubit(),
      child: BlocConsumer<UpdateProfileCubit, UpdateProfileState>(
        listener: (context, state) {
          if (state is UpdateProfileSuccessState) {
            showDialog(
              context: context,
              builder: (context) => const AlertDialog(
                content: Text("your profile updated successfully",
                    style: TextStyle(
                      color: Colors.white,
                    )),
                backgroundColor: AppColors.mainBlueColor,
              ),
            );
          } else if (state is LUpdateProfileFailedState) {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                content: Text(state.msg,
                    style: const TextStyle(
                      color: Colors.white,
                    )),
                backgroundColor: Colors.red,
              ),
            );
          } else {
            const CircularProgressIndicator();
          }
        },
        builder: (context, state) {
          return Scaffold(
              appBar: AppBar(
                forceMaterialTransparency: true,
                leading: const BackButton(
                  color: AppColors.mainBlueColor,
                ),
                title: SvgPicture.asset('hacktalk'.getSvgAsset),
              ),
              body: SafeArea(
                  child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("name"),
                            IconButton(
                                onPressed: () {}, icon: const Icon(Icons.edit))
                          ],
                        ),
                        CustomTextFormFeild(
                          controller: nameController,
                          hintText: 'name',
                          kbType: TextInputType.name,
                          lableText: 'Enter name',
                          onChanged: (value) {},
                          validator: (value) {
                            if (value.isEmpty) {
                              return "name must not be empty";
                            }
                            return null;
                          },
                        ),
                        //verticalSpace(10.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("email"),
                            IconButton(onPressed: () {}, icon: const Icon(Icons.edit))
                          ],
                        ),
                        CustomTextFormFeild(
                          controller: emailController,
                          hintText: 'email',
                          kbType: TextInputType.emailAddress,
                          lableText: 'enter email',
                          onChanged: (value) {},
                          validator: (value) {
                            if (value.isEmpty) {
                              return "email must not be empty";
                            }
                            return null;
                          },
                        ),
                        verticalSpace(10.h),
                        ButtonWidget(
                          "update change",
                          color: Colors.white,
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              BlocProvider.of<UpdateProfileCubit>(context)
                                  .profile(
                                name: nameController.text,
                                email: emailController.text,
                              );
                            }
                            //AppRoutes.routeTo(context, const LoadScreen());
                          },
                        ),
                        verticalSpace(10.h),
                        ButtonSec(
                          text: AppStrings.cancel,
                          color: AppColors.mainBlueColor,
                          onPressed: () {
                            //AppRoutes.routeTo(context, const VerficationScreen());
                          },
                        )
                      ],
                    ),
                  ),
                ),
              )));
        },
      ),
    );
  }
}
