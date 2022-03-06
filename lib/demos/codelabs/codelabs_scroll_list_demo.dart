import 'package:flutter/material.dart';

// BEGIN codelabsScrollListDemo

class ScrollListDemo extends StatelessWidget {
  const ScrollListDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(slivers: [
        const SliverAppBar(
          title: Text('滚动列表'),
        ),
        SliverList(
            delegate: SliverChildBuilderDelegate(
                (context, index) => ListTile(title: Text('$index')),
                childCount: 50)),
      ]),
    );
  }
}

// END