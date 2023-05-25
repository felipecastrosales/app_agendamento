class FlavorConfig {
  FlavorConfig({
    required this.flavor,
    required this.baseUrl,
  });

  final AppFlavor flavor;
  final String baseUrl;
}

enum AppFlavor {
  dev,
  prod,
}
