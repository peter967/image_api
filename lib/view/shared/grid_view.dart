import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:image_api/controller/providers/provider.dart';

import '../../model/data_model.dart';

class GridLayout extends ConsumerWidget {
  const GridLayout(BuildContext context, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(imageProvider);
    return data.when(data: (data) {
      final List<DataModel> imageData = data.map((e) => e).toList();
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: MasonryGridView.builder(
          crossAxisSpacing: 8,
          mainAxisSpacing: 6,
          gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: imageData.length,
          itemBuilder: (context, index) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(imageData[index].downloadUrl.toString()),
            );
          },
        ),
      );
    }, error: (e, s) {
      return const Center();
    }, loading: () {
      return Container();
    });
  }
}
