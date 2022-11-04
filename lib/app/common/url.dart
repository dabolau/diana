import 'package:url_launcher/url_launcher.dart';

/// 启动资源
Future<void> openUrl({
  String uri = 'https://flutter.dev',
}) async {
  var url = Uri.parse(uri);
  if (await canLaunchUrl(url)) {
    await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    );
  } else {
    throw 'Could not launch ${url}';
  }
}
