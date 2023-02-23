import 'package:dartz/dartz.dart';
import 'package:pub_api_client/pub_api_client.dart';

abstract class PackageInfoRepository {
  Future<Either<Exception, PubPackage>> call(String value);
}
