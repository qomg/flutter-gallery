// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gallery/app.dart';
import 'package:flutter_gen/gen_l10n/gallery_localizations.dart';
import 'package:gallery/data/gallery_options.dart';
import 'package:gallery/pages/settings.dart';
import 'package:gallery/pages/settings_icon/icon.dart' as settings_icon;



void main() {
  testWidgets('打开GalleryApp', (tester) async {
    await tester.pumpWidget(const GalleryApp());
    expect(find.byElementType(Title), findsOneWidget);
    // expect(find.byElementType(Builder), findsOneWidget);
    // expect(find.byElementType(MaterialApp), findsOneWidget);
    // expect(find.byElementType(RootPage), findsOneWidget);
    // expect(find.text('图库'), findsNothing);
    // await tester.pumpWidget(const RootPage());
    // expect(find.byElementType(settings_icon.SettingsIcon), findsOneWidget);
    // await tester.tap(find.byElementType(settings_icon.SettingsIcon));
    // await tester.pump();
    // expect(find.text('关于 Flutter Gallery'), findsOneWidget);
    // expect(find.byIcon(Icons.info_outline), findsOneWidget);
  });
}
