enum Flavor {
  DEV,
  PROD,
  STAG,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.DEV:
        return 'Flutter Flavor Dev';
      case Flavor.PROD:
        return 'Flutter Flavor Prod';
      case Flavor.STAG:
        return 'Flutter Flavor Stag';
      default:
        return 'title';
    }
  }

  static String get baseUrl {
    switch (appFlavor) {
      case Flavor.DEV:
        return 'https://reqres.in';
      case Flavor.PROD:
        return 'https://reqres.in';
      default:
        return 'https://reqres.in';
    }
  }
}
