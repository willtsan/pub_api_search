import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mix/mix.dart';
import 'package:pub_api_search/features/details/presentation/page/details.controller.dart';
import 'package:pub_api_search/features/details/presentation/page/details.mix.dart';
import 'package:pub_api_search/features/home/presentation/page/home.mix.dart';
import 'package:pub_api_search/main.mix.dart';

class DetailsPage extends GetView<DetailsController> {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Box(
        mix: MainMix.general,
        child: Obx(
          () => controller.isLoading.value
              ? FlexBox(
                  mix: HomeMix.flexbox,
                  direction: Axis.vertical,
                  children: [
                    CircularProgressIndicator(
                      color: MainMix.primary,
                    )
                  ],
                )
              : FlexBox(
                  mix: DetailsMix.flexbox,
                  direction: Axis.vertical,
                  children: [
                    FlexBox(
                      mix: Mix(
                        width(267),
                        height(50),
                      ),
                      direction: Axis.horizontal,
                      children: [
                        Box(
                          mix: Mix(
                            width(50),
                            height(50),
                            bgColor(Colors.transparent),
                            borderColor(MainMix.primary),
                            borderWidth(2),
                            rounded(44),
                          ),
                          child: Pressable(
                            onPressed: () => Get.back(),
                            child: IconMix(
                              Icons.arrow_back,
                              mix: Mix(
                                iconColor(MainMix.primary),
                                iconSize(21),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 11,
                    ),
                    Box(
                        mix: Mix(
                          width(267),
                          minHeight(167),
                          bgColor(const Color(0xFF171612)),
                          borderColor(MainMix.primary),
                          borderWidth(2),
                          rounded(15),
                        ),
                        child: VBox(
                          mix: Mix(
                            mainAxis(MainAxisAlignment.start),
                            crossAxis(CrossAxisAlignment.start),
                          ),
                          children: [
                            Box(
                              mix: Mix(
                                pl(22),
                                pb(9),
                                pt(13),
                              ),
                              child: TextMix(
                                controller.package!.name,
                                mix: Mix(
                                  textColor(MainMix.primary),
                                  fontSize(14),
                                  fontWeight(FontWeight.w400),
                                ),
                              ),
                            ),
                            Box(
                              mix: Mix(
                                height(1),
                                bgColor(MainMix.primary),
                              ),
                            ),
                            HBox(
                              mix: Mix(
                                mainAxis(MainAxisAlignment.spaceEvenly),
                                pt(8),
                                pb(10),
                              ),
                              children: [
                                VBox(
                                  mix: Mix(
                                    mainAxis(MainAxisAlignment.start),
                                    crossAxis(CrossAxisAlignment.start),
                                  ),
                                  children: [
                                    TextMix(
                                      controller.score!.likeCount.toString(),
                                      mix: Mix(
                                          textColor(MainMix.primary),
                                          fontSize(20),
                                          fontWeight(FontWeight.w700)),
                                    ),
                                    TextMix(
                                      "LIKES",
                                      mix: Mix(
                                        textColor(Colors.white),
                                        fontWeight(FontWeight.w400),
                                        fontSize(10),
                                      ),
                                    ),
                                  ],
                                ),
                                VBox(
                                  mix: Mix(
                                    mainAxis(MainAxisAlignment.start),
                                    crossAxis(CrossAxisAlignment.start),
                                  ),
                                  children: [
                                    TextMix(
                                      controller.score!.maxPoints.toString(),
                                      mix: Mix(
                                          textColor(MainMix.primary),
                                          fontSize(20),
                                          fontWeight(FontWeight.w700)),
                                    ),
                                    TextMix(
                                      "PUB POINTS",
                                      mix: Mix(
                                          textColor(Colors.white),
                                          fontWeight(FontWeight.w400),
                                          fontSize(10)),
                                    ),
                                  ],
                                ),
                                VBox(
                                  mix: Mix(
                                    mainAxis(MainAxisAlignment.start),
                                    crossAxis(CrossAxisAlignment.start),
                                  ),
                                  children: [
                                    TextMix(
                                      "${(controller.score!.popularityScore! * 100).floor()}%",
                                      mix: Mix(
                                          textColor(MainMix.primary),
                                          fontSize(20),
                                          fontWeight(FontWeight.w700)),
                                    ),
                                    TextMix(
                                      "POPULARITY",
                                      mix: Mix(
                                          textColor(Colors.white),
                                          fontWeight(FontWeight.w400),
                                          fontSize(10)),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Box(
                              mix: Mix(
                                height(1),
                                bgColor(MainMix.primary),
                              ),
                            ),
                            Box(
                              mix: Mix(
                                pt(14),
                                pl(19),
                                pr(10),
                                pb(6),
                              ),
                              child: TextMix(
                                controller.package!.description,
                                mix: Mix(
                                  textColor(Colors.white),
                                  fontSize(12),
                                  fontWeight(FontWeight.w400),
                                ),
                              ),
                            ),
                          ],
                        ))
                  ],
                ),
        ),
      ),
    );
  }
}
