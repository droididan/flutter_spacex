import 'package:flutter/material.dart';
import 'package:spacex_app/feature/home/presentation/widgets/app_background.dart';
import 'package:spacex_app/feature/home/presentation/widgets/horizontal_tab_layout.dart';
import 'package:spacex_app/styleguide/colors.dart';
import 'package:spacex_app/styleguide/text_styles.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AppBackground(
            firstColor: firstCircleColor,
            secondColor: secondCircleColor,
            thirdColor: thirdCircleColor,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50.0,
              ),
              Padding(
                padding: EdgeInsets.only(right: 20),
                child: Material(
                  shape: CircleBorder(),
                  color: Colors.white,
                  elevation: 10.0,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.apps,
                      color: primaryColor,
                    ),
                  ),
                ),
              ),
              HeadingSubHeadingWidget(),
              SizedBox(
                height: 20.0,
              ),
              HorizontalTabLayout(),
            ],
          ),
        ],
      ),
    );
  }
}

class HeadingSubHeadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'SpaceX',
            style: headingStyle,
          ),
          Text(
            'Kick of the conversation',
            style: subHeadingStyle,
          )
        ],
      ),
    );
  }
}
