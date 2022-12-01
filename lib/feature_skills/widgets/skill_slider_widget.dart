import 'package:another_xlider/another_xlider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/proficiency_model.dart';

// final levelProvider = StateProvider<double>((ref) => 0.0);
final draggedProficiencyProvider = StateProvider<String>((ref) => '');
final currentProficiencyLevelProvider = StateProvider<double?>((ref) => null);

class ProficiencySlider extends ConsumerStatefulWidget {
  const ProficiencySlider(
    this.proficiency, {
    required this.readOnly,
    required this.onChange,
    this.color = const Color(0xff2196F3),
    Key? key,
  }) : super(key: key);

  final Proficiency proficiency;
  final bool readOnly;
  final Color color;
  final Function(Proficiency) onChange;

  @override
  ConsumerState<ProficiencySlider> createState() => _ProficiencySliderState();
}

class _ProficiencySliderState extends ConsumerState<ProficiencySlider> {
  double? level;
  bool isActive = false;

  @override
  Widget build(BuildContext context) {
    return FlutterSlider(
      min: 0,
      max: 11,
      jump: true,
      ignoreSteps: [FlutterSliderIgnoreSteps(from: -1, to: 0)],
      axis: Axis.vertical,
      disabled: widget.readOnly,
      tooltip: FlutterSliderTooltip(disabled: true),
      handler: sliderHandler(),
      trackBar: sliderTrackBar(isActive),
      // fixedValues: FlutterSliderFixedValue()
      values: [level ?? widget.proficiency.level.toDouble() + 1],
      onDragStarted: onDragStarted,
      onDragging: onDragging,
      onDragCompleted: onDragCompleted,
    );
  }

  onDragStarted(i, l, h) {
    if (widget.readOnly) return;
    setState(() => isActive = !isActive);
    ref.read(draggedProficiencyProvider.notifier).state =
        widget.proficiency.id ?? '';
  }

  onDragging(i, l, h) {
    ref.read(currentProficiencyLevelProvider.notifier).state = l;
    setState(() => level = l);
  }

  onDragCompleted(_, l, __) {
    if (widget.readOnly) return;
    setState(() => isActive = !isActive);
    widget.onChange(widget.proficiency.copyWith(level: l - 1));
  }

  FlutterSliderTrackBar sliderTrackBar(bool isActive) {
    return FlutterSliderTrackBar(
      activeTrackBarHeight: 24,
      inactiveTrackBarHeight: 1,
      activeDisabledTrackBarColor: widget.color,
      // inactiveDisabledTrackBarColor: widget.color.withOpacity(0.5),
      inactiveDisabledTrackBarColor: Colors.transparent,
      inactiveTrackBar: const BoxDecoration(color: Colors.transparent),
      activeTrackBar: BoxDecoration(
        color: widget.color,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        boxShadow: !isActive
            ? null
            : [BoxShadow(color: widget.color, spreadRadius: 2, blurRadius: 5)],
      ),
    );
  }

  FlutterSliderHandler sliderHandler() {
    return FlutterSliderHandler(
        decoration: const BoxDecoration(),
        child: const SizedBox(
          height: 24,
          width: 24,
        ));
  }
}
