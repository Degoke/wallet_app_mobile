class Enviroments {
  static const String PRODUCTION = 'prod';
  static const String DEV = 'dev';
}

class ConfigEnviroments {
  static const String _currentEnviroment = Enviroments.DEV;

  static final List<Map<String, String>> _availableEnviroments = [
    {
      'env': Enviroments.DEV,
      'url': 'https://57c7-102-89-40-193.eu.ngrok.io/api/v1/',
    },
    {
      'env': Enviroments.PRODUCTION,
      'url': '',
    },
  ];

  static Map<String, String> getEnviroments() {
  return _availableEnviroments.firstWhere((d) => d['env'] == _currentEnviroment);
  }
}

