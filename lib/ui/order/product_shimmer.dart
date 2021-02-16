// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:shimmer/shimmer.dart';

// Project imports:
import 'package:asapdemo/ui/helpers/color_palette.dart';
import 'package:asapdemo/ui/shared/custom_divider.dart';

class ProductShimmer extends StatelessWidget {
  const ProductShimmer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    const _sizedBox = SizedBox(
      height: 10,
    );
    final _greyContainer = Container(
        height: 10,
        width: size.width,
        decoration: BoxDecoration(
            color: ColorPalette.greyContainer(),
            borderRadius: const BorderRadius.all(Radius.circular(20))));
    final _wList = [_sizedBox, _greyContainer];
    return Shimmer.fromColors(
        highlightColor: Colors.white,
        baseColor: ColorPalette.shimmerBaseColor(),
        child: Container(
          width: size.width,
          margin: EdgeInsets.symmetric(horizontal: size.width * 0.08),
          child: ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index) => Column(
              children: [
                ..._wList,
                ..._wList,
                ..._wList,
                ..._wList,
                const CustomDivider(),
              ],
            ),
          ),
        ));
  }
}
