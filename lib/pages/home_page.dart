import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:marvel_app/pages/info_page.dart';
import '../controllers/marvel_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = MarvelController();

  @override
  void initState() {
    _controller.buscarDados();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Observer(builder: (_) {
        return Scaffold(
          backgroundColor: Colors.grey[900],
          appBar: _buildAppBar(),
          body: _buildBody(),
        );
      }),
    );
  }

  _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.black,
      elevation: 0,
      title: const Text(
        "Marvel App",
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
      ),
      centerTitle: true,
    );
  }

  _buildBody() {
    return _controller.marvelObras.isNotEmpty
        ? GridView.builder(
            itemCount: _controller.marvelObras.length,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 2 / 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (BuildContext context, int index) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: GestureDetector(
                  onTap: () {
                    final item = _controller.marvelObras[index];
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => InfoPage(
                              marvelDTO: item,
                            )));
                  },
                  child: CachedNetworkImage(
                    imageUrl: _controller.marvelObras[index].coverUrl.toString(),
                  ),
                ),
              );
            },
          )
        : Container(
            height: 50,
            width: 50,
            child: const Center(
              child: CircularProgressIndicator(
                color: Colors.white54,
              ),
            ),
          );
  }
}
