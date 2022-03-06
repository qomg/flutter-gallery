import 'package:flutter/material.dart';

// BEGIN codelabsLayoutDemo

class LayoutDemo extends StatelessWidget {
  const LayoutDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Stack(children: [
      const MatchParentContainer(),
      Positioned(
        top: 80,
        width: size.width,
        height: 400,
        child: const ColumnRow(),
      ),
      const Positioned(
        top: 0,
        left: 0,
        child: Text('top-left'),
      ),
      const Positioned(
        bottom: 0,
        left: 0,
        child: Text('bottom-left'),
      ),
      const Positioned(
        top: 0,
        right: 0,
        child: Text('top-right'),
      ),
      const Positioned(
        bottom: 0,
        right: 0,
        child: Text('bottom-right'),
      ),
      const Align(
        child: CenterText(),
      ),
    ]);
  }
}

class MatchParentContainer extends StatelessWidget {
  const MatchParentContainer({Key? key, this.child}) : super(key: key);

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: double.maxFinite,
      color: Colors.grey[400],
      child: child,
    );
  }
}

class MyTextButton extends StatelessWidget {
  const MyTextButton({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text);
  }
}

class CenterText extends StatelessWidget {
  const CenterText({Key? key}) : super(key: key);

  void showOverlay(BuildContext context) {
    var renderBox = context.findRenderObject() as RenderBox;
    var globalPosition = renderBox.localToGlobal(Offset.zero);
    var top = globalPosition.dy + renderBox.paintBounds.height;
    OverlayEntry? entry;
    entry = OverlayEntry(
      builder: (context) => ListOverlay(
        top: top,
        close: () => entry?.remove(),
      ),
    );
    Overlay.of(context)?.insert(entry);
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: const Text('center'),
      onPressed: () => showOverlay(context),
    );
  }
}

class ListOverlay extends StatelessWidget {
  const ListOverlay({
    Key? key,
    required this.top,
    required this.close,
  }) : super(key: key);

  final double top;
  final VoidCallback close;

  Widget itemBuilder(BuildContext context, int index) {
    return Material(
      child: ListTile(
        title: Text(index == 4 ? 'close' : 'Item $index'),
        onTap: () {
          if (index == 4) {
            close();
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var left = (MediaQuery.of(context).size.width - 300) / 2;
    return Positioned(
      top: top,
      left: left,
      width: 300,
      height: 300,
      child: DraggableScrollableSheet(
        builder: (context, scrollController) {
          return Container(
            color: Colors.blue[100],
            child: ListView.builder(
              controller: scrollController,
              itemCount: 5,
              itemBuilder: itemBuilder,
            ),
          );
        },
      ),
    );
  }
}

class ColumnRow extends StatelessWidget {
  const ColumnRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Row/Column + SizedBox + Spacer + Expanded
    // Flexiable + Flex + Expanded
    return Row(
      children: [
        Column(
          children: [
            Container(width: 50, height: 50, color: Colors.yellow),
            const Spacer(),
            Container(width: 50, height: 100, color: Colors.yellow),
            const Spacer(
              flex: 2,
            ),
          ],
        ),
        SizedBox(
          width: 15,
          child: Container(
            color: Colors.pink,
          ),
        ),
        Column(
          children: [
            Expanded(
                child: Container(
              width: 40,
              color: Colors.black,
            )),
            Container(width: 50, height: 50, color: Colors.green),
          ],
        ),
        Flexible(
          child: Container(height: 400, color: Colors.blue),
        ),
      ],
    );
  }
}

// END