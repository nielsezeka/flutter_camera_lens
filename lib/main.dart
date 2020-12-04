import 'package:flutter/material.dart';
import 'package:flutter_lens/screens/tab_bar_view.dart';
import 'package:flutter_lens/screens/view_index.dart';
import 'package:flutter_page_transition/flutter_page_transition.dart';
import 'package:theme_provider/theme_provider.dart';
import 'bloc/bloc_index.dart';
import 'service/service_index.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  ServiceFacade.registerDefaultService();
  GlobalBloc.searchParamBloc.initSearch();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      themes: [
        AppTheme(
          id: "custom_theme",
          description: 'custom_theme',
          data: ThemeData(
            backgroundColor: Color(0xFF171717),
            primaryColor: Color(0xFF171717),
            cardColor: Color(0xFFB388FF),
            canvasColor: Colors.white,
            fontFamily: GoogleFonts.poppins().fontFamily,
            unselectedWidgetColor: Color(0xFF858585),
            accentColor: Color(0xFFFF4B6A),
            textTheme: TextTheme(
              headline6: TextStyle(fontSize: 18.0, color: Color(0xFFFF4B6A)),
              bodyText1: TextStyle(fontSize: 14.0, color: Colors.white),
              bodyText2: TextStyle(fontSize: 14.0, color: Colors.black),
              caption: TextStyle(fontSize: 12.0, color: Color(0xFF858585)),
            ),
          ),
        ),
        AppTheme.light(),
        AppTheme.dark(),
      ],
      child: ThemeConsumer(
        child: Builder(
          builder: (themeContext) => MaterialApp(
            theme: ThemeProvider.themeOf(themeContext).data,
            title: 'Material App',
            home: TabbarMainView(), //ListOfManafacture(),
            initialRoute: TabbarMainView.tag,
            onGenerateRoute: (RouteSettings routeSettings) {
              return new PageRouteBuilder<dynamic>(
                settings: routeSettings,
                pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
                  switch (routeSettings.name) {
                    case TabbarMainView.tag:
                      return TabbarMainView();
                    case DetailOfItem.tag:
                      final element = routeSettings.arguments as ItemDataThumbnail;
                      return DetailOfItem(
                        itemId: element.id,
                        imageThumb: element.image,
                      );
                    default:
                      return null;
                  }
                },
                transitionDuration: const Duration(milliseconds: 800),
                reverseTransitionDuration: const Duration(milliseconds: 800),
                transitionsBuilder: (BuildContext context, Animation<double> animation,
                    Animation<double> secondaryAnimation, Widget child) {
                  return effectMap[PageTransitionType.transferRight](
                    Curves.linear,
                    animation,
                    secondaryAnimation,
                    child,
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
