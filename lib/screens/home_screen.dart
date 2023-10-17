import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:picsum_photos/bloc/pics/pics_bloc.dart';
import 'package:picsum_photos/widgets/widgets.dart';

import '../bloc/app/app_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PicsBloc picsBloc;
  final ScrollController scrollController = ScrollController();
  bool isLoading = false;
  int pageNumber = 2;

  @override
  void initState() {
    picsBloc = BlocProvider.of<PicsBloc>(context);
    picsBloc.add(OnGetPhotos(1));
    super.initState();

    scrollController.addListener(() {
      if ((scrollController.position.pixels + 500) >=
          (scrollController.position.maxScrollExtent)) {
        fetchData();
      }
    });
  }

  Future fetchData() async {
    if (isLoading) return;

    isLoading = true;
    setState(() {});

    await Future.delayed(const Duration(seconds: 3));

    getPicsumPhotos();

    isLoading = false;
    setState(() {});

    if ((scrollController.position.pixels + 500) >=
        (scrollController.position.maxScrollExtent)) {
      return;
    } else {
      scrollController.animateTo(scrollController.position.pixels + 120,
          duration: const Duration(milliseconds: 300),
          curve: Curves.fastOutSlowIn);
    }
  }

  void getPicsumPhotos() {
    picsBloc.add(OnGetPhotos(pageNumber));
    pageNumber++;
    
  }

  Future<void> onRefresh() async {
    await Future.delayed(const Duration(seconds: 2));
    getPicsumPhotos();
  }

  @override
  Widget build(BuildContext context) {
    const Color colorLight = Color.fromARGB(255, 42, 157, 195);
    const Color colorDark = Color(0xFF012A4A);
    final size = MediaQuery.of(context).size;

    return BlocBuilder<AppBloc, AppState>(builder: (context, appState) {
          picsBloc = BlocProvider.of<PicsBloc>(context);
      return Scaffold(
        appBar: AppBar(
          title: const Text('PICSUM'),
          backgroundColor: appState.isThemeLight ? colorLight : colorDark,
          centerTitle: true,
        ),
        drawer: const CustomDrawer(),
        body: Stack(
          children: [
            RefreshIndicator(
              color: colorLight,
              onRefresh: onRefresh,
              child: BlocBuilder<PicsBloc, PicsState>(
                builder: (context, state) {
                  if (state.loading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state.error != null) {
                    return Center(
                      child: RefreshIndicator(
                        onRefresh: onRefresh,
                        child: ContainerError(error: state.error!),
                      ),
                    );
                  } else if (state.pics.isNotEmpty) {
                    return ListView.builder(
                      controller: scrollController,
                      physics: const BouncingScrollPhysics(),
                      itemCount: state.pics.length,
                      itemBuilder: (BuildContext context, int index) {
                        final pic = state.pics[index];
                        return GestureDetector(
                          onTap: () {
                          },
                          child: Hero(
                              tag: pic.id!,
                              child: PicsContainer(appState: appState, context: context, index: index, pic: pic,
                                 )),
                        );
                      },
                    );
                  }
                  return Container();
                },
              ),
            ) 
          ],
        ),
      );
    });
  }
}
