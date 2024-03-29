import 'package:flutter/material.dart';
import 'package:real_estate_app/custom/BorderIcon.dart';
import 'package:real_estate_app/custom/ChoiceOption.dart';
import 'package:real_estate_app/custom/OptionButton.dart';
import 'package:real_estate_app/sample_data.dart';
import 'package:real_estate_app/screens/DetailPage.dart';
import 'package:real_estate_app/utils/constants.dart';
import 'package:real_estate_app/utils/custom_functions.dart';
import 'package:real_estate_app/utils/widget_functions.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    double padding = 25;
    final sidePadding = EdgeInsets.symmetric(horizontal: padding);
    return SafeArea(
      child: Scaffold(
          body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            addVerticalSpace(padding),
            Padding(
              padding: sidePadding,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BorderIcon(child: Icon(Icons.menu)),
                  BorderIcon(child: Icon(Icons.settings)),
                ],
              ),
            ),
            // [menu icon, settings icon]-> row(spacebetween)
            addVerticalSpace(20),
            // City text
            Padding(
              padding: sidePadding,
              child: Text('City'),
            ),
            addVerticalSpace(10),
            Padding(
              padding: sidePadding,
              child: Text(
                'San francisco',
                style: themeData.textTheme.headline1,
              ),
            ),

            Padding(
              padding: sidePadding,
              child: Divider(
                color: Colors.grey,
              ),
            ),

            // Text San franciso with - themeData.textTheme.headline1
            // divider - grey color

            addVerticalSpace(10),

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ChoiceOption(text: "houses"),
                  ChoiceOption(text: "villas"),
                  ChoiceOption(text: "12,000"),
                  ChoiceOption(text: "flats"),
                  ChoiceOption(text: "penthouse"),
                ],
              ),
            ),
            // ChoiceOption -> Row -> SingleChildScrollView (axis horizontal)

            addVerticalSpace(10),
            Expanded(
              child: Padding(
                padding: sidePadding,
                child: ListView.builder(
                  itemCount: RE_DATA.length,
                  itemBuilder: (context, index) {
                    return RealEstateItem(itemData: RE_DATA[index]);
                  },
                ),
              ),
            ),

            // ListView.builder (itemCount : RE_DATA.length, itemBuilder : RealEstateItem(itemData: RE_DATA[index]),   -> Padding -> Expanded                   ) )
          ],
        ),
      )),
    );
  }
}

class RealEstateItem extends StatelessWidget {
  final dynamic itemData;

  const RealEstateItem({Key key, this.itemData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return GestureDetector(
      onTap: () {
        // push details page with item data
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                // FlutterLogo(),
                Image.asset(itemData["image"]),
                // use Image.asset()- itemData["image"] as image path, ClipRRect - radius 25
                // favorite_border icon, inside positioned widget
              ],
            ),
            addVerticalSpace(15),
            Text(
              "${formatCurrency(itemData["amount"])}",
              style: themeData.textTheme.headline1,
            ),
            addVerticalSpace(10),
            Text(
              "${itemData["bedrooms"]} bedrooms / ${itemData["bathrooms"]} bathrooms / ${itemData["area"]} sqft",
              style: themeData.textTheme.headline5,
            )
          ],
        ),
      ),
    );
  }
}
