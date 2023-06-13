class FlavorConfig {
  FlavorConfig({
    required this.flavor,
    required this.baseUrl,
    required this.appId,
    required this.restKey,
  });

  final AppFlavor flavor;
  final String baseUrl;
  final String appId;
  final String restKey;
}

enum AppFlavor {
  dev,
  prod,
}
