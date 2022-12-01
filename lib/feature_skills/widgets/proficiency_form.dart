import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_extra_fields/form_builder_extra_fields.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:pocketbase_crud/feature_skills/repositories/skills_repository.dart';

import '../models/skill_model.dart';
import 'loader_widget.dart';

typedef JsonCallback = Future<AsyncValue> Function(Map<String, dynamic>?);
final formKey = GlobalKey<FormBuilderState>();

class ProficiencyFormScaffold extends StatelessWidget {
  const ProficiencyFormScaffold({
    required this.onSubmit,
    required this.onSuccess,
    this.ignoreSkills = const [],
    super.key,
  });

  final JsonCallback onSubmit;
  final VoidCallback onSuccess;
  final Iterable<Skill> ignoreSkills;

  @override
  Widget build(BuildContext context) {
    void submit() {
      final isValidated = formKey.currentState?.saveAndValidate() ?? false;
      if (!isValidated) {
        return;
      }

      onSubmit(formKey.currentState?.value).then((ret) {
        if (ret is AsyncData) {
          onSuccess();
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(ret.asError?.error.toString() ?? "unknown error")));
        }
      });
    }

    return Dialog(
      child: SizedBox(
        width: 500,
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: ProficiencyForm(
            onSubmit: submit,
            ignoreSkills: ignoreSkills,
          ),
        ),
      ),
    );
  }
}

class ProficiencyForm extends ConsumerWidget {
  ProficiencyForm({
    required this.onSubmit,
    this.ignoreSkills = const [],
    super.key,
  });

  final VoidCallback onSubmit;
  String get submitText => "Add";
  final Iterable<Skill> ignoreSkills;

  final _dropDownKey = GlobalKey<DropdownSearchState>();
  final _searchTextController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final skills = ref.watch(skillProvider);
    final skillRepository = ref.watch(skillRepositoryProvider.notifier);

    void addSkill() async {
      final skill = Skill(name: _searchTextController.text);
      final rm = await skillRepository.create(skill);
      rm.whenData(
        (model) {
          _dropDownKey.currentState
              ?.changeSelectedItem(skill.copyWith(id: model.id));
          _dropDownKey.currentState?.closeDropDownSearch();
        },
      );
    }

    return skills.when(
        error: (error, stackTrace) => Text(error.toString()),
        loading: () => const LoaderWidget(),
        data: (skills) => FormBuilder(
              key: formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 10),
                  FormBuilderSearchableDropdown<Skill>(
                    name: "skill",
                    dropDownSearchKey: _dropDownKey,
                    items: skills,
                    itemAsString: (item) => item.name,
                    compareFn: (item1, item2) => item1 == item2,
                    filterFn: (skill, filter) =>
                        skill.name.toLowerCase().contains(filter.toLowerCase()),
                    decoration: const InputDecoration(
                      labelText: 'Select or create a skill',
                    ),
                    popupProps: PopupProps.menu(
                      showSelectedItems: true,
                      showSearchBox: true,
                      searchDelay: const Duration(milliseconds: 0),
                      disabledItemFn: (Skill skill) =>
                          ignoreSkills.contains(skill),
                      searchFieldProps: TextFieldProps(
                        controller: _searchTextController,
                        decoration: InputDecoration(
                          suffix: ElevatedButton(
                            onPressed: addSkill,
                            child: const Text("Add"),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  ElevatedButton(
                    onPressed: onSubmit,
                    child: Text(submitText),
                  )
                ],
              ),
            ));
  }
}
