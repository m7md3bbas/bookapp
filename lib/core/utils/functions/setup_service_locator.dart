import 'package:clean_arch_bookly_app/Features/home/data/data_source/home_local_data_source.dart';
import 'package:clean_arch_bookly_app/Features/home/data/data_source/home_remote_data_source.dart';
import 'package:clean_arch_bookly_app/Features/home/data/repos/home_repo_imp.dart';
import 'package:clean_arch_bookly_app/core/utils/api_services.dart';
import 'package:get_it/get_it.dart';
final locator = GetIt.instance;
void setupServiceLocator() {
  GetIt.instance.registerSingleton<HomeRepoImp>(HomeRepoImp(
      homeLocalDataSource: HomeLocalDataSourceImp(),
      homeRemoteDataSource:
          HomeRemoteDataSourceImp(apiServices: ApiServices())),);
}