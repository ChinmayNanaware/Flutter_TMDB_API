import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sizer/sizer.dart';
import 'package:tmdb_app/app/core/constants/string_constants.dart';
import 'package:tmdb_app/app/core/models/movies_response_model.dart';
import 'package:tmdb_app/app/core/utils/alert_utils.dart';
import 'package:tmdb_app/app/core/utils/network_utils.dart';
import 'package:tmdb_app/app/core/utils/service_utils.dart';
import 'package:tmdb_app/app/core/widgets/custom_tile.dart';
import 'package:tmdb_app/app/core/widgets/loading_widget.dart';
import 'package:tmdb_app/app/core/widgets/primary_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = false;
  MoviesResponseModel? getSuggestedMovies, getTrendingMovies, getNewMovies;

  @override
  void initState() {
    // TODO: implement initState
    fetchData(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: isLoading == false
          ? Padding(
              padding: EdgeInsets.all(2.0.h),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Suggested",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 12.5.sp),
                        ),
                        SizedBox(
                          width: 1.0.h,
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                          size: 2.0.h,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 2.0.h,
                    ),
                    Expanded(
                      child: Scrollbar(
                        child: GridView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: getSuggestedMovies != null &&
                                  getSuggestedMovies!.results != null &&
                                  getSuggestedMovies!.results!.isNotEmpty
                              ? getSuggestedMovies!.results!.length
                              : 0,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 3 / 2,
                            crossAxisSpacing: 0.0,
                            mainAxisSpacing: 1.0.h,
                            crossAxisCount: 1,
                          ),
                          itemBuilder: (BuildContext context, int index) {
                            return Card(
                              borderOnForeground: true,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(2.0.h),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(2.0.h),
                                child: Container(
                                  height: 10.0.h,
                                  child: Image.network(
                                      'https://image.tmdb.org/t/p/w220_and_h330_face/${getSuggestedMovies!.results![index].posterPath!}',
                                      fit: BoxFit.fitHeight),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 2.0.h,
                    ),
                    Row(
                      children: [
                        Text(
                          "Now Playing",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 12.5.sp),
                        ),
                        SizedBox(
                          width: 1.0.h,
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                          size: 2.0.h,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 2.0.h,
                    ),
                    Expanded(
                      child: Scrollbar(
                        child: GridView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: getNewMovies != null &&
                                  getNewMovies!.results != null &&
                                  getNewMovies!.results!.isNotEmpty
                              ? getNewMovies!.results!.length
                              : 0,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 3 / 2,
                            crossAxisSpacing: 0.0,
                            mainAxisSpacing: 1.0.h,
                            crossAxisCount: 1,
                          ),
                          itemBuilder: (BuildContext context, int index) {
                            return Card(
                              borderOnForeground: true,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(2.0.h),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(2.0.h),
                                child: Container(
                                  height: 10.0.h,
                                  child: Image.network(
                                      'https://image.tmdb.org/t/p/w220_and_h330_face/${getNewMovies!.results![index].posterPath!}',
                                      fit: BoxFit.fitHeight),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 2.0.h,
                    ),
                    Row(
                      children: [
                        Text(
                          "Trending",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 12.5.sp),
                        ),
                        SizedBox(
                          width: 1.0.h,
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                          size: 2.0.h,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 2.0.h,
                    ),
                    Expanded(
                      child: Scrollbar(
                        child: GridView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: getTrendingMovies != null &&
                                  getTrendingMovies!.results != null &&
                                  getTrendingMovies!.results!.isNotEmpty
                              ? getTrendingMovies!.results!.length
                              : 0,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 3 / 2,
                            crossAxisSpacing: 0.0,
                            mainAxisSpacing: 1.0.h,
                            crossAxisCount: 1,
                          ),
                          itemBuilder: (BuildContext context, int index) {
                            return Card(
                              borderOnForeground: true,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(2.0.h),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(2.0.h),
                                child: Container(
                                  height: 10.0.h,
                                  child: Image.network(
                                      'https://image.tmdb.org/t/p/w220_and_h330_face/${getTrendingMovies!.results![index].posterPath!}',
                                      fit: BoxFit.fitHeight),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ]),
            )
          : LoadingWidget(),
    );
  }

  Future fetchData(BuildContext context) async {
    if (!mounted) return;
    setState(() {
      isLoading = true;
    });
    Map bodyData;
    if (await ServiceUtil.checkInternetConnection()) {
      try {
        getSuggestedMovies =
            await NetworkUtils().getResults(EndPoints.getSuggestionsURL);
        getNewMovies =
            await NetworkUtils().getResults(EndPoints.getNowPlayingURL);
        getTrendingMovies =
            await NetworkUtils().getResults(EndPoints.getTrendingMoviesURL);
      } on Exception catch (e) {
        if (!mounted) return;
        setState(() {
          isLoading = false;
        });
      }

      if (getSuggestedMovies != null) {
        if (!mounted) return;
        setState(() {});
      } else {
        AlertUtils.showAlertDialog(
          context: context,
          title: "Error",
          message: "Error fetching data",
          performTask: null,
        );
      }
    }

    if (!mounted) return;
    setState(() {
      isLoading = false;
    });
  }
}
