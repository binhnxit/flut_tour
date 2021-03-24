import 'package:fluttour/my_app.dart';
import 'package:fluttour/utils/app_config.dart';

Future<void> main() async {
  Config(env: Env.dev());
  await myMain();
}