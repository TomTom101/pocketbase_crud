import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/skillset_provider.dart';
import 'loader_widget.dart';
import 'skillset_widget.dart';

class OverallAggregateSelector extends ConsumerWidget {
  const OverallAggregateSelector(
    this.label, {
    required this.method,
    Key? key,
  }) : super(key: key);

  final String label;
  final OverallAggregateFunction method;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ChoiceChip(
      label: Text(label),
      selectedColor: Colors.blue,
      selected: ref.watch(groupMethodStateProvider) == method,
      onSelected: (_) =>
          ref.read(groupMethodStateProvider.notifier).state = method,
    );
  }
}

class GroupedSkillSetWidget extends ConsumerWidget {
  const GroupedSkillSetWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final groupedSkillSet = ref.watch(groupedSkillSetProvider);

    const actions = [
      OverallAggregateSelector("Max", method: OverallAggregateFunction.max),
      OverallAggregateSelector("Median",
          method: OverallAggregateFunction.median),
      OverallAggregateSelector("Mean", method: OverallAggregateFunction.mean)
    ];

    return groupedSkillSet.when<Widget>(
        data: ((data) => SkillSetWidget(
              data,
              title: "BoM",
              actions: actions,
              readOnly: true,
            )),
        error: ((error, stackTrace) => Text(error.toString())),
        loading: (() => const LoaderWidget()));
  }
}
