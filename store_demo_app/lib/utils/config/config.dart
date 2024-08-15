enum Environment { dev, prod }

abstract class AppConfig {
  static late String baseUrl;
  static late Environment _environment;
  static late Environment barrierToken;

  static Environment get environment => _environment;

  static setupEnv(Environment env) {
    _environment = env;
    switch (env) {
      case Environment.dev:
        {
          baseUrl = "https://fakestoreapi.com/";
        }
      case Environment.prod:
        {
          baseUrl = "https://fakestoreapi.com/";
        }
    }
  }
}
