import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pocketbase_scaffold/pocketbase_scaffold.dart';

import '../models/proficiency_model.dart';
import '../models/skill_model.dart';
import '../models/skillset_model.dart';
import '../provider/skillset_provider.dart';
import '../repositories/proficiency_repository.dart';
import 'proficiency_form.dart';
import 'skill_slider_widget.dart';

class SkillSetWidget extends ConsumerStatefulWidget {
  const SkillSetWidget(
    this.skillSet, {
    required this.title,
    this.actions,
    this.readOnly = false,
    Key? key,
  }) : super(key: key);

  final SkillSet skillSet;
  final String title;
  final List<Widget>? actions;
  final bool readOnly;
  static double widthPerSlider = 73;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SkillSetWidgetState();
}

class _SkillSetWidgetState extends ConsumerState<SkillSetWidget> {
  bool isEditMode = false;

  @override
  void initState() {
    super.initState();
    isEditMode = widget.skillSet.proficiencies.isEmpty ? true : false;
  }

  @override
  Widget build(BuildContext context) {
    Future<AsyncValue<RecordModel>> addProficiency(
      User user,
      Map<String, dynamic>? data,
    ) =>
        ref
            .read(proficiencyRepositoryProvider.notifier)
            .create(Proficiency(user: user, skill: data?['skill'], level: 5));

    return Card(
      elevation: 5,
      shadowColor: Colors.black,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Text(widget.title,
                      style: Theme.of(context).textTheme.headline6),
                ),
                if (widget.actions != null)
                  Wrap(spacing: 10, children: widget.actions!),
                if (!widget.readOnly) editButton(context)
              ],
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              if (widget.skillSet.proficiencies.isNotEmpty)
                ...widget.skillSet.proficiencies.map(
                  (Proficiency proficiency) => ProficiencyWidget(
                    proficiency,
                    readOnly: !isEditMode,
                  ),
                ),
              if (widget.skillSet.proficiencies.isEmpty) addSkillCTA(),
              if (isEditMode)
                IconButton(
                  onPressed: () => showDialog(
                    context: context,
                    builder: (context) => ProficiencyFormScaffold(
                        ignoreSkills:
                            widget.skillSet.proficiencies.map((e) => e.skill),
                        onSubmit: (data) =>
                            addProficiency(widget.skillSet.user, data),
                        onSuccess: () => Navigator.of(context).pop()),
                  ),
                  icon: const Icon(
                    Icons.add_circle,
                    color: Colors.blue,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }

  Padding addSkillCTA() {
    return const Padding(
      padding: EdgeInsets.all(25.0),
      child: Text("Click + to add your first skill"),
    );
  }

  ButtonStyleButton editButton(BuildContext context) {
    void onPressed() => setState(() => isEditMode = !isEditMode);
    return isEditMode
        ? ElevatedButton(onPressed: onPressed, child: const Text("Done"))
        : OutlinedButton(onPressed: onPressed, child: const Text("Edit"));
  }
}

class ProficiencyWidget extends ConsumerStatefulWidget {
  const ProficiencyWidget(
    this.proficiency, {
    this.readOnly = false,
    Key? key,
  }) : super(key: key);

  final Proficiency proficiency;
  final bool readOnly;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ProficiencyWidgetState();
}

class _ProficiencyWidgetState extends ConsumerState<ProficiencyWidget> {
  double? level;
  @override
  void initState() {
    level = widget.proficiency.level;
    super.initState();
  }

  Widget skillName(Skill skill, {TextStyle? style}) {
    return RotatedBox(
        quarterTurns: -1,
        child: Text(
          skill.name,
          style: style,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => ref.read(activeProficiencyProvider.notifier).state =
          widget.proficiency,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxHeight: 400),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 2,
              child: skillName(widget.proficiency.skill),
            ),
            Flexible(
              // fit: FlexFit.tight,
              child: levelText("$level",
                  style: Theme.of(context).textTheme.headline4),
            ),
            Flexible(
              flex: 4,
              child: ProficiencySlider(
                  readOnly: widget.readOnly,
                  widget.proficiency,
                  onChange: (Proficiency p) => ref
                      .read(proficiencyRepositoryProvider.notifier)
                      .update(p),
                  onDragging: (l) => setState(
                        () => level = l - 1,
                      )),
            ),
            if (!widget.readOnly)
              Flexible(
                child: IconButton(
                    iconSize: 20,
                    icon: const Icon(Icons.delete_sharp),
                    color: Colors.grey[600],
                    onPressed: () => ref
                        .read(proficiencyRepositoryProvider.notifier)
                        .delete(widget.proficiency.id!)),
              )
          ],
        ),
      ),
    );
  }

  Widget levelText(String level, {TextStyle? style}) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: Text(level, style: style),
    );
  }
}

class ToggleStack extends StatefulWidget {
  /// Switch between primary and secondary widget on mouseover
  /// set [enable] to false to disable the toggling
  const ToggleStack({
    required this.primary,
    required this.secondary,
    this.enable = true,
    super.key,
  });

  final bool enable;
  final Widget primary;
  final Widget secondary;

  @override
  State<ToggleStack> createState() => _ToggleStackState();
}

class _ToggleStackState extends State<ToggleStack> {
  bool firstVisible = true;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
        child: firstVisible ? widget.primary : widget.secondary,
        onEnter: (event) => setState(() {
              firstVisible = widget.enable ? !firstVisible : true;
            }),
        onExit: (event) => setState(() {
              firstVisible = widget.enable ? !firstVisible : true;
            }));
  }
}
