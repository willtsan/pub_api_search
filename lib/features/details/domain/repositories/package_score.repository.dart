import 'package:dartz/dartz.dart';
import 'package:pub_api_client/pub_api_client.dart';

abstract class PackageScoreRepository {
  Future<Either<Exception, PackageScore>> call(String value);
}
