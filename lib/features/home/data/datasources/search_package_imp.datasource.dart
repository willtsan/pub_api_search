import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:pub_api_client/pub_api_client.dart';
import 'package:pub_api_search/features/home/data/datasources/search_package.datasource.dart';

class SearchPackageDatasourceImp extends SearchPackageDatasource {
  PubClient client = Get.find();

  @override
  Future<Either<Exception, List<PackageResult>>> call(String value) async {
    List<PackageResult> results = [];

    try {
      var request = await client.search(value);
      results.addAll(request.packages);
      return Right<Exception, List<PackageResult>>(results);
    } catch (e) {
      return Left<Exception, List<PackageResult>>(Exception(e));
    }
  }
}
