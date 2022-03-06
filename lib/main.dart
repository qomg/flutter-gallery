// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:dokit/dokit.dart';
import 'package:flutter/material.dart';

import 'app.dart';
import 'preset.dart';
import 'ume.dart';

enum Mode {
  normal,
  ume,
  dokit,
  compat,
}

const mode = Mode.normal;

void main() {
  startUp(() {
    switch (mode) {
      case Mode.normal:
        runApp(const GalleryApp());
        break;
      case Mode.ume:
        runApp(wrapUME(const GalleryApp()));
        break;
      case Mode.dokit:
        DoKit.runApp(
          app: DoKitApp(const GalleryApp()),
        );
        break;
      case Mode.compat:
        DoKit.runApp(
          app: DoKitApp(wrapUME(const GalleryApp())),
        );
        break;
      default:
    }
  });
}
