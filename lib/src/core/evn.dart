enum Environment { staging, production }

abstract class AppEnvironment {
  static late String baseApiUrl;
  static late Environment _environment;
  static Environment get environment => _environment;
  static bool get showDebug =>
      _environment == Environment.staging ? true : false;

  static setupEnv(Environment env) {
    _environment = env;
    switch (env) {
      case Environment.staging:
        baseApiUrl = 'http://15.206.178.102:9004/api/v3/';
        break;
      case Environment.production:
        baseApiUrl = 'https://api.rawg.io/';
        break;
    }
  }
}
