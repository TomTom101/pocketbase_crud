import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pocketbase_crud/feature_skills/widgets/skill_form.dart';
import 'package:pocketbase_scaffold/pocketbase_scaffold.dart';

import '../models/skill_model.dart';
import '../repositories/skills_repository.dart';
import '../widgets/loader_widget.dart';
import '../widgets/skill_list_widget.dart';

class SkillsPage extends ConsumerWidget {
  static String get routeName => 'skills';
  static String get routeLocation => '/$routeName';

  const SkillsPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final skillRepository = ref.watch(skillRepositoryProvider.notifier);
    final items = ref.watch(skillRepositoryProvider);
    final itemCount = skillRepository.getItemCount();
    // final user = ref.watch(authProvider.notifier).me;

    Future<AsyncValue> addSkill(Map<String, dynamic>? data) => ref
        .read(skillRepositoryProvider.notifier)
        .create(Skill(name: data?['name']));

    return Scaffold(
      appBar: AppBar(
        title: Text("Skills ($itemCount)"),
        actions: [
          IconButton(
              onPressed: () => skillRepository.getAll(),
              icon: const Icon(Icons.sync))
        ],
      ),
      body: items.when(
        data: (data) => SkillListWidget(data),
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
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => showDialog(
            context: context,
            builder: (context) => FormScaffold(
                onSubmit: (data) => addSkill(data),
                onSuccess: () => Navigator.of(context).pop())),
      ),
    );
  }
}
