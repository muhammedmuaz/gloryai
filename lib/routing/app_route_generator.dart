import 'package:flutter/material.dart';
import 'package:gloryai/routing/app_route_names.dart';
import 'package:gloryai/screens/devotional_screen.dart';
import 'package:gloryai/screens/home_screen2.dart';
import 'package:gloryai/screens/intro/intro_age_group_screen.dart';
import 'package:gloryai/screens/intro/intro_always_together_screen.dart';
import 'package:gloryai/screens/intro/intro_beginning_screen.dart';
import 'package:gloryai/screens/intro/intro_daily_guided_screen.dart';
import 'package:gloryai/screens/intro/intro_daily_sacred_screen.dart';
import 'package:gloryai/screens/intro/intro_demo_screen.dart';
import 'package:gloryai/screens/intro/intro_devotional_screen.dart';
import 'package:gloryai/screens/intro/intro_embark_sacred_screen.dart';
import 'package:gloryai/screens/intro/intro_gender_select_screen.dart';
import 'package:gloryai/screens/intro/intro_how_best_glory_support_screen.dart';
import 'package:gloryai/screens/intro/intro_illuminate_sprit_screen.dart';
import 'package:gloryai/screens/intro/intro_login_screen.dart';
import 'package:gloryai/screens/intro/intro_loving_god_screen.dart';
import 'package:gloryai/screens/intro/intro_multiple_choice_screen.dart';
import 'package:gloryai/screens/intro/intro_never_miss_daily_screen.dart';
import 'package:gloryai/screens/intro/intro_quote_2_screen.dart';
import 'package:gloryai/screens/intro/intro_quote_screen.dart';
import 'package:gloryai/screens/intro/intro_quotes_slider_screen.dart';
import 'package:gloryai/screens/intro/intro_rating2_screen.dart';
import 'package:gloryai/screens/intro/intro_rating_screen.dart';
import 'package:gloryai/screens/intro/intro_screen.dart';
import 'package:gloryai/screens/intro/intro_scripture2_screen.dart';
import 'package:gloryai/screens/intro/intro_scripture_screen.dart';
import 'package:gloryai/screens/intro/intro_tradition_select_screen.dart';
import 'package:gloryai/screens/intro/intro_where_find_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // Splash
      case AppRoutesNames.initial:
        return _screenRoute(screen: const IntroScreen());
      case AppRoutesNames.introRatingScreen:
        return _screenRoute(screen: const IntroRatingScreen());  
      case AppRoutesNames.introQuoteScreen:
        return _screenRoute(screen: const IntroQuoteScreen());   
      case AppRoutesNames.introWhereFindScreen:
        return _screenRoute(screen: const IntroWhereFindScreen());
      case AppRoutesNames.introAlwaysTogetherScreen:
        return _screenRoute(screen: const IntroAlwaysTogetherScreen());
      case AppRoutesNames.introGenderSelectScreen:
        return _screenRoute(screen: const IntroGenderSelectScreen());
      case AppRoutesNames.introTraditionSelectScreen:
        return _screenRoute(screen: const IntroTraditionSelectScreen());
      case AppRoutesNames.introScriptureScreen:
        return _screenRoute(screen: const IntroScriptureScreen()); 
      case AppRoutesNames.introQuote2Screen:
        return _screenRoute(screen: const IntroQuote2Screen());
      case AppRoutesNames.introScripture2Screen:
        return _screenRoute(screen: const IntroScripture2Screen());
      case AppRoutesNames.introDemoScreen:
        return _screenRoute(screen: const IntroDemoScreen());
      case AppRoutesNames.introDevotionalScreen:
        return _screenRoute(screen: const IntroDevotionalScreen());
      case AppRoutesNames.introQuotesSliderScreen:
        return _screenRoute(screen: const IntroQuotesSliderScreen());
      case AppRoutesNames.introLovingGodScreen:
        return _screenRoute(screen: const IntroLovingGodScreen());
      case AppRoutesNames.introBeginningScreen:
        return _screenRoute(screen: const IntroBeginningScreen());
      case AppRoutesNames.introRating2Screen:
        return _screenRoute(screen: const IntroRating2Screen());  
      case AppRoutesNames.introIlluminateSpiritScreen:
        return _screenRoute(screen: const IntroIlluminateSpiritScreen());  
      case AppRoutesNames.introMultipleChoiceScreen:
        return _screenRoute(screen: const IntroMultipleChoiceScreen());  
      case AppRoutesNames.introHowBestGlorySupportScreen:
        return _screenRoute(screen: const IntroHowBestGlorySupportScreen());                   
      case AppRoutesNames.introNeverMissDailyScreen:
        return _screenRoute(screen: const IntroNeverMissDailyScreen());
      case AppRoutesNames.introLoginScreen:
        return _screenRoute(screen: const IntroLoginScreen());
      case AppRoutesNames.introEmbarkSacredScreen:
        return _screenRoute(screen: const IntroEmbarkSacredScreen()); 
      case AppRoutesNames.introDailySacredScreen:
        return _screenRoute(screen: const IntroDailySacredScreen());   
      case AppRoutesNames.introDailyGuidedScreen:
        return _screenRoute(screen: const IntroDailyGuidedScreen()); 
      case AppRoutesNames.homeScreen2:
        return _screenRoute(screen: const HomeScreen2());
      case AppRoutesNames.devotionalScreen:
        return _screenRoute(screen: const DevotionalScreen());
      case AppRoutesNames.introAgeGroupScreen:
        return _screenRoute(screen: const IntroAgeGroupScreen());              
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _screenRoute({Widget? screen}) {
    return MaterialPageRoute(builder: (context) => screen!);
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return const Scaffold(
        body: Center(
          child: Text('Something went wrong',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'OpenSans',
                  color: Color(0xff2D3139))),
        ),
      );
    });
  }
}
