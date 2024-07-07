import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hack_talk/core/utils/app_assets.dart';
import 'package:hack_talk/core/utils/app_colors.dart';
import 'package:hack_talk/core/utils/app_routes.dart';
import 'package:hack_talk/core/widgets/text_widget.dart';

class FeaturesScreen extends StatelessWidget {
  const FeaturesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: AppColors.mainBlueColor),
        forceMaterialTransparency: true,
        title: SvgPicture.asset('hacktalk'.getSvgAsset),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SvgPicture.asset('feature1'.getSvgAsset),
            const FeaturesColumn(
              title: 'Movement analysis',
              description:
                  'computer vision can offer in-depth analysis and feedback on users presentations .This might include insights into pacing, tone, body language and overall presentation structure.',
            ),
            SvgPicture.asset('feature2'.getSvgAsset),
            const FeaturesColumn(
                title: 'Audio analysis',
                description:
                    'Speech analysis feature Providing constructive feedback to the speaker based on the analysis, highlighting areas of strength and suggesting areas for improving presentation performance,'),
            SvgPicture.asset('feature3'.getSvgAsset),
            const FeaturesColumn(
              title: 'Presentation training(VR)',
              description:
                  'virtual reality feature aim to overcome your fear of public speaking  by placing you in an almost real environment so you can practice and get notices about your performance so you can work to improve it  ',
            ),
            // SvgPicture.asset('feature4'.getSvgAsset),
            // const FeaturesColumn(
            //   title: 'Presentation evaluation ',
            //   description:
            //       '"Perfection begins with precision” Our presentation evaluation feature ensures that your uploaded files are thoroughly examined for any potential issues. We aim to provide you with a seamless presentation experience by identifying and addressing problems before you hit the stage. (Note Available in website) ',
            // ),
          ],
        ),
      ),
    );
  }
}

class FeaturesColumn extends StatelessWidget {
  const FeaturesColumn(
      {Key? key, required this.title, required this.description})
      : super(key: key);
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(22.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
                color: AppColors.mainBlueColor,
                fontWeight: FontWeight.w700,
                fontSize: 20),
          ),
          TextWidget(
            description,
            maxLines: 5,
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: AppColors.textBodyColor,
          ),
        ],
      ),
    );
  }
}
