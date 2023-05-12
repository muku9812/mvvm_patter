import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../datas/response/status.dart';

import '../viewModel/homePhotoViewModel.dart';
import '../viewModel/userSessionViewModel.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  HomePhotViewModel homePhotViewModel = HomePhotViewModel();

  @override
  void initState() {
    homePhotViewModel.fetchPhotoList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final homePhotViewModel = Provider.of<HomePhotViewModel>(context);
    final userPreference = Provider.of<UserSessionViewModel>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('Home View'),
        ),
        body: Consumer<HomePhotViewModel>(
          builder: ((context, homePhotoModel, child) {
            switch (homePhotoModel.photoList.status) {
              case Status.LOADING:
                return const Center(
                  child: CircularProgressIndicator(),
                );

              case Status.ERROR:
                return Center(
                  child: Text(homePhotViewModel.photoList.message.toString()),
                );

              case Status.COMPLETED:
                return Center(
                  child: Text('Api Hit'),
                );
              default:
            }
            return Container();
          }),
        ));
  }
}
