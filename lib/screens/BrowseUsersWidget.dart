import 'package:flutter/material.dart';
import '../layouts/AppbarDrawerLayout.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';

class BrowseUsersWidget extends StatefulWidget {
  @override
  _BrowseUsersWidgetState createState() => _BrowseUsersWidgetState();
}

class _BrowseUsersWidgetState extends State<BrowseUsersWidget> {
  List<String> welcomeImages = [
    "assets/images/Welcome-bg.png",
    "assets/images/Welcome-bg.png",
    "assets/images/Welcome-bg.png",
    "assets/images/Welcome-bg.png",
    "assets/images/Welcome-bg.png",
  ];

  @override
  Widget build(BuildContext context) {
    CardController controller; //Use this to trigger swap.
    return AppbarDrawerLayout(
        title: 'Browse',
        body: Container(
          height: MediaQuery.of(context).size.height * 0.6,
          decoration: BoxDecoration(color: Color(0xfff8f8f8)),
          child: new TinderSwapCard(
            swipeUp: true,
            swipeDown: true,
            orientation: AmassOrientation.BOTTOM,
            totalNum: welcomeImages.length,
            stackNum: 3,
            swipeEdge: 4.0,
            maxWidth: MediaQuery.of(context).size.width * 0.8,
            maxHeight: MediaQuery.of(context).size.width * 0.8,
            minWidth: MediaQuery.of(context).size.width * 0.7,
            minHeight: MediaQuery.of(context).size.width * 0.7,
            cardBuilder: (context, index) => Card(
              child: Padding(
                  padding: new EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 20.0),
                  child: Image.asset('${welcomeImages[index]}')),
            ),
            cardController: controller = CardController(),
            swipeUpdateCallback: (DragUpdateDetails details, Alignment align) {
              /// Get swiping card's alignment
              if (align.x < 0) {
                //Card is LEFT swiping
              } else if (align.x > 0) {
                //Card is RIGHT swiping
              }
            },
            swipeCompleteCallback:
                (CardSwipeOrientation orientation, int index) {
              /// Get orientation & index of swiped card!
            },
          ),
        ),
        footer:
            // Stack(children: [
            // Divider(
            //   color: const Color(0xffe5e5e5),
            //   height: 73,
            //   thickness: 1,
            //   indent: 0,
            //   endIndent: 0,
            // ),
            Container(
                width: double.maxFinite,
                height: 240.04296875,
                // color: Colors.red,
                child: Padding(
                    padding: new EdgeInsets.only(bottom: 20.0, top: 20.0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              child: ButtonIcon(
                            bgColor: const Color(0xff02b4ff),
                            btnIcon: Icons.star,
                            size: 50.00,
                            iconSize: 20.00,
                          )),
                          Text("Janinne",
                              style: const TextStyle(
                                  color: const Color(0xff383838),
                                  fontWeight: FontWeight.w300,
                                  fontFamily: "Lato",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 25.0),
                              textAlign: TextAlign.left),
                          Opacity(
                            opacity: 0.800000011920929,
                            child: Text("24 yrs old • 1.9km away",
                                style: const TextStyle(
                                    color: const Color(0xff383838),
                                    fontWeight: FontWeight.w300,
                                    fontFamily: "Lato",
                                    fontStyle: FontStyle.normal,
                                    fontSize: 13.0),
                                textAlign: TextAlign.left),
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ButtonIcon(
                                  bgColor: const Color(0xffa8a8a8),
                                  btnIcon: Icons.favorite),
                              ButtonIcon(
                                  bgColor: const Color(0xfff24e86),
                                  btnIcon: Icons.close_rounded)
                            ],
                          )
                        ])))
        // ])
        );
  }
}

class ButtonIcon extends StatelessWidget {
  const ButtonIcon(
      {Key key,
      this.bgColor,
      this.btnIcon,
      this.size: 80.00,
      this.iconSize: 45.00})
      : super(key: key);

  final bgColor, btnIcon, size, iconSize;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: size,
        width: size,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: bgColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
              ),
            ),
            child: Icon(
              btnIcon,
              size: iconSize,
              semanticLabel: 'Text to announce in accessibility modes',
            ),
            onPressed: () {}));
  }
}
