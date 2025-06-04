import 'package:get/get.dart';

import '../modules/Event_page/bindings/event_page_binding.dart';
import '../modules/Event_page/views/event_page_view.dart';
import '../modules/Home_page/bindings/home_page_binding.dart';
import '../modules/Home_page/views/home_page_view.dart';
import '../modules/Network_page/bindings/network_page_binding.dart';
import '../modules/Network_page/views/network_page_view.dart';
import '../modules/Network_search_page/bindings/network_search_page_binding.dart';
import '../modules/Network_search_page/views/network_search_page_view.dart';
import '../modules/agenda_book_meeting/bindings/agenda_book_meeting_binding.dart';
import '../modules/agenda_book_meeting/views/agenda_book_meeting_view.dart';
import '../modules/agenda_screen/bindings/agenda_screen_binding.dart';
import '../modules/agenda_screen/views/agenda_screen_view.dart';
import '../modules/agenda_talk_detail/bindings/agenda_talk_detail_binding.dart';
import '../modules/agenda_talk_detail/views/agenda_talk_detail_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login_page/bindings/login_page_binding.dart';
import '../modules/login_page/views/login_page_view.dart';
import '../modules/otpverification/bindings/otpverification_binding.dart';
import '../modules/otpverification/views/otpverification_view.dart';
import '../modules/profile_agenda/bindings/profile_agenda_binding.dart';
import '../modules/profile_agenda/views/profile_agenda_view.dart';
import '../modules/profile_bookmark/bindings/profile_bookmark_binding.dart';
import '../modules/profile_bookmark/views/profile_bookmark_view.dart';
import '../modules/profile_page/bindings/profile_page_binding.dart';
import '../modules/profile_page/views/profile_page_view.dart';
import '../modules/search_screen/bindings/search_screen_binding.dart';
import '../modules/search_screen/views/search_screen_view.dart';
import '../modules/signup_page/bindings/signup_page_binding.dart';
import '../modules/signup_page/views/signup_page_view.dart';
import '../modules/splash_screen/bindings/splash_screen_binding.dart';
import '../modules/splash_screen/views/splash_screen_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH_SCREEN;

  static final routes = [
    GetPage(name: _Paths.HOME, page: () => HomeView(), binding: HomeBinding()),
    GetPage(
      name: _Paths.LOGIN_PAGE,
      page: () => LoginPageView(),
      binding: LoginPageBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH_SCREEN,
      page: () => MyWidget(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: _Paths.OTPVERIFICATION,
      page: () => OtpverificationView(),
      binding: OtpverificationBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP_PAGE,
      page: () => const SignupPageView(),
      binding: SignupPageBinding(),
    ),
    GetPage(
      name: _Paths.EVENT_PAGE,
      page: () => const EventPageView(),
      binding: EventPageBinding(),
    ),
    GetPage(
      name: _Paths.HOME_PAGE,
      page: () => HomePageView(),
      binding: HomePageBinding(),
    ),
    GetPage(
      name: _Paths.SEARCH_SCREEN,
      page: () => const SearchScreenView(),
      binding: SearchScreenBinding(),
    ),
    GetPage(
      name: _Paths.NETWORK_PAGE,
      page: () => NetworkPageView(),
      binding: NetworkPageBinding(),
    ),
    GetPage(
      name: _Paths.NETWORK_SEARCH_PAGE,
      page: () => NetworkSearchPageView(),
      binding: NetworkSearchPageBinding(),
    ),
    GetPage(
      name: _Paths.AGENDA_SCREEN,
      page: () => AgendaScreenView(),
      binding: AgendaScreenBinding(),
    ),
    GetPage(
      name: _Paths.AGENDA_TALK_DETAIL,
      page: () => AgendaTalkDetailView(),
      binding: AgendaTalkDetailBinding(),
    ),
    GetPage(
      name: _Paths.AGENDA_BOOK_MEETING,
      page: () => const AgendaBookMeetingView(),
      binding: AgendaBookMeetingBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE_PAGE,
      page: () => const ProfilePageView(),
      binding: ProfilePageBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE_BOOKMARK,
      page: () => ProfileBookmarkView(),
      binding: ProfileBookmarkBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE_AGENDA,
      page: () =>  ProfileAgendaView(),
      binding: ProfileAgendaBinding(),
    ),
  ];
}
