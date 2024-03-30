// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:hack_talk/core/utils/app_colors.dart';
//
// class Otp extends StatelessWidget {
//   const Otp({super.key, required this.controller, this.validator});
//   final TextEditingController controller;
//   final String? Function(String?)? validator;
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       child: Row(
//         children: [
//           SizedBox(
//             height: 40,
//             width: 40,
//             child: TextFormField(
//               controller: controller,
//               focusNode: FocusNode(),
//               autofocus: true,
//               keyboardType: TextInputType.number,
//               validator: validator,
//               textAlign: TextAlign.center,
//               inputFormatters: [
//                 LengthLimitingTextInputFormatter(1),
//                 FilteringTextInputFormatter.digitsOnly
//               ],
//               decoration: InputDecoration(
//                 fillColor: Colors.white,
//                 filled: true,
//                 focusedBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(10),
//                   borderSide: const BorderSide(
//                       color: AppColors.mainBlueColor, width: 2),
//                 ),
//                 errorBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(10),
//                   borderSide: const BorderSide(
//                       color: AppColors.mainBlueColor, width: 2),
//                 ),
//                 focusedErrorBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(10),
//                   borderSide: const BorderSide(
//                       color: AppColors.mainBlueColor, width: 2),
//                 ),
//                 border: const OutlineInputBorder(
//                     borderRadius: BorderRadius.all(Radius.circular(10)),
//                     borderSide: BorderSide(color: Colors.grey)),
//                 contentPadding: const EdgeInsets.symmetric(horizontal: 20),
//                 hintStyle:
//                     const TextStyle(color: Colors.grey, fontFamily: "Roboto"),
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
