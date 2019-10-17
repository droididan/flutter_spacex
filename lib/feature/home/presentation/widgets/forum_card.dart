import 'package:flutter/material.dart';
import 'package:spacex_app/feature/details/details_page.dart';

import 'forum_details_widget.dart';
import 'forum_name_widget.dart';

class ForumCard extends StatelessWidget {
  ForumCard();

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'title',
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsPage()));
          },
          child: SizedBox(
            width: 280.0,
            child: Card(
              margin: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 60.0),
              elevation: 20.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                child: Stack(
                  children: <Widget>[
                    Image.asset(
                      'image-path',
                      fit: BoxFit.fitWidth,
                    ),
                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: ForumDetailsWidget(),
                    ),
                    Positioned(
                      left: 0,
                      bottom: 80.0,
                      child: ForumNameWidget(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
