import 'package:flutter_svg/svg.dart';

class HelperMethods{
  static void svgPrecacheImage() {
    const cacheSvgImages = [
      'assets/svgs/congratulation.svg',
      'assets/svgs/audio_gallery.svg',
      'assets/svgs/audio.svg',
      'assets/svgs/arcticons_nc-passwords.svg',
      'assets/svgs/alert.svg',
      'assets/svgs/contact_us.svg',
      'assets/svgs/forget.svg',
      'assets/svgs/down_image.svg',
      'assets/svgs/download.svg',
      'assets/svgs/ellipse.svg',
      'assets/svgs/feature1.svg',
      'assets/svgs/feature2.svg',
      'assets/svgs/feature3.svg',
      'assets/svgs/feature4.svg',
      'assets/svgs/fluent_person-24-regular.svg',
      'assets/svgs/hacktalk.svg',
      'assets/svgs/home.svg',
      'assets/svgs/iconamoon_arrow-right-2-bold.svg',
      'assets/svgs/login.svg',
      'assets/svgs/logo_svg.svg',
      'assets/svgs/mdi_about-circle-outline.svg',
      'assets/svgs/onBoarding1.svg',
      'assets/svgs/onBoarding2.svg',
      'assets/svgs/onBoarding3.svg',
      'assets/svgs/onBoarding4.svg',
      'assets/svgs/profile.svg',
      'assets/svgs/question.svg',
      'assets/svgs/record.svg',
      'assets/svgs/record video.svg',
      'assets/svgs/record_pause.svg',
      'assets/svgs/reset.svg',
      'assets/svgs/signUp.svg',
      'assets/svgs/solar_star-fall-broken.svg',
      'assets/svgs/start audio record.svg',
      'assets/svgs/start download image audio.svg',
      'assets/svgs/Start recording.svg',
      'assets/svgs/start recording image audio.svg',
      'assets/svgs/stop icon audio record.svg',
      'assets/svgs/text2_logo.svg',
      'assets/svgs/text_logo.svg',
      'assets/svgs/up_image.svg',
      'assets/svgs/Upload video.svg',
      'assets/svgs/upload video image.svg',
      'assets/svgs/verification.svg',
      'assets/svgs/video.svg',
      'assets/svgs/video_gallery.svg',
    ];

    for (String element in cacheSvgImages) {
      var loader = SvgAssetLoader(element);
      svg.cache
          .putIfAbsent(loader.cacheKey(null), () => loader.loadBytes(null));
    }
  }
}