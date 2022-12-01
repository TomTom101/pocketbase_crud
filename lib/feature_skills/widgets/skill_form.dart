import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../models/skill_model.dart';

typedef JsonCallback = Future<AsyncValue> Function(Map<String, dynamic>?);
final formKey = GlobalKey<FormBuilderState>();

class FormScaffold extends StatelessWidget {
  const FormScaffold({
    required this.onSubmit,
    required this.onSuccess,
    this.model,
    super.key,
  });

  final JsonCallback onSubmit;
  final VoidCallback onSuccess;
  final Skill? model;

  @override
  Widget build(BuildContext context) {
    void submit() {
      final isValidated = formKey.currentState?.saveAndValidate() ?? false;
      if (!isValidated) {
        return;
      }

      onSubmit(formKey.currentState?.value).then((response) {
        if (response is AsyncData) {
          onSuccess();
        } else {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(response.toString())));
        }
      });
    }

    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Center(
        child: SizedBox(
          width: screenSize.width / 3,
          child: SkillForm(skill: model, onSubmit: submit),
        ),
      ),
    );
  }
}

class SkillForm extends StatelessWidget {
  const SkillForm({
    this.skill,
    Key? key,
    required this.onSubmit,
  }) : super(key: key);

  final VoidCallback onSubmit;
  final Skill? skill;

  String get submitText => skill == null ? "Add" : "Update";

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 10),
          FormBuilderTextField(
            name: "name",
            initialValue: skill?.name,
            decoration: const InputDecoration(
              label: Text("Skill name"),
            ),
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(),
            ]),
          ),
          const SizedBox(height: 40),
          ElevatedButton(
            onPressed: onSubmit,
            child: Text(submitText),
          )
        ],
      ),
    );
  }
}
