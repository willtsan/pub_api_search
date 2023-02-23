import 'package:dartz/dartz.dart';
import 'package:pub_api_client/pub_api_client.dart';
import 'package:pub_api_search/features/details/domain/repositories/package_score.repository.dart';
import 'package:pub_api_search/features/details/domain/usecases/package_score.usecase.dart';

class PackageScoreUsecaseImp extends PackageScoreUsecase {
  final PackageScoreRepository _packageScoreRepository;

  PackageScoreUsecaseImp(this._packageScoreRepository);

  @override
  Future<Either<Exception, PackageScore>> call(String value) =>
      _packageScoreRepository.call(value);
}
