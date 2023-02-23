import 'package:dartz/dartz.dart';
import 'package:pub_api_client/pub_api_client.dart';

abstract class PackageInfoUsecase {
  Future<Either<Exception, PubPackage>> call(String value);
}
