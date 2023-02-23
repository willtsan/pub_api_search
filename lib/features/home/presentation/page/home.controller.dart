import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pub_api_search/features/home/domain/usecases/search_pachage.usecase.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  RxBool isSearchClosed = true.obs;
  RxBool isLoading = false.obs;
  RxBool isError = false.obs;

  String errorMessage = '';

  RxList<String> searchResults = RxList<String>();

  late TextEditingController controller;

  final SearchPackageUsecase _searchPackageUsecase;

  HomeController(this._searchPackageUsecase);

  @override
  void onInit() {
    controller = TextEditingController();
    isSearchClosed.value = true;
    super.onInit();
  }

  @override
  void onReady() {
    fillRecentSearches();
    super.onReady();
  }

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }

  Future<void> fillRecentSearches() async {
    searchResults.clear();
    if (controller.text.isEmpty && !isSearchClosed.value) {
      SharedPreferences pref = await SharedPreferences.getInstance();
      List<String> recent = pref.getStringList('recent_search') ?? [];

      if (recent.isNotEmpty) {
        searchResults.add('Recent Searches');
      }
      searchResults.addAll(recent);
    }
  }

  Future<void> search(String value) async {
    searchResults.clear();

    final results = await _searchPackageUsecase(value);
    results.fold(
      (l) => errorMessage = l.toString(),
      // ignore: avoid_function_literals_in_foreach_calls
      (r) => r.forEach(
        (result) =>
            searchResults.length < 5 ? searchResults.add(result.package) : null,
      ),
    );
  }
}
