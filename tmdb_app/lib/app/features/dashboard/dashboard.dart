import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:tmdb_app/app/core/constants/nav_bar_items.dart';
import 'package:tmdb_app/app/core/constants/navigation_cubit.dart';
import 'package:tmdb_app/app/features/dashboard/home_screen.dart';
import 'package:tmdb_app/app/features/dashboard/latest_screen.dart';
import 'package:tmdb_app/app/features/dashboard/popular_screen.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Image.network(
          "https://image.tmdb.org/t/p/w500/wwemzKWzjKYJFfCeiB57q3r4Bcm.png",
          scale: 0.8.h,
        ),
        actions: [
          Icon(
            Icons.search,
            size: 4.0.h,
          ),
          SizedBox(
            width: 2.0.h,
          ),
          Padding(
            padding: EdgeInsets.only(right: 2.0.h),
            child: CircleAvatar(
              child: Icon(
                Icons.person,
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: BlocBuilder<NavigationCubit, NavigationState>(
        builder: (context, state) {
          return BottomNavigationBar(
            currentIndex: state.index,
            backgroundColor: Colors.black,
            unselectedItemColor: Colors.white60,
            selectedItemColor: Colors.white,
            items: [
              const BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.tv,
                ),
                label: 'Latest',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.trending_up,
                ),
                label: 'Popular',
              ),
            ],
            onTap: (index) {
              if (index == 0) {
                BlocProvider.of<NavigationCubit>(context)
                    .getNavBarItem(NavbarItem.home);
              } else if (index == 1) {
                BlocProvider.of<NavigationCubit>(context)
                    .getNavBarItem(NavbarItem.latest);
              } else if (index == 2) {
                BlocProvider.of<NavigationCubit>(context)
                    .getNavBarItem(NavbarItem.popular);
              }
            },
          );
        },
      ),
      body: BlocBuilder<NavigationCubit, NavigationState>(
          builder: (context, state) {
        if (state.navbarItem == NavbarItem.home) {
          return HomeScreen();
        } else if (state.navbarItem == NavbarItem.latest) {
          return LatestScreen();
        } else if (state.navbarItem == NavbarItem.popular) {
          return PopularScreen();
        }
        return Container();
      }),
    );
  }
}
