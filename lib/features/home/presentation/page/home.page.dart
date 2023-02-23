import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mix/mix.dart';
import 'package:pub_api_search/features/home/presentation/component/search_field.component.dart';
import 'package:pub_api_search/features/home/presentation/page/home.controller.dart';
import 'package:pub_api_search/features/home/presentation/page/home.mix.dart';
import 'package:pub_api_search/main.mix.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: GestureDetector(
        onTap: () {
          if (!controller.isSearchClosed.value) {
            controller.isSearchClosed.value = true;
            controller.searchResults.clear();
          }
        },
        child: Box(
          mix: MainMix.general,
          child: FlexBox(
            inherit: true,
            mix: HomeMix.flexbox,
            direction: Axis.vertical,
            children: [
              Obx(
                () => GestureDetector(
                  onTap: () async {
                    if (controller.isSearchClosed.value) {
                      controller.isSearchClosed.value = false;
                      controller.controller.text = "";
                      controller.fillRecentSearches();
                    }
                  },
                  child: SearchField(
                    controller: controller.controller,
                    isClosed: controller.isSearchClosed.value,
                    onChanged: (value) {
                      if (value.length >= 2) {
                        controller.search(value);
                      } else {
                        controller.fillRecentSearches();
                      }
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 6,
              ),
              Obx(() => controller.searchResults.isEmpty &&
                      controller.controller.text.isEmpty &&
                      controller.isSearchClosed.value == false
                  ? Box(
                      mix: Mix(
                        width(MediaQuery.of(context).size.width -
                            MediaQuery.of(context).size.width * .3),
                        height(42),
                        borderColor(MainMix.primary),
                        borderWidth(2),
                        rounded(15),
                        pt(6),
                      ),
                      child: Center(
                          child:
                              TextMix('No Recent Searches', mix: HomeMix.text)),
                    )
                  : const SizedBox.shrink()),
              Obx(
                (() => controller.searchResults.isNotEmpty
                    ? Box(
                        mix: Mix(width(MediaQuery.of(context).size.width -
                            MediaQuery.of(context).size.width * .3)),
                        child: FlexBox(
                          direction: Axis.vertical,
                          mix: HomeMix.resultsBox,
                          children: List.generate(
                              controller.searchResults.length,
                              (index) => FlexBox(
                                    direction: Axis.vertical,
                                    children: [
                                      index == 0 &&
                                              controller.controller.text.isEmpty
                                          ? Box(
                                              mix: index == 0
                                                  ? HomeMix.resultItem.apply(
                                                      HomeMix.resultItemTop)
                                                  : index ==
                                                          controller
                                                                  .searchResults
                                                                  .length -
                                                              1
                                                      ? HomeMix.resultItem
                                                          .apply(HomeMix
                                                              .resultItemBottom)
                                                      : HomeMix.resultItem
                                                          .apply(HomeMix
                                                              .resultItemBody),
                                              child: Center(
                                                child: TextMix(controller
                                                    .searchResults[index]),
                                              ),
                                            )
                                          : Pressable(
                                              child: Box(
                                                mix: index == 0
                                                    ? HomeMix.resultItem.apply(
                                                        HomeMix.resultItemTop)
                                                    : index ==
                                                            controller
                                                                    .searchResults
                                                                    .length -
                                                                1
                                                        ? HomeMix.resultItem
                                                            .apply(HomeMix
                                                                .resultItemBottom)
                                                        : HomeMix.resultItem
                                                            .apply(HomeMix
                                                                .resultItemBody),
                                                child: TextMix(controller
                                                    .searchResults[index]),
                                              ),
                                              onPressed: () {
                                                Get.toNamed("/details",
                                                    parameters: {
                                                      'package': controller
                                                          .searchResults[index]
                                                    });
                                              },
                                            ),
                                      if (index <
                                          controller.searchResults.length - 1)
                                        Box(
                                          mix: Mix(
                                            width(double.infinity),
                                            height(1),
                                            bgColor(MainMix.primary),
                                          ),
                                        )
                                    ],
                                  )),
                        ),
                      )
                    : const SizedBox.shrink()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
