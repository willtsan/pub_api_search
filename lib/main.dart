import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pub_api_client/pub_api_client.dart';
import 'package:pub_api_search/features/details/data/datasources/package_info.datasource.dart';
import 'package:pub_api_search/features/details/data/datasources/package_info_imp.datasource.dart';
import 'package:pub_api_search/features/details/data/datasources/package_score.datasource.dart';
import 'package:pub_api_search/features/details/data/datasources/package_score_imp.datasource.dart';
import 'package:pub_api_search/features/details/data/repositories/package_info_imp.repository.dart';
import 'package:pub_api_search/features/details/data/repositories/package_score_imp.repository.dart';
import 'package:pub_api_search/features/details/domain/repositories/package_info.repository.dart';
import 'package:pub_api_search/features/details/domain/repositories/package_score.repository.dart';
import 'package:pub_api_search/features/details/domain/usecases/package_info.usecase.dart';
import 'package:pub_api_search/features/details/domain/usecases/package_info_imp.usecase.dart';
import 'package:pub_api_search/features/details/domain/usecases/package_score.usecase.dart';
import 'package:pub_api_search/features/details/domain/usecases/package_score_imp.usecase.dart';
import 'package:pub_api_search/features/details/presentation/page/details.controller.dart';
import 'package:pub_api_search/features/details/presentation/page/details.page.dart';
import 'package:pub_api_search/features/home/data/datasources/search_package.datasource.dart';
import 'package:pub_api_search/features/home/data/datasources/search_package_imp.datasource.dart';
import 'package:pub_api_search/features/home/data/repositories/search_package_imp.repository.dart';
import 'package:pub_api_search/features/home/domain/repositories/search_package.repository.dart';
import 'package:pub_api_search/features/home/domain/usecases/search_pachage.usecase.dart';
import 'package:pub_api_search/features/home/domain/usecases/search_package_imp.usecase.dart';
import 'package:pub_api_search/features/home/presentation/page/home.controller.dart';
import 'package:pub_api_search/features/home/presentation/page/home.page.dart';

void main() {
  registerDependecies();

  runApp(const MyApp());
}

void registerDependecies() {
  // Pub api
  Get.put<PubClient>(PubClient());

  // Datasource
  Get.put<SearchPackageDatasource>(SearchPackageDatasourceImp());
  Get.put<PackageInfoDatasource>(PackageInfoDatasourceImp());
  Get.put<PackageScoreDatasource>(PackageScoreDatasourceImp());

  // Repository
  Get.put<SearchPackageRepository>(SearchPackageRepositoryImp(Get.find()));
  Get.put<PackageInfoRepository>(PackageInfoRepositoryImp(Get.find()));
  Get.put<PackageScoreRepository>(PackageScoreRepositoryImp(Get.find()));

  // Usecase
  Get.put<SearchPackageUsecase>(SearchPackageImpUsecase(Get.find()));
  Get.put<PackageInfoUsecase>(PackageInfoUsecaseImp(Get.find()));
  Get.put<PackageScoreUsecase>(PackageScoreUsecaseImp(Get.find()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Pub Api Search',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      getPages: [
        GetPage(
            name: '/', page: () => const HomePage(), binding: HomeBinding()),
        GetPage(
            name: '/details',
            page: () => const DetailsPage(),
            binding: DetailsBinding()),
      ],
      initialRoute: '/',
    );
  }
}

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController(Get.find()));
  }
}

class DetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DetailsController(Get.find(), Get.find()));
  }
}
