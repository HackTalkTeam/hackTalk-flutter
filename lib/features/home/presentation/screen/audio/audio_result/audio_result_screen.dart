import 'package:flutter/material.dart';
import 'package:hack_talk/core/utils/app_colors.dart';
import 'package:hack_talk/core/widgets/text_widget.dart';

import 'audio_analysis_screen.dart';

class AudioResultScreen extends StatelessWidget {
  const AudioResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
            leading: const Icon(Icons.arrow_back),
            title: const Text('Result'),
            actions: const [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("Done"),
              ),
            ],
          centerTitle: true,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child: Container(
                height: 40,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  color: AppColors.homeButtonColor,
                ),
                child: const TabBar(
                  indicatorSize: TabBarIndicatorSize.tab,
                  dividerColor: Colors.transparent,
                  indicator: BoxDecoration(
                    color: AppColors.mainBlueColor,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.black54,
                  tabs: [
                Tab(
                child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Text",
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
                Tab(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Analysis",
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                  ],
                ),
              ),
            ),
          ),
        ),
        body: const TabBarView(
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextWidget("The project, uh, aims to develop uh, a team of dedicated professionals, "
                        "um, who are highly skilled in their field. Uh, these professionals will work,"
                        " um, together to achieve our project goals. Uh, one of the main objectives, "
                        "um, is to create a safe and stimulating environment for learners."
                        " Uh, by leveraging innovative techniques, um, we can ensure that every learner,"
                        " uh, receives the support they need to succeed. Um, through this project,"
                        " we hope to make a meaningful impact, uh, on education and society as a whole.",
                      maxLines: 20,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textBodyColor,
                    ),
                  ),
                ],
              ),
            ),
            Center(child: AudioAnalysisScreen()),
          ],
        ),
      ),
    );
  }
}