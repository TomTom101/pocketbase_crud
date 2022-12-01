import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/proficiency_model.dart';
import 'package:pocketbase_scaffold/pocketbase_scaffold.dart';

final proficiencyRepositoryProvider = StateNotifierProvider<
    ProficiencyRepository<Proficiency>, AsyncValue<List<Proficiency>>>((ref) {
  return ProficiencyRepository<Proficiency>(
      ref.read(collectionServiceProvider("userskill")));
});

class ProficiencyRepository<T extends BaseModel>
    extends PocketbaseRepository<T> {
  ProficiencyRepository(RecordService recordService) : super(recordService) {
    relations = ['user', 'skill'];
    getAll();
  }

  int getItemCount() => state.asData?.value.length ?? 0;

  @override
  Future<void> getAll({bool loading = true}) async {
    if (loading) state = const AsyncLoading();

    final profMap = await getAsMap();
    final items = profMap.map((e) => Proficiency.fromJson(e));
    state = AsyncData(items.toList() as List<T>);
  }
}
