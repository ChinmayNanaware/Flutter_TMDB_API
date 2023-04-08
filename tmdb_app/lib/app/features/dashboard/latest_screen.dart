import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sizer/sizer.dart';
import 'package:tmdb_app/app/core/constants/string_constants.dart';
import 'package:tmdb_app/app/core/models/movies_response_model.dart';
import 'package:tmdb_app/app/core/utils/alert_utils.dart';
import 'package:tmdb_app/app/core/utils/network_utils.dart';
import 'package:tmdb_app/app/core/utils/service_utils.dart';
import 'package:tmdb_app/app/core/widgets/loading_widget.dart';

class LatestScreen extends StatefulWidget {
  const LatestScreen({super.key});

  @override
  State<LatestScreen> createState() => _LatestScreenState();
}

class _LatestScreenState extends State<LatestScreen> {
  bool isLoading = false;
  MoviesResponseModel? getMovieData;

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
                    Text(
                      "Latest Movies",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 12.5.sp),
                    ),
                    SizedBox(
                      height: 2.0.h,
                    ),
                    Flexible(
                      child: Scrollbar(
                        child: GridView.builder(
                          itemCount: getMovieData != null &&
                                  getMovieData!.results != null &&
                                  getMovieData!.results!.isNotEmpty
                              ? getMovieData!.results!.length
                              : 0,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 2 / 3,
                            crossAxisSpacing: 0.0,
                            mainAxisSpacing: 1.0.h,
                            crossAxisCount: 3,
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
                                      'https://image.tmdb.org/t/p/w220_and_h330_face/${getMovieData!.results![index].posterPath!}',
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
        getMovieData =
            await NetworkUtils().getResults(EndPoints.getTrendingMoviesURL);
      } on Exception catch (e) {
        if (!mounted) return;
        setState(() {
          isLoading = false;
        });
      }

      if (getMovieData != null) {
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
