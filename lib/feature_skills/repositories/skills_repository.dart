import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/skill_model.dart';
import 'package:pocketbase_scaffold/pocketbase_scaffold.dart';

final skillRepositoryProvider =
    StateNotifierProvider<SkillRepository<Skill>, AsyncValue<List<Skill>>>(
        (ref) {
  return SkillRepository<Skill>(ref.read(collectionServiceProvider("skills")));
});

/// Acts as cache for loaded skills
final skillProvider = Provider<AsyncValue<List<Skill>>>(
    (ref) => ref.watch(skillRepositoryProvider).whenData((items) => items));

class SkillRepository<T extends BaseModel> extends PocketbaseRepository<T> {
  SkillRepository(RecordService recordService) : super(recordService) {
    getAll();
  }

  int getItemCount() => state.asData?.value.length ?? 0;

  @override
  Future<void> getAll({bool loading = true}) async {
    if (loading) state = const AsyncLoading();

    final map = await getAsMap();
    final items = map.map((e) => Skill.fromJson(e)).toList();
    items.sort((a, b) => a.name.compareTo(b.name));
    state = AsyncData(items as List<T>);
  }
}
