import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:pub_api_client/pub_api_client.dart';
import 'package:pub_api_search/features/details/data/datasources/package_score.datasource.dart';

class PackageScoreDatasourceImp extends PackageScoreDatasource {
  PubClient client = Get.find();

  @override
  Future<Either<Exception, PackageScore>> call(String value) async {
    try {
      PackageScore request = await client.packageScore(value);
      return Right<Exception, PackageScore>(request);
    } catch (e) {
      return Left<Exception, PackageScore>(Exception(e));
    }
  }
}
