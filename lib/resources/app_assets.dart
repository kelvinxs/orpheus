class AppAssets{
  static final String _imageAssetPath = "assets/images/";
  static final String _scriptAssetPath = "assets/scripts/";
  static final String _soundsAssetPath = "assets/scripts/";

  static String image(String imageName) => _imageAssetPath + imageName;
  static String script(String scriptName) => _scriptAssetPath + scriptName;
  static String sound(String soundName) => _soundsAssetPath + soundName;
}