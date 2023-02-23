import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:pub_api_client/pub_api_client.dart';
import 'package:pub_api_search/features/details/data/datasources/package_info.datasource.dart';

class PackageInfoDatasourceImp extends PackageInfoDatasource {
  PubClient client = Get.find();

  @override
  Future<Either<Exception, PubPackage>> call(String value) async {
    try {
      PubPackage request = await client.packageInfo(value);
      return Right<Exception, PubPackage>(request);
    } catch (e) {
      return Left<Exception, PubPackage>(Exception(e));
    }
  }
}
