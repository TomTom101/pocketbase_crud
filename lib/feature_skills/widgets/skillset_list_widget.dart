import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pocketbase_crud/feature_skills/models/proficiency_model.dart';

import '../models/skillset_model.dart';
import '../repositories/proficiency_repository.dart';

class SkillSetListWidget extends ConsumerWidget {
  const SkillSetListWidget(
    this.items, {
    Key? key,
  }) : super(key: key);

  final List<SkillSet> items;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.separated(
      itemBuilder: (context, index) {
        final item = items[index];
        return ListTile(
            title: Text(item.user.username),
            subtitle: Column(
              children: [
                if (item.proficiencies.isNotEmpty)
                  ...item.proficiencies
                      .map(
                        (p) => ProficiencySliderWidget(p),
                      )
                      .toList()
              ],
            ));
      },
      itemCount: items.length,
      separatorBuilder: (context, index) => const Divider(),
    );
  }
}

class ProficiencySliderWidget extends ConsumerStatefulWidget {
  const ProficiencySliderWidget(
    this.p, {
    super.key,
  });

  final Proficiency p;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ProficiencySliderWidgetState();
}

class _ProficiencySliderWidgetState
    extends ConsumerState<ProficiencySliderWidget> {
  double? _value;

  @override
  void initState() {
    _value = widget.p.level;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Flexible(
          flex: 1,
          fit: FlexFit.tight,
          child: Text(widget.p.skill.name),
        ),
        Flexible(
          flex: 4,
          child: Slider(
            divisions: 10,
            label: _value.toString(),
            min: 0,
            max: 10,
            value: _value ?? widget.p.level,
            onChanged: (level) => setState(() {
              _value = level.roundToDouble();
            }),
            onChangeEnd: ((value) => ref
                .read(proficiencyRepositoryProvider.notifier)
                .update(widget.p.copyWith(level: _value!))),
          ),
        ),
      ],
    );
  }
}
