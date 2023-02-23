import 'package:get/get.dart';
import 'package:pub_api_client/pub_api_client.dart';
import 'package:pub_api_search/features/details/domain/usecases/package_info.usecase.dart';
import 'package:pub_api_search/features/details/domain/usecases/package_score.usecase.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DetailsController extends GetxController {
  RxBool isLoading = true.obs;

  String? packageSelected;
  PubPackage? package;
  PackageScore? score;

  final PackageInfoUsecase _packageInfoUsecase;
  final PackageScoreUsecase _packageScoreUsecase;

  DetailsController(this._packageInfoUsecase, this._packageScoreUsecase);

  @override
  void onReady() {
    packageSelected = Get.parameters['package']!;

    writePackageOnStorage();

    loadPackageInfo();

    super.onReady();
  }

  Future<void> loadPackageInfo() async {
    if (packageSelected == null) {
      Get.back();
      return;
    }

    isLoading.value = true;

    var infoResult = await _packageInfoUsecase(packageSelected!);
    infoResult.fold((l) => null, (r) => package = r);

    var scoreResult = await _packageScoreUsecase(packageSelected!);
    scoreResult.fold((l) => null, (r) => score = r);

    isLoading.value = false;
  }

  Future<void> writePackageOnStorage() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    List<String> recent = pref.getStringList('recent_search') ?? [];

    if (!recent.contains(packageSelected)) {
      if (recent.length >= 5) {
        recent.removeLast();
        recent.insert(0, packageSelected!);
      } else {
        recent.insert(0, packageSelected!);
      }
    } else {
      recent.remove(packageSelected);
      recent.insert(0, packageSelected!);
    }

    pref.setStringList('recent_search', recent);
  }
}
