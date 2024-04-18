import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

Future<void> testExecutable(FutureOr<void> Function() testMain) async {
  return GoldenToolkit.runWithConfiguration(
    () async {
      await loadAppFonts();
      await testMain();
    },
    config: GoldenToolkitConfiguration(
      defaultDevices: const [
        // Device(size: Size(390, 667), name: 'SE'),
        Device(size: Size(414, 736), name: '8 plus'),
        Device(size: Size(393, 852), name: '15'),
        Device(size: Size(393, 852), name: '15 Pro'),
        Device(size: Size(430, 932), name: '15 Pro Max'),
        Device(size: Size(412, 1004), name: 'Galaxy Z Flip5'),
      ],
      skipGoldenAssertion: () => !Platform.isMacOS,
    ),
  );
}
