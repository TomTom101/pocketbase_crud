import 'dart:math';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pocketbase_crud/feature_skills/models/proficiency_model.dart';
import 'package:pocketbase_crud/feature_skills/repositories/proficiency_repository.dart';
import 'package:pocketbase_scaffold/pocketbase_scaffold.dart';

import '../models/skill_model.dart';
import '../models/skillset_model.dart';

extension Iterables<E> on Iterable<E> {
  Map<K, List<E>> groupBy<K>(K Function(E) keyFunction) =>
      fold(<K, List<E>>{}, (Map<K, List<E>> map, E element) {
        K key = keyFunction(element);
        return map..putIfAbsent(key, () => <E>[]).add(element);
      });
}

T median<T>(List<num> a) {
  a.sort((a, b) => a.compareTo(b));
  var middle = a.length ~/ 2;
  // ignore: prefer-conditional-expressions
  if (a.length % 2 == 1) {
    return a[middle] as T;
  } else {
    return (a[middle - 1] + a[middle]) / 2.0 as T;
  }
}

enum OverallAggregateFunction {
  max,
  median,
  mean,
}

final skillSetProvider = Provider<AsyncValue<List<SkillSet>>>((ref) {
  final proficiencies = ref.watch(proficiencyRepositoryProvider);
  return proficiencies.whenData((items) {
    final grouped = items.groupBy((e) => e.user);
    final skillSets = <SkillSet>[];
    grouped.forEach((user, proficiencies) {
      proficiencies = tShaped(proficiencies);
      skillSets.add(SkillSet(user: user, proficiencies: proficiencies));
    });
    return skillSets;
  });
});

List<Proficiency> tShaped(List<Proficiency> proficiencies) {
  // proficiencies = List.from(widget.skillSet.proficiencies);
  proficiencies.sort((a, b) => a.level.compareTo(b.level));
  int splitPos = (proficiencies.length - 1) ~/ 2;
  return List.from(proficiencies.getRange(0, splitPos), growable: true)
    ..addAll(proficiencies
        .getRange(splitPos, proficiencies.length)
        .toList()
        .reversed);
}

typedef SkillRank = Map<Skill, List<Proficiency>>;

final skillRankingProvider = Provider<AsyncValue<SkillRank>>((ref) {
  final proficiencies = ref.watch(proficiencyRepositoryProvider);
  return proficiencies.whenData((items) {
    final grouped = items.groupBy((e) => e.skill);
    grouped.forEach((skill, proficiencies) =>
        proficiencies.sort((a, b) => a.level.compareTo(b.level)));
    return grouped;
  });
});

final mySkillSetProvider = Provider<AsyncValue<SkillSet>>((ref) {
  final skillSets = ref.watch(skillSetProvider);
  final me = ref.watch(authProvider.notifier).me;
  return skillSets.whenData(
    (items) => items.firstWhere(
      (skillSet) => skillSet.user == me,
      orElse: () => SkillSet(user: me, proficiencies: []),
    ),
  );
});

final groupedSkillSetProvider = Provider<AsyncValue<SkillSet>>((ref) {
  final proficiencies = ref.watch(proficiencyRepositoryProvider);
  return proficiencies.whenData((items) {
    final grouped = items.groupBy((e) => e.skill);
    final proficiencies = <Proficiency>[];

    Function(Iterable<double>) reducer;
    switch (ref.watch(groupMethodStateProvider)) {
      case OverallAggregateFunction.mean:
        reducer = (Iterable<double> value) =>
            value.reduce((a, b) => a + b) / value.length;
        break;
      case OverallAggregateFunction.max:
        reducer = (Iterable<double> value) => value.reduce(max);
        break;
      case OverallAggregateFunction.median:
      default:
        reducer = (Iterable<double> value) => median<double>(value.toList());
    }

    grouped.forEach((skill, p) {
      proficiencies.add(Proficiency(
        user: User(username: "Birds", name: ""),
        skill: skill,
        level: reducer(p.map((e) => e.level)),
      ));
    });

    return SkillSet(
      user: proficiencies.first.user,
      proficiencies: tShaped(proficiencies),
    );
  });
});

final groupMethodStateProvider = StateProvider<OverallAggregateFunction>(
    (ref) => OverallAggregateFunction.median);

final activeProficiencyProvider = StateProvider<Proficiency?>((ref) => null);
