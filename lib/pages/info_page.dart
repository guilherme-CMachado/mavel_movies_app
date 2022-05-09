import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:marvel_app/controllers/marvel_controller.dart';
import 'package:marvel_app/models/mavelDTO.dart';

class InfoPage extends StatelessWidget {
  final MarvelDTO marvelDTO;
  InfoPage({Key? key, required this.marvelDTO}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: _buildAppBar(context),
      body: _buildBody(context),
    );
  }

  _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.grey[900],
      elevation: 0,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
        ),
      ),
      title: const Text(
        "Marvel App",
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  _buildBody(BuildContext context) {
    return Observer(builder: (_) {
      return ListView(
        shrinkWrap: true,
        children: <Widget>[
          _buildImage(context),
          _buildDescripition(),
        ],
      );
    });
  }

  _buildImage(BuildContext context) {
    if (marvelDTO.coverUrl == null) return const SizedBox.shrink();
    return Container(
        padding: const EdgeInsets.fromLTRB(4, 8, 4, 8),
        child: ClipRRect(
          child: CachedNetworkImage(
            fit: BoxFit.cover,
            imageUrl: marvelDTO.coverUrl!,
          ),
        ));
  }

  _buildDescripition() {
    return Column(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(left: 10, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                "${marvelDTO.title}",
                style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                "#${marvelDTO.id}",
                style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            "${marvelDTO.overview}",
            style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w300),
          ),
        )
      ],
    );
  }
}
