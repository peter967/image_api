import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_api/controller/providers/provider.dart';
import 'package:image_api/view/shared/grid_view.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(imageProvider);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text(
            'PaTOot',
            style: TextStyle(
              color: Colors.amber,
            ),
          ),
        ),
        backgroundColor: Colors.black,
        body: data.when(
            data: (data) {
              return GridLayout(context);
            },
            error: (e, s) => null,
            loading: () => const Center(
                  child: CircularProgressIndicator(
                    color: Colors.amber,
                  ),
                )));
  }
}
