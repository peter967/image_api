import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_api/controller/services/api.dart';

final provider = Provider((_) => Api());
final imageProvider = FutureProvider(
  (ref) async => ref.watch(provider).getData(),
);
