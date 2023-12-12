String getSvgAsset(String fileName) => 'assets/svgs/$fileName.svg';
extension Image on String{
  String get getSvgAsset => 'assets/svgs/$this.svg';
}