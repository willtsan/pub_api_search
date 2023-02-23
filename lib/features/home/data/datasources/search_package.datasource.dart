import 'package:dartz/dartz.dart';
import 'package:pub_api_client/pub_api_client.dart';

abstract class SearchPackageDatasource {
  Future<Either<Exception, List<PackageResult>>> call(String value);
}
