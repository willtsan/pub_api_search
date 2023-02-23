import 'package:dartz/dartz.dart';
import 'package:pub_api_client/pub_api_client.dart';

abstract class PackageInfoDatasource {
  Future<Either<Exception, PubPackage>> call(String value);
}
