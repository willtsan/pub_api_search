import 'package:dartz/dartz.dart';
import 'package:pub_api_client/pub_api_client.dart';
import 'package:pub_api_search/features/details/data/datasources/package_info.datasource.dart';
import 'package:pub_api_search/features/details/domain/repositories/package_info.repository.dart';

class PackageInfoRepositoryImp extends PackageInfoRepository {
  final PackageInfoDatasource _packageInfoDatasource;

  PackageInfoRepositoryImp(this._packageInfoDatasource);

  @override
  Future<Either<Exception, PubPackage>> call(String value) =>
      _packageInfoDatasource.call(value);
}
