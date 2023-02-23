import 'package:dartz/dartz.dart';
import 'package:pub_api_client/pub_api_client.dart';

abstract class SearchPackageUsecase {
  Future<Either<Exception, List<PackageResult>>> call(String value);
}
