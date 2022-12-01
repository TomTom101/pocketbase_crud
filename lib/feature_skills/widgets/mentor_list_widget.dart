import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pocketbase_scaffold/pocketbase_scaffold.dart';

import '../provider/skillset_provider.dart';
import 'loader_widget.dart';

class MentorListWidget extends ConsumerWidget {
  const MentorListWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final skillRanks = ref.watch(skillRankingProvider);
    final activeProficiency = ref.watch(activeProficiencyProvider);
    final me = ref.watch(authProvider.notifier).me;

    return skillRanks.when(
      data: (data) {
        if (activeProficiency == null) return const Text("Select a skill");
        final mentorList = data[activeProficiency.skill];
        if (mentorList == null) {
          return Text("No mentor for ${activeProficiency.skill.name}");
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Users with ${activeProficiency.skill.name} skills",
              style: Theme.of(context).textTheme.headline5,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: mentorList.length,
                  itemBuilder: (context, index) {
                    final item = mentorList[index];
                    return ListTile(
                      title: Text(
                        item.user == me ? "You" : item.user.username,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      trailing: Text(
                        item.level.toString(),
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    );
                  }),
            ),
          ],
        );
      },
      error: (error, stackTrace) => Text("error"),
      loading: () => const LoaderWidget(),
    );
  }
}
