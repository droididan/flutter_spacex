import 'package:flutter/material.dart';
import 'package:spacex_app/feature/home/presentation/widgets/app_background.dart';
import 'package:spacex_app/feature/home/presentation/widgets/label_value_widget.dart';
import 'package:spacex_app/styleguide/colors.dart';
import 'package:spacex_app/styleguide/text_styles.dart';

class DetailsPage extends StatefulWidget {
  DetailsPage();

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _fadeAnimation;
  Animation<double> _scaleAnimation;
  Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
    _scaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
    _offsetAnimation = Tween<Offset>(begin: Offset(0, 1), end: Offset(0, 0)).animate(_controller);
  }

  _playAnimation() {
    _controller.reset();
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          AppBackground(
            firstColor: firstOrangeCircleColor,
            secondColor: secondOrangeCircleColor,
            thirdColor: thirdOrangeCircleColor,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 60.0,
              ),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              FutureBuilder(
                future: _playAnimation(),
                builder: (context, snapshot) {
                  return FadeTransition(
                    opacity: _fadeAnimation,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 100.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          LabelValueWidget(
                            value: 'topics value',
                            label: "topics",
                            labelStyle: whiteLabelTextStyle,
                            valueStyle: whiteValueTextStyle,
                          ),
                          LabelValueWidget(
                            value: 'threads value',
                            label: "threads",
                            labelStyle: whiteLabelTextStyle,
                            valueStyle: whiteValueTextStyle,
                          ),
                          LabelValueWidget(
                            value: 'subs label',
                            label: "subs",
                            labelStyle: whiteLabelTextStyle,
                            valueStyle: whiteValueTextStyle,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              SizedBox(
                height: 30.0,
              ),
              Hero(
                tag: 'title',
                child: ClipRRect(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(60.0)),
                  child: Image.asset('path'),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: ClipRRect(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(60.0)),
              child: Container(
                height: 300.0,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(top: 32.0, left: 16.0, right: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Topics",
                        style: subHeadingStyle.copyWith(fontSize: 26),
                      ),
                      Expanded(
                        child: SlideTransition(
                          position: _offsetAnimation,
                          child: ListView.builder(
                            itemCount: 11,
                            itemBuilder: (context, index) {
                              return TopicsTile();
                            },
                            shrinkWrap: true,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 260,
            right: 20,
            child: ScaleTransition(
              scale: _scaleAnimation,
              child: Material(
                elevation: 10.0,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    'rank',
                    style: rankBigStyle,
                  ),
                ),
                color: Colors.white,
                shape: CircleBorder(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TopicsTile extends StatelessWidget {
  TopicsTile();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'qustion',
                style: topicQuestionTextStyle,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  color: primaryColor,
                ),
                child: Text(
                  'answer',
                  style: topicAnswerCountTextStyle,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 4.0,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 24.0),
            child: Text(
              'bla bla',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: topicAnswerTextStyle,
            ),
          )
        ],
      ),
    );
  }
}
