import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pocketbase_scaffold/pocketbase_scaffold.dart';

import '../models/skillset_model.dart';
// import 'grouped_skillset_widget.dart';
import 'skillset_widget.dart';

class SkillSetsGalleryWidget extends ConsumerWidget {
  const SkillSetsGalleryWidget(
    this.skillSets, {
    Key? key,
  }) : super(key: key);

  final List<SkillSet> skillSets;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authProvider.notifier).me;
    return SingleChildScrollView(
      child: Wrap(
        children: [
          ...skillSets.map((SkillSet skillSet) => SkillSetWidget(
                skillSet,
                readOnly: skillSet.user != user,
                title: skillSet.user.displayName,
              ))
        ],
      ),
    );
  }
}
