import 'package:flutter/material.dart';
import 'package:gloryai/routing/app_route_names.dart';
import 'package:gloryai/screens/chat_screen.dart';
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
import 'package:gloryai/screens/intro/intro_how_long_list_screen.dart';
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
import 'package:gloryai/screens/settings_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // Default slide direction is left (override per route if needed)
      case AppRoutesNames.initial:
        return _slideRoute(screen: const IntroScreen(), direction: AxisDirection.left);
      case AppRoutesNames.introRatingScreen:
        return _slideRoute(screen: const IntroRatingScreen(), direction: AxisDirection.left);  
      case AppRoutesNames.introQuoteScreen:
        return _slideRoute(screen: const IntroQuoteScreen(), direction: AxisDirection.left);   
      case AppRoutesNames.introWhereFindScreen:
        return _slideRoute(screen: const IntroWhereFindScreen(), direction: AxisDirection.left);
      case AppRoutesNames.introAlwaysTogetherScreen:
        return _slideRoute(screen: const IntroAlwaysTogetherScreen(), direction: AxisDirection.left);
      case AppRoutesNames.introGenderSelectScreen:
        return _slideRoute(screen: const IntroGenderSelectScreen(), direction: AxisDirection.left);
      case AppRoutesNames.introTraditionSelectScreen:
        return _slideRoute(screen: const IntroTraditionSelectScreen(), direction: AxisDirection.left);
      case AppRoutesNames.introScriptureScreen:
        return _slideRoute(screen: const IntroScriptureScreen(), direction: AxisDirection.left); 
      case AppRoutesNames.introQuote2Screen:
        return _slideRoute(screen: const IntroQuote2Screen(), direction: AxisDirection.left);
      case AppRoutesNames.introScripture2Screen:
        return _slideRoute(screen: const IntroScripture2Screen(), direction: AxisDirection.left);
      case AppRoutesNames.introDemoScreen:
        return _slideRoute(screen: const IntroDemoScreen(), direction: AxisDirection.left);
      case AppRoutesNames.introDevotionalScreen:
        return _slideRoute(screen: const IntroDevotionalScreen(), direction: AxisDirection.left);
      case AppRoutesNames.introQuotesSliderScreen:
        return _slideRoute(screen: const IntroQuotesSliderScreen(), direction: AxisDirection.left);
      case AppRoutesNames.introLovingGodScreen:
        return _slideRoute(screen: const IntroLovingGodScreen(), direction: AxisDirection.left);
      case AppRoutesNames.introBeginningScreen:
        return _slideRoute(screen: const IntroBeginningScreen(), direction: AxisDirection.left);
      case AppRoutesNames.introRating2Screen:
        return _slideRoute(screen: const IntroRating2Screen(), direction: AxisDirection.left);  
      case AppRoutesNames.introIlluminateSpiritScreen:
        return _slideRoute(screen: const IntroIlluminateSpiritScreen(), direction: AxisDirection.left);  
      case AppRoutesNames.introMultipleChoiceScreen:
        return _slideRoute(screen: const IntroMultipleChoiceScreen(), direction: AxisDirection.left);  
      case AppRoutesNames.introHowBestGlorySupportScreen:
        return _slideRoute(screen: const IntroHowBestGlorySupportScreen(), direction: AxisDirection.left);                   
      case AppRoutesNames.introNeverMissDailyScreen:
        return _slideRoute(screen: const IntroNeverMissDailyScreen(), direction: AxisDirection.left);
      case AppRoutesNames.introLoginScreen:
        return _slideRoute(screen: const IntroLoginScreen(), direction: AxisDirection.left);
      case AppRoutesNames.introEmbarkSacredScreen:
        return _slideRoute(screen: const IntroEmbarkSacredScreen(), direction: AxisDirection.left); 
      case AppRoutesNames.introDailySacredScreen:
        return _slideRoute(screen: const IntroDailySacredScreen(), direction: AxisDirection.left);   
      case AppRoutesNames.introDailyGuidedScreen:
        return _slideRoute(screen: const IntroDailyGuidedScreen(), direction: AxisDirection.left); 
      case AppRoutesNames.homeScreen2:
        return _slideRoute(screen: const HomeScreen2(), direction: AxisDirection.left);
      case AppRoutesNames.devotionalScreen:
        return _slideRoute(screen: const DevotionalScreen(), direction: AxisDirection.left);
      case AppRoutesNames.introAgeGroupScreen:
        return _slideRoute(screen: const IntroAgeGroupScreen(), direction: AxisDirection.left);    
      case AppRoutesNames.introHowLongistScreen:
        return _slideRoute(screen: const IntroHowLongistScreen(), direction: AxisDirection.left);   
      case AppRoutesNames.settingsScreen:
        return _slideRoute(screen: const SettingsScreen(), direction: AxisDirection.left);
      case AppRoutesNames.chatScreen:
        return _slideRoute(screen: const ChatScreen(), direction: AxisDirection.left);           
      default:
        return _errorRoute();
    }
  }

  // Slide transition only (no fade)
  static Route<dynamic> _slideRoute({
    required Widget screen,
    required AxisDirection direction,
  }) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => screen,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        // Slide transition logic
        final offset = _getSlideOffset(direction);
        final curve = Curves.easeOutQuart; // Smooth curve
        final tween = Tween<Offset>(
          begin: offset,
          end: Offset.zero,
        ).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
      transitionDuration: const Duration(milliseconds: 350), // Adjust speed
    );
  }

  // Helper to get slide offset based on direction
  static Offset _getSlideOffset(AxisDirection direction) {
    switch (direction) {
      case AxisDirection.up:
        return const Offset(0, 1); // Slide up from bottom
      case AxisDirection.down:
        return const Offset(0, -1); // Slide down from top
      case AxisDirection.left:
        return const Offset(1, 0); // Slide left from right
      case AxisDirection.right:
        return const Offset(-1, 0); // Slide right from left
    }
  }

  // Error route remains the same
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