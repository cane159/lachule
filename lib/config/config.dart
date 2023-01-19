// ignore_for_file: unused_element
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:lachule/constants/env.dart';
import 'package:lachule/models/environment.dart';

class Config {
  static Config? _instance = Config._();
  static Config get instance => _instance ??= Config._();
  String _devEnv = DevEnvironment.dev;
  //Environment? _env;

  String? app;
  String? pushgearsAppId;
  String? pushgearsAppSecret;
  String? pushgearsAppPrefix;

  Future<void> setup({required String? env}) async {
    await _initEnvironment(env: env);
  }

  /// setup environment
  Future<void> _initEnvironment({String? env}) async {
    _devEnv = env ?? DevEnvironment.dev;
    await _loadData(_devEnv);
    //_env = Environment.fromJson(dotenv.env);
  }

  Future<void> _loadData(String env) async {
    switch (env) {
      case DevEnvironment.prod:
        await dotenv.load(fileName: ".env.prod");
        break;
      case DevEnvironment.stg:
        await dotenv.load(fileName: ".env.qa");
        break;
      case DevEnvironment.dev:
        await dotenv.load(fileName: ".env.dev");
        break;
      default:
        await dotenv.load(fileName: ".env");
        break;
    }
  }

  Config._();

  static const String keyApp = 'app';
  static const String keyPushgearsAppId = 'pushgears_app_id';
  static const String keyPushgearsAppSecret = 'pushgears_app_secret';
  static const String keyPushgearsAppPrefix = 'pushgears_app_prefix';
  static String get devEnv => instance._devEnv;
  //static Environment get env => instance._env!;
}
