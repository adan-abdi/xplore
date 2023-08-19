class VersionModel {
  final String appName;
  final String buildNumber;
  final String packageName;
  final String version;

  VersionModel(
      {required this.appName,
      required this.buildNumber,
      required this.packageName,
      required this.version});
}
