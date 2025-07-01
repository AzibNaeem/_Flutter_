import 'package:get_it/get_it.dart';
import 'package:hrisapp/presentation/view_model/home_view_model.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // ViewModels
  sl.registerFactory(() => HomeViewModel());
}
