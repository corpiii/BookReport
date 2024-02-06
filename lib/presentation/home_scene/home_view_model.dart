import 'package:book_report/domain/usecase/random_advice_use_case/interface/random_advice_use_case.dart';
import 'package:book_report/presentation/home_scene/home_view_state.dart';
import 'package:book_report/presentation/home_scene/model/day.dart';
import 'package:book_report/presentation/home_scene/model/local_notification.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeViewModel extends StateNotifier<HomeViewState> {
  RandomAdviceUseCase _randomAdviceUseCase;
  void Function()? clearDelegate;

  HomeViewModel({
    required randomAdviceUseCase,
    String? notificationComment,
    bool? sundayTap,
    bool? mondayTap,
    bool? tuesdayTap,
    bool? wednesdayTap,
    bool? thursdayTap,
    bool? fridayTap,
    bool? saturdayTap,
    int? alertHour,
    int? alertMinutes,
  })  : _randomAdviceUseCase = randomAdviceUseCase,
        super(HomeViewState(
          notificationComment: notificationComment ?? 'Empty Alert',
          sundayTap: sundayTap ?? false,
          mondayTap: mondayTap ?? false,
          tuesdayTap: tuesdayTap ?? false,
          wednesdayTap: wednesdayTap ?? false,
          thursdayTap: thursdayTap ?? false,
          fridayTap: fridayTap ?? false,
          saturdayTap: saturdayTap ?? false,
          alertHour: alertHour ?? 0,
          alertMinutes: alertMinutes ?? 0,
        )) {
    fetchRandomAdvice();
  }

  Future<void> fetchRandomAdvice() async {
    final advice = await _randomAdviceUseCase.execute();

    state = state.copyWith(randomAdvice: advice);
  }

  Future<void> setHour(int hour) async {
    state = state.copyWith(alertHour: hour);
    await _setAlert();
  }

  Future<void> setMinutes(int minutes) async {
    state = state.copyWith(alertMinutes: minutes);
    await _setAlert();
  }

  Future<void> switchDayActive(Day day) async {
    switch (day) {
      case Day.sunday:
        state = state.copyWith(sundayTap: !state.sundayTap);
      case Day.monday:
        state = state.copyWith(mondayTap: !state.mondayTap);
      case Day.tuesday:
        state = state.copyWith(tuesdayTap: !state.tuesdayTap);
      case Day.wednesday:
        state = state.copyWith(wednesdayTap: !state.wednesdayTap);
      case Day.thursday:
        state = state.copyWith(thursdayTap: !state.thursdayTap);
      case Day.friday:
        state = state.copyWith(fridayTap: !state.fridayTap);
      case Day.saturday:
        state = state.copyWith(saturdayTap: !state.saturdayTap);
    }

    await _setAlert();
  }

  Future<void> _setAlert() async {
    await LocalNotification.instance.clearAlert();

    final dateList = [
      state.sundayTap,
      state.mondayTap,
      state.tuesdayTap,
      state.wednesdayTap,
      state.thursdayTap,
      state.fridayTap,
      state.saturdayTap
    ];

    await LocalNotification.instance.setAlert(dateList, state.alertHour, state.alertMinutes);

    // notification comment
  }

  Future<void> clearAlert() async {
    await LocalNotification.instance.clearAlert();

    state = const HomeViewState(
      notificationComment: 'Empty Alert',
      sundayTap: false,
      mondayTap: false,
      tuesdayTap: false,
      wednesdayTap: false,
      thursdayTap: false,
      fridayTap: false,
      saturdayTap: false,
      alertHour: 0,
      alertMinutes: 0,
    );
  }
}