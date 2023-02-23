import 'package:dartz/dartz.dart';
import 'package:pub_api_client/pub_api_client.dart';
import 'package:pub_api_search/features/details/data/datasources/package_score.datasource.dart';
import 'package:pub_api_search/features/details/domain/repositories/package_score.repository.dart';

class PackageScoreRepositoryImp extends PackageScoreRepository {
  final PackageScoreDatasource _packageScoreDatasource;

  PackageScoreRepositoryImp(this._packageScoreDatasource);

  @override
  Future<Either<Exception, PackageScore>> call(String value) =>
      _packageScoreDatasource.call(value);
}
