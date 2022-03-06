library codelabs;

import 'extensions.dart';

export 'extensions.dart' show HttpResponseMapper;
export 'func.dart' show FirstOrNull, downloadFile;

part 'model_one.dart';

const runtimeEnv = int.fromEnvironment('app.runtime.env');
const runtimeDevelop = bool.fromEnvironment('app.runtime.develop');
const runtimeFlavor = String.fromEnvironment('app.runtime.flavor');

const hasRuntimeFlavor = bool.hasEnvironment('app.runtime.flavor');