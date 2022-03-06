import 'package:flutter/material.dart';

// BEGIN codelabsDialogDemo

class DialogDemo extends StatelessWidget {
  const DialogDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        GeneralDialogButton(),
        Divider(
          thickness: 15,
        ),
        MenuButton(),
        SearchButton(),
        Divider(
          thickness: 15,
        ),
        ModalBottomSheetButton(),
        BottomSheetButton(),
        Divider(
          thickness: 15,
        ),
        AboutButton(),
      ],
    );
  }
}

class AboutButton extends StatelessWidget {
  const AboutButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => showAboutDialog(
          context: context,
          applicationIcon: const FlutterLogo(size: 80,),
          // Image.asset(
          //   'assets/logo/flutter_logo_color.png',
          //   package: 'flutter_gallery_assets',
          // ),
          applicationName: 'Flutter示例',
          applicationVersion: '2.9.3',
          applicationLegalese: '© flutter.dev'),
      child: const Text('showAboutDialog'),
    );
  }
}

class ModalBottomSheetButton extends StatelessWidget {
  const ModalBottomSheetButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => showModalBottomSheet<void>(
        context: context,
        constraints: const BoxConstraints(minHeight: 300, maxHeight: 300),
        builder: (context) => Material(
          child: ListView.custom(
            childrenDelegate: SliverChildListDelegate([
              const ListTile(onTap: null, title: Text('menu1')),
              const ListTile(onTap: null, title: Text('menu2')),
              const Divider(
                thickness: 15,
              ),
              ListTile(
                  title: const Text('close'),
                  onTap: () => Navigator.of(context).pop()),
            ]),
          ),
        ),
      ),
      child: const Text('showModalBottomSheet'),
    );
  }
}

class BottomSheetButton extends StatelessWidget {
  const BottomSheetButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => showBottomSheet<void>(
        context: context,
        constraints: const BoxConstraints(minHeight: 300, maxHeight: 300),
        builder: (context) => Material(
          color: Colors.white,
          child: ListView.custom(
            childrenDelegate: SliverChildListDelegate([
              const ListTile(onTap: null, title: Text('menu1')),
              const ListTile(onTap: null, title: Text('menu2')),
              const Divider(
                thickness: 10,
              ),
              ListTile(
                  title: const Text('close'),
                  onTap: () => Navigator.of(context).pop()),
            ]),
          ),
        ),
      ).closed.whenComplete(() => ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('弹窗关闭')))),
      child: const Text('showBottomSheet'),
    );
  }
}

class GeneralDialogButton extends StatelessWidget {
  const GeneralDialogButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => showGeneralDialog<void>(
        context: context,
        pageBuilder: (context, animation, secondaryAnimation) => /* AlertDialog(title: Text('Alert!')) */Scaffold(
          appBar: AppBar(
            leading: null,
            title: const Text('通用弹窗'),
            actions: [
              IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(Icons.close))
            ],
          ),
          body: const Text('内容'),
        ),
      ),
      child: const Text('showGeneralDialog'),
    );
  }
}

class MenuButton extends StatelessWidget {
  const MenuButton({Key? key}) : super(key: key);

  RelativeRect showPosition(BuildContext context) {
    var renderBox = context.findRenderObject() as RenderBox;
    var globalPosition = renderBox.localToGlobal(Offset.zero);
    return RelativeRect.fromLTRB(globalPosition.dx, globalPosition.dy, 0, 0);
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => showMenu<int>(
        context: context,
        position: showPosition(context),
        items: [
          const PopupMenuItem(
            value: 1,
            child: Text('item1'),
          ),
          const PopupMenuItem(
            value: 2,
            child: Text('item2'),
          ),
          const PopupMenuDivider(),
          const PopupMenuItem(
            value: 3,
            child: Text('close'),
          ),
        ],
      ),
      child: const Text('showMenu'),
    );
  }
}

class SearchButton extends StatelessWidget {
  const SearchButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => showSearch<String>(
        context: context,
        delegate: CustomSearchHintDelegate(hintText: '输入关键字'),
      ),
      child: const Text('showSearch'),
    );
  }
}

class CustomSearchHintDelegate extends SearchDelegate<String> {
  CustomSearchHintDelegate({
    required String hintText,
  }) : super(
          searchFieldLabel: hintText,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.search,
        );

  @override
  Widget buildLeading(BuildContext context) => IconButton(
        icon: const Icon(Icons.navigate_before),
        onPressed: () => Navigator.of(context).pop(),
      );

  @override
  PreferredSizeWidget buildBottom(BuildContext context) {
    return const PreferredSize(
        preferredSize: Size.fromHeight(56.0), child: Text('搜索历史'));
  }

  @override
  Widget buildSuggestions(BuildContext context) => const Text('推荐');

  @override
  Widget buildResults(BuildContext context) => const Text('结果');

  @override
  List<Widget> buildActions(BuildContext context) => <Widget>[
    IconButton(
        icon: const Icon(Icons.close),
        onPressed: () => Navigator.of(context).pop(),
      )
  ];
}

// END