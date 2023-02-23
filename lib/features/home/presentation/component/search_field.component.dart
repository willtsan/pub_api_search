import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:pub_api_search/features/home/presentation/page/home.mix.dart';
import 'package:pub_api_search/main.mix.dart';

class SearchField extends StatefulWidget {
  final bool isClosed;
  final TextEditingController controller;
  final Function(String)? onChanged;

  const SearchField(
      {Key? key,
      required this.isClosed,
      required this.onChanged,
      required this.controller})
      : super(key: key);

  @override
  State<SearchField> createState() => SearchFieldState();
}

class SearchFieldState extends State<SearchField> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      curve: Curves.ease,
      width: widget.isClosed
          ? 54
          : MediaQuery.of(context).size.width -
              MediaQuery.of(context).size.width * .3,
      height: widget.isClosed ? 54 : 55,
      child: widget.isClosed
          ? Box(
              mix: HomeMix.box.mix(width(54), height(54)),
              child: IconMix(mix: HomeMix.icon, Icons.search),
            )
          : Box(
              mix: HomeMix.box.apply(HomeMix.textField).mix(height(55), px(16)),
              child: TextField(
                  cursorColor: MainMix.primary,
                  controller: widget.controller,
                  autofocus: true,
                  style: TextStyle(color: MainMix.primary),
                  decoration: const InputDecoration(
                    disabledBorder: InputBorder.none,
                    border: InputBorder.none,
                    errorBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    focusedErrorBorder: InputBorder.none,
                  ),
                  onChanged: widget.onChanged),
            ),
    );

    // return Box(
    //     mix: MainMix.box.apply(MainMix.textField), child: const TextField());

    // return AnimatedCrossFade(
    //     firstChild: Pressable(
    //       child: Box(
    //         mix: MainMix.box.mix(width(54), height(54)),
    //         child: IconMix(mix: MainMix.icon, Icons.search),
    //       ),
    //       onPressed: () {
    //         setState(() {
    //           _isTextFieldShown = true;
    //         });
    //       },
    //     ),
    //     secondChild: Box(
    //         mix: MainMix.box.apply(MainMix.textField),
    //         child: const TextField()),
    //     crossFadeState: !_isTextFieldShown
    //         ? CrossFadeState.showFirst
    //         : CrossFadeState.showSecond,
    //     duration: const Duration(seconds: 500));
    // return AnimatedSwitcher(
    //   duration: const Duration(
    //     milliseconds: 500,
    //   ),
    //   transitionBuilder: (child, animation) => ScaleTransition(
    //     scale: animation,
    //     child: child,
    //   ),
    //   switchInCurve: Curves.ease,
    //   switchOutCurve: Curves.fastOutSlowIn,
    //   child: _isTextFieldShown
    //       ? Box(mix: MainMix.box, child: const TextField())
    //       : Pressable(
    //           child: Box(
    //             mix: MainMix.box.mix(width(54), height(54)),
    //             child: IconMix(mix: MainMix.icon, Icons.search),
    //           ),
    //           onPressed: () {
    //             setState(() {
    //               _isTextFieldShown = true;
    //             });
    //           },
    //         ),
    // );
  }
}
