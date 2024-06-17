import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_maps/data/webservices/PlacesWebservices.dart';
import 'package:my_maps/presentation/screens/app_setting.dart';
import 'package:my_maps/presentation/screens/login_screen.dart';
import 'package:my_maps/presentation/screens/map_screen.dart';
import 'package:my_maps/presentation/screens/my_profile.dart';
import 'package:my_maps/presentation/screens/otp_screen.dart';
import '../business_logic/cubit/phone_auth_cubit.dart';
import '../business_logic/maps/maps_cubit.dart';
import '../constants/strings.dart';
import '../data/maps_repo.dart';

class AppRouter {
 PhoneAuthCubit? phoneAuthCubit;

  AppRouter() {
    phoneAuthCubit = PhoneAuthCubit();
  }

  MaterialPageRoute? generateRouter(RouteSettings settings) {
    switch (settings.name) {
      case loginScreen :
        return MaterialPageRoute(
          builder: (_) =>
              BlocProvider(
                create: (context) => phoneAuthCubit!,
                child: LoginScreen(),
              ),
        );
      case otpScreen :
        final phoneNumber = settings.arguments;
        return MaterialPageRoute(
          builder: (_) =>
              BlocProvider(
                create: (context) => phoneAuthCubit!,
                child: OtpScreen(phoneNumber:phoneNumber),
              ),

        );
      case mapScreen :
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
              create: (BuildContext context) =>
                  MapsCubit(MapsRepository(PlacesWebServices())),
              child: MapScreen(),
          )
        );


      case myProf :
        return MaterialPageRoute(
          builder: (_) =>
              MyProfile(),
        );


      case set :
        return MaterialPageRoute(
          builder: (_) =>
              AppSettings(),
        );

    }
  }

}