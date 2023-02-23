import 'package:dartz/dartz.dart';
import 'package:pub_api_client/pub_api_client.dart';
import 'package:pub_api_search/features/home/domain/repositories/search_package.repository.dart';
import 'package:pub_api_search/features/home/domain/usecases/search_pachage.usecase.dart';

class SearchPackageImpUsecase extends SearchPackageUsecase {
  final SearchPackageRepository _searchPackageRepository;

  SearchPackageImpUsecase(this._searchPackageRepository);

  @override
  Future<Either<Exception, List<PackageResult>>> call(String value) =>
      _searchPackageRepository.call(value);
}
