import 'package:path_provider/path_provider.dart';

Future<String> get databasePath async {
  final path = await getApplicationDocumentsDirectory();
  return path.path;
}