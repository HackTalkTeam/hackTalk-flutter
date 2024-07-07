import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:hack_talk/core/utils/app_assets.dart';
import 'package:hack_talk/core/utils/app_colors.dart';
import 'package:hack_talk/core/utils/app_routes.dart';
import 'package:hack_talk/core/widgets/button_widget.dart';
import 'package:hack_talk/core/widgets/text_widget.dart';
import 'package:hack_talk/features/drawer/rating/presentation/logic/rating_cubit/rating_cubit.dart';
import 'package:hack_talk/features/home/presentation/screen/home/alertWidget.dart';

class RatingScreen extends StatefulWidget {
  const RatingScreen({Key? key}) : super(key: key);

  @override
  State<RatingScreen> createState() => _RatingScreenState();
}

class _RatingScreenState extends State<RatingScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<RatingCubit>(
      create: (context) => RatingCubit(),
      child: BlocConsumer<RatingCubit, RatingState>(
        listener: (context, state) {},
        builder: (context, state) {
          final ratting = context.watch<RatingCubit>();
          return Scaffold(
            appBar: AppBar(
              leading: const BackButton(
                color: AppColors.mainBlueColor,
              ),
              backgroundColor: Colors.white,
              title: const TextWidget(
                "Rate this app",
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
              elevation: 0.0,
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(33.0),
                child: Column(
                  children: [
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 66, vertical: 33),
                      child: TextWidget(
                        "How was your experience with our app?",
                        maxLines: 3,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    if (ratting.rate == 0) ...{
                      const SizedBox(height: 88),
                    } else if (ratting.rate == 1) ...{
                      Image.asset(
                        'emoji1'.getPngAsset,
                        height: 140,
                        width: 93,
                      ),
                      const TextWidget("Terrible"),
                    } else if (ratting.rate == 2) ...{
                      Image.asset(
                        'emoji2'.getPngAsset,
                        height: 140,
                        width: 93,
                      ),
                      const TextWidget("bad"),
                    } else if (ratting.rate == 3) ...{
                      Image.asset(
                        'emoji3'.getPngAsset,
                        height: 140,
                        width: 93,
                      ),
                      const TextWidget("Good"),
                    } else if (ratting.rate == 4) ...{
                      Image.asset(
                        'emoji4'.getPngAsset,
                        height: 140,
                        width: 93,
                      ),
                      const TextWidget("Great"),
                    } else if (ratting.rate == 5) ...{
                      Image.asset(
                        'emoji5'.getPngAsset,
                        height: 140,
                        width: 93,
                      ),
                      const TextWidget("Top notch!"),
                    },
                    const SizedBox(height: 32),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        RatingBar.builder(
                          initialRating: ratting.rate.toDouble(),
                          minRating: 1,
                          direction: Axis.horizontal,
                          itemCount: 5,
                          itemPadding:
                              const EdgeInsets.symmetric(horizontal: 4.0),
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {
                            ratting.updateRate(rating);
                          },
                        ),
                        const SizedBox(height: 12),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: List.generate(
                            5,
                            (i) => Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                CircleAvatar(
                                  radius: i == ratting.rate - 1 ? 10 : 8,
                                  backgroundColor: i < ratting.rate
                                      ? AppColors.mainBlueColor
                                      : AppColors.rateStarsGreyColor,
                                ),
                                if (i != 4) ...{
                                  Container(
                                      width: 32,
                                      height: 2,
                                      color: i < ratting.rate - 1
                                          ? AppColors.mainBlueColor
                                          : AppColors.rateStarsGreyColor),
                                }
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 22),
                    TextFormField(
                      maxLines: 2,
                      maxLength: 500,
                      decoration: InputDecoration(
                        filled: true,
                        counterStyle:
                            const TextStyle(color: AppColors.mainBlueColor),
                        hintText: 'Write review (Optional)...',
                        hintStyle: const TextStyle(
                            color: AppColors.textFormGryButtonColor),
                        fillColor: AppColors.textFormRattingColor,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(22),
                          borderSide: const BorderSide(
                              color: AppColors.textFormRattingColor),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(22),
                          borderSide: const BorderSide(
                              color: AppColors.textFormRattingColor),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(22),
                          borderSide: const BorderSide(
                              color: AppColors.textFormRattingColor),
                        ),
                      ),
                    ),
                    const SizedBox(height: 22),
                    ButtonWidget(
                      'Submit',
                      color: Colors.white,
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => const AlertDialogRateWidget(),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
