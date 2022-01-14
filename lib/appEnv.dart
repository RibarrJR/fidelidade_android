const _baseUrl = "baseUrl";

enum AppEnvironment { dev, stage, prod }

Map<String, dynamic> _config = {};

void setEnvironment(AppEnvironment env) {
  switch (env) {
    case AppEnvironment.dev:
      _config = devConstants;
      break;
    case AppEnvironment.stage:
      _config = stageConstants;
      break;
    case AppEnvironment.prod:
      _config = prodConstants;
      break;
  }
}

dynamic get apiBaseUrl {
  return _config[_baseUrl];
}

Map<String, dynamic> devConstants = {
  _baseUrl: "http://localhost:8001",
};

Map<String, dynamic> stageConstants = {
  _baseUrl: "http://localhost:8001",
};

Map<String, dynamic> prodConstants = {
  _baseUrl: "http://localhost:8001",
};