import 'package:dartz/dartz.dart';
import 'package:pub_api_client/pub_api_client.dart';
import 'package:pub_api_search/features/details/domain/repositories/package_info.repository.dart';
import 'package:pub_api_search/features/details/domain/usecases/package_info.usecase.dart';

class PackageInfoUsecaseImp extends PackageInfoUsecase {
  final PackageInfoRepository _packageInfoRepository;

  PackageInfoUsecaseImp(this._packageInfoRepository);

  @override
  Future<Either<Exception, PubPackage>> call(String value) =>
      _packageInfoRepository.call(value);
}
