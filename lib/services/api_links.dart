const EnvironmentFlavours currentEnvironment = EnvironmentFlavours.development;

class ApiLinks {
  static void init({
    required EnvironmentFlavours environment,
  }) {
    if (environment == EnvironmentFlavours.development) {
      baseURL = _developmentURL;
      baseURLImage = _developmentImageURL;
    } else if (environment == EnvironmentFlavours.production) {
      baseURL = _productionURL;
      baseURLImage = _productionImageURL;
    } else if (environment == EnvironmentFlavours.local) {
      baseURL = _localURL;
      baseURLImage = _localImageURL;
    }
  }
  // old production url:  https://development.v2.dispatchpro.us/api/v1
  // production url:  https://backend.dispatchpro.us/api/v1
  // local url:  http://192.168.100.66:3333/api/v1
   //base URL
   //test base URL

  static late final String baseURL;
  static late final String baseURLImage;

  static const String _developmentURL = "";
  static const String _productionURL = '';
  static const String _localURL = '';

  //test base Image URL
  static const String _developmentImageURL = "";
  static const String _productionImageURL = '';
  static const String _localImageURL = '';

  // imageUrl
  static final String imagesUrl = '$baseURL/Images/';

  static const String signIn = "/login";
  static const String signOut = "/logout";
}

enum EnvironmentFlavours {
  development, //for developers
  production,
  local,
}
