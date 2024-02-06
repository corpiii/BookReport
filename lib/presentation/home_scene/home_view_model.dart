import 'package:book_report/domain/usecase/random_advice_use_case/interface/random_advice_use_case.dart';
import 'package:book_report/presentation/home_scene/home_view_state.dart';
import 'package:book_report/presentation/home_scene/model/local_notification.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeViewModel extends StateNotifier<HomeViewState> {
  RandomAdviceUseCase _randomAdviceUseCase;

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
  })
      : _randomAdviceUseCase = randomAdviceUseCase,
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
}

extension LocalNotifiable on HomeViewModel {
  Future<void> setAlert() async {
    // noti cancel

    final dateList = [state.sundayTap, state.mondayTap, state.tuesdayTap, state.wednesdayTap,
      state.thursdayTap, state.fridayTap, state.saturdayTap];

    await LocalNotification.instance.setAlert(dateList, state.alertHour, state.alertMinutes);
  }
}
