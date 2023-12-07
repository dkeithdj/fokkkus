// import 'package:hydrated_bloc/hydrated_bloc.dart';

// class SliderValuesEvent {}

// class SliderValuesState {
//   final int focusDuration;
//   final int breakDuration;
//   final String timerState;

//   SliderValuesState({
//     required this.focusDuration,
//     required this.breakDuration,
//     required this.timerState,
//   });
// }

// class SliderValuesBloc
//     extends HydratedBloc<SliderValuesEvent, SliderValuesState> {
//   SliderValuesBloc()
//       : super(SliderValuesState(
//             focusDuration: 10, breakDuration: 5, timerState: 'focus'));

//   @override
//   SliderValuesState fromJson(Map<String, dynamic> json) {
//     return SliderValuesState(
//       focusDuration: json['focusDuration'] as int,
//       breakDuration: json['breakDuration'] as int,
//       timerState: json['timerState'] as String,
//     );
//   }

//   @override
//   Map<String, dynamic> toJson(SliderValuesState state) {
//     return {
//       'focusDuration': state.focusDuration,
//       'breakDuration': state.breakDuration,
//       'timerState': state.timerState,
//     };
//   }
// }
