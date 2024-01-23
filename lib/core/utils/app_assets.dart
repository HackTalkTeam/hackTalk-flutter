String getSvgAsset(String fileName) => 'assets/svgs/$fileName.svg';
String getPngAsset(String fileName) => 'assets/images/$fileName.png';

extension ImageAsset on String {
  String get getSvgAsset => 'assets/svgs/$this.svg';
  String get getPngAsset => 'assets/images/$this.png';
}
