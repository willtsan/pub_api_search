import 'package:dartz/dartz.dart';
import 'package:pub_api_client/pub_api_client.dart';

abstract class SearchPackageRepository {
  Future<Either<Exception, List<PackageResult>>> call(String value);
}
