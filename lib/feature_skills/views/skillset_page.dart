import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pocketbase_crud/feature_skills/repositories/proficiency_repository.dart';
import 'package:pocketbase_scaffold/pocketbase_scaffold.dart';

import '../provider/skillset_provider.dart';
import '../widgets/loader_widget.dart';
import '../widgets/skillset_gallery_widget.dart';

class SkillSetPage extends ConsumerWidget {
  static String get routeName => 'skillsets';
  static String get routeLocation => '/$routeName';

  const SkillSetPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = ref.watch(skillSetProvider);
    // final user = ref.watch(authProvider.notifier).me;
    final count = items.asData?.value.length ?? 0;

    return Scaffold(
      appBar: AppBar(
        title: Text("Skill Sets ($count)"),
        actions: [
          IconButton(
              onPressed: () =>
                  ref.read(proficiencyRepositoryProvider.notifier).getAll(),
              icon: const Icon(Icons.sync))
        ],
      ),
      body: items.when(
        data: (data) => SkillSetsGalleryWidget(data),
        error: (error, stackTrace) {
          if (error is ClientException) {
            return Center(
              child:
                  Text("Fetching items failed: ${error.response['message']}"),
            );
          }
          return const Center(child: Text("Unknown error occured"));
        },
        loading: () => const LoaderWidget(),
      ),
      // floatingActionButton: FloatingActionButton(
      //   child: const Icon(Icons.add),
      //   onPressed: () => ref.read(skillSetRepositoryProvider.notifier).create(
      //         Proficiency(
      //           user: user,
      //           skill:
      //               const Skill(id: "xqk2xt7476gbwzu", name: "A dummy skill"),
      //           level: Random().nextInt(10),
      //         ),
      //       ),
      // ),
    );
  }
}
