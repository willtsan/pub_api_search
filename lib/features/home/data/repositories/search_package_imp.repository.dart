import 'package:dartz/dartz.dart';
import 'package:pub_api_client/pub_api_client.dart';
import 'package:pub_api_search/features/home/data/datasources/search_package.datasource.dart';
import 'package:pub_api_search/features/home/domain/repositories/search_package.repository.dart';

class SearchPackageRepositoryImp extends SearchPackageRepository {
  final SearchPackageDatasource _searchPackageDatasource;

  SearchPackageRepositoryImp(this._searchPackageDatasource);

  @override
  Future<Either<Exception, List<PackageResult>>> call(String value) =>
      _searchPackageDatasource.call(value);
}
