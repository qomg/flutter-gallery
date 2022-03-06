import 'dart:math' as math;
import 'package:flutter/material.dart';

// BEGIN codelabsWidgetDemo

class WidgetDemo extends StatelessWidget {
  const WidgetDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      children: const [
        AdaptiveWidget(),
        TransformLogo(),
        PreviewImage(),
        AnimationColorBlock(),
      ],
    );
  }
}

class AdaptiveWidget extends StatelessWidget {
  const AdaptiveWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Switch(value: true, onChanged: null),
        Switch.adaptive(value: true, onChanged: null),
        CircularProgressIndicator(),
        CircularProgressIndicator.adaptive(),
      ],
    );
  }
}

class TransformLogo extends StatelessWidget {
  const TransformLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        Transform.translate(
          offset: const Offset(20, 0),
          child: const CraneLogo(),
        ),
        const SizedBox(
          width: 5,
        ),
        Transform.scale(scale: 0.5, child: const CraneLogo()),
        const SizedBox(
          width: 20,
        ),
        Transform.rotate(
          angle: /*弧度*/ math.pi / 2,
          child: const CraneLogo(),
        ),
        Transform(
          transform: Matrix4.identity()
            ..translate(20.0, -10.0)
            ..scale(0.5)
            ..rotateZ(math.pi / 2),
          child: const CraneLogo(),
        )
      ],
    );
  }
}

class CraneLogo extends StatelessWidget {
  const CraneLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'crane/logo/outline_logo.png',
      package: 'flutter_gallery_assets',
      width: 80,
      height: 150,
      fit: BoxFit.fill,
    );
  }
}

// 大图/小图
class PreviewImage extends StatefulWidget {
  const PreviewImage({Key? key}) : super(key: key);

  @override
  _PreviewImageState createState() => _PreviewImageState();
}

class _PreviewImageState extends State<PreviewImage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: toggle,
        child: AnimatedBuilder(
          animation: _controller,
          child: const CraneLogo(),
          builder: (context, child) =>
              Transform.scale(scale: 0.4 + _controller.value, child: child),
        ));
  }

  void toggle() =>
      _controller.isDismissed ? _controller.forward() : _controller.reverse();
}

class AnimationColorBlock extends StatefulWidget {
  const AnimationColorBlock({Key? key}) : super(key: key);

  @override
  _AnimationColorBlockState createState() => _AnimationColorBlockState();
}

class _AnimationColorBlockState extends State<AnimationColorBlock> {
  int tick = 0;

  void increment() {
    setState(() {
      tick++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: increment,
        child: AnimatedContainer(
          width: tick % 2 == 0 ? 100 : 60,
          height: tick % 2 == 0 ? 100 : 60,
          decoration: BoxDecoration(
            color: tick % 2 == 0 ? Colors.red : Colors.blue,
            borderRadius:
                tick % 2 == 0 ? BorderRadius.zero : BorderRadius.circular(15),
          ),
          padding: const EdgeInsets.all(10),
          duration: const Duration(milliseconds: 250),
        ));
  }
}

// END