import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/skill_model.dart';
import '../repositories/skills_repository.dart';
import 'skill_form.dart';

class SkillListWidget extends ConsumerWidget {
  const SkillListWidget(
    this.items, {
    Key? key,
  }) : super(key: key);

  final List<Skill> items;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future<AsyncValue> updateSkill(Skill skill, Map<String, dynamic>? data) =>
        ref
            .read(skillRepositoryProvider.notifier)
            .update(skill.copyWith(name: data?['name']));

    return ListView.separated(
      itemBuilder: (context, index) {
        final item = items[index];
        return ListTile(
          title: Text(item.name),
          trailing: IconButton(
            onPressed: () {
              ref.read(skillRepositoryProvider.notifier).delete(item.id!);
            },
            icon: const Icon(Icons.delete),
          ),
          onTap: () => showDialog(
              context: context,
              builder: (context) => FormScaffold(
                  model: item,
                  onSubmit: (data) => updateSkill(item, data),
                  onSuccess: () => Navigator.of(context).pop())),
        );
      },
      itemCount: items.length,
      separatorBuilder: (context, index) => const Divider(),
    );
  }
}
