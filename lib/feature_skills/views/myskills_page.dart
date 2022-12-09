import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pocketbase_crud/feature_skills/repositories/proficiency_repository.dart';
import 'package:pocketbase_crud/feature_skills/widgets/skillset_widget.dart';
import 'package:pocketbase_scaffold/pocketbase_scaffold.dart';

import '../provider/skillset_provider.dart';
import '../widgets/loader_widget.dart';
import '../widgets/mentor_list_widget.dart';

class MySkillsPage extends ConsumerWidget {
  static String get routeName => 'myskillset';
  static String get routeLocation => '/$routeName';

  const MySkillsPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mySkillSet = ref.watch(mySkillSetProvider);
    final me = ref.watch(authProvider.notifier).me;

    return Scaffold(
      appBar: AppBar(
        title: const Text("My Skillset"),
        actions: [
          IconButton(
              onPressed:
                  ref.read(proficiencyRepositoryProvider.notifier).getAll,
              icon: const Icon(Icons.sync))
        ],
      ),
      body: mySkillSet.when(
        data: (mySkillSet) => Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SkillSetWidget(
              mySkillSet,
              title: me.displayName,
            ),
            const Expanded(
              child: MentorListWidget(),
            )
          ],
        ),
        error: (error, stackTrace) =>
            const Center(child: Text("Unknown error occured")),
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
