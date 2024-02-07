import 'package:book_report/domain/model/book.dart';
import 'package:book_report/domain/usecase/random_advice_use_case/interface/random_advice_use_case.dart';
import 'package:book_report/presentation/home_scene/home_view_state.dart';
import 'package:book_report/presentation/home_scene/model/day.dart';
import 'package:book_report/presentation/home_scene/model/local_notification.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeViewModel extends StateNotifier<HomeViewState> {
  RandomAdviceUseCase _randomAdviceUseCase;
  void Function()? clearDelegate;
  final SharedPreferences _prefs;

  HomeViewModel({
    required RandomAdviceUseCase randomAdviceUseCase,
    required SharedPreferences prefs,
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
        _prefs = prefs,
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
    final comment = _setNotificationComment(dateList, state.alertHour, state.alertMinutes);
    state = state.copyWith(notificationComment: comment);

    _prefs.setBool('sundayTap', dateList[0]);
    _prefs.setBool('mondayTap', dateList[1]);
    _prefs.setBool('tuesdayTap', dateList[2]);
    _prefs.setBool('wednesdayTap', dateList[3]);
    _prefs.setBool('thursdayTap', dateList[4]);
    _prefs.setBool('fridayTap', dateList[5]);
    _prefs.setBool('saturdayTap', dateList[6]);
    _prefs.setInt('alertHour', state.alertHour);
    _prefs.setInt('alertMinutes', state.alertMinutes);
    _prefs.setString('notificationComment', comment);
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

  String _setNotificationComment(List<bool> dateList, int alertHour, int alertMinutes) {
    List<String> daysOfWeek = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    final padMinutes = '$alertMinutes'.padLeft(2, '0');
    String dayComment;
    String timeComment = '$alertHour : $padMinutes';

    final newDateList = [...dateList];
    final firstItem = newDateList.removeAt(0);
    newDateList.add(firstItem);

    final List<String> result = [];

    for (int i = 0; i < newDateList.length; i++) {
      if (newDateList[i]) {
        result.add(daysOfWeek[i]);
      }
    }

    if (result.isEmpty) {
      return 'Empty Alert';
    } else if (result.length == 7) {
      dayComment = 'Every day';
    } else if (result.length == 1) {
      dayComment = 'Every ${result[0]}';
    } else if (result.length == 2) {
      if (result[0] == 'Sat' && result[1] == 'Sun') {
        dayComment = 'Weekends';
      } else {
        dayComment = '${result[0]} and ${result[1]}';
      }
    } else {
      if (result.length == 5 && result[0] == daysOfWeek[0]
          && result[1] == daysOfWeek[1] && result[2] == daysOfWeek[2]
          && result[3] == daysOfWeek[3] && result[4] == daysOfWeek[4]) {
        dayComment = 'Weekdays';
      } else {
        String resultString = result.sublist(0, result.length - 1).join(', ');
        resultString += ' and ${result.last}';
        dayComment = resultString;
      }
    }

    return '$dayComment $timeComment';
  }

  void addLastBook(Book item) {
    final bookList = [...state.lastBooks];

    if (bookList.length == 5) {
      bookList.removeLast();
    }

    bookList.removeWhere((element) => element.id == item.id);
    bookList.insert(0, item);
    state = state.copyWith(lastBooks: bookList);
  }

  void deleteAccount() {
    state = state.copyWith(lastBooks: []);
  }
}