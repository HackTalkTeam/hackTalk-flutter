import 'package:flutter/material.dart';
import 'package:hack_talk/core/utils/app_assets.dart';
import 'package:hack_talk/core/utils/app_colors.dart';
import 'package:hack_talk/core/utils/app_routes.dart';
import 'package:hack_talk/core/widgets/text_widget.dart';
import 'package:hack_talk/features/home/presentation/widgets/app_bar_widget.dart';
import 'package:hack_talk/features/home/presentation/widgets/home_button_widget.dart';
import 'package:flutter/services.dart';


class VrScreen extends StatefulWidget {
  const VrScreen({Key? key}) : super(key: key);

  @override
  State<VrScreen> createState() => _VrScreenState();
}

class _VrScreenState extends State<VrScreen> {
  @override
//-------------------------------------------
//   void dispose(){
//     SystemChrome.setPreferredOrientations([]);
//     super.dispose();
//   }
//-------------------------------------------

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        onPressed: () {
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
            AppRoutes.pop(context);
          });
        },
        icon: Icons.arrow_back,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            Image.asset('vr2'.getPngAsset),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 44, vertical: 33),
              child: TextWidget(
                  "To get virtual reality experience you have to download VR application first ",
                  maxLines: 3,
                  textAlign: TextAlign.center,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
            Row(
              children: [
                Expanded(
                  child: HomeButtonWidget(
                    color: AppColors.mainBlueColor,
                    text: 'Start downloading',
                    onPressed: () {},
                    textColor: AppColors.homeButtonColor,
                    image: 'download',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
