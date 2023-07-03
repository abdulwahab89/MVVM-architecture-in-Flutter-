import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mvvm/data/response/status.dart';
import 'package:mvvm/utils/routes/routes_name.dart';
import 'package:mvvm/view_model/home_view_model.dart';
import 'package:mvvm/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeViewViewModel homeViewViewModel = HomeViewViewModel();
  @override
  void initState() {
    // TODO: implement initState
    homeViewViewModel.fetchMoviesList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userPreferences = Provider.of<UserViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple.shade900,
        automaticallyImplyLeading: false,
        actions: [
          InkWell(
            onTap: () {
              userPreferences.remove().then(
                  (value) => Navigator.pushNamed(context, RoutesName.login));
            },
            child: const Center(
              child: Text(
                "Log out",
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          )
        ],
      ),
      body: ChangeNotifierProvider<HomeViewViewModel>(
        create: (_) => homeViewViewModel,
        child: Consumer<HomeViewViewModel>(builder: (context, value, _) {
          print(value.movieList.data);
          switch (value.movieList.status) {
            case Status.LOADING:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case Status.ERROR:
              print("error occurred");
              return Center(
                child: Text(value.movieList.message.toString()),
              );
            case Status.COMPLETED:
              print("Success");
              return ListView.builder(
                  itemCount: value.movieList.data.carts.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title: Text(
                            "User ID ${value.movieList.data!.carts![index].userId!}"),
                        trailing: Text(
                            "Discount   ${value.movieList.data!.carts![index].discountedTotal}"),
                      ),
                    );
                  });
            default:
              print("it's null");
          }
          return Container();
        }),
      ),
    );
  }
}
