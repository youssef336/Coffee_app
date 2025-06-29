import 'package:coffeapp/core/utils/app_images.dart';
import 'package:coffeapp/features/details/presentation/views/widgets/count_item.dart';
import 'package:coffeapp/features/details/presentation/views/widgets/hot_cold_widget.dart';
import 'package:coffeapp/features/home/data/models/drink-model.dart';
import 'package:flutter/material.dart';

class DetailsViewBody extends StatefulWidget {
  const DetailsViewBody({super.key, required this.drink});
  final DrinkModel drink;

  @override
  State<DetailsViewBody> createState() => _DetailsViewBodyState();
}

class _DetailsViewBodyState extends State<DetailsViewBody> {
  final PageController _controller = PageController(viewportFraction: 0.50);
  double _currentPage = 0;

  bool firstImage = true;
  double drinkSize = 1.1;
  double positionbottom = 0;
  String title = "";
  String price = "";

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        _currentPage = _controller.page ?? 1;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  final drinks = DrinkModel.drinks;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(
          title: Text(
            title.isEmpty ? widget.drink.name : title,

            style: const TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                price.isEmpty ? widget.drink.price : price,
                style: TextStyle(color: Colors.green[800], fontSize: 20),
              ),
            ],
          ),
        ),
        Expanded(
          child: PageView.builder(
            controller: _controller,
            itemCount: drinks.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              price = drinks[index].price;
              var num = index != 0 ? index - 1 : index;
              title = drinks[num].name;
              if (index != 0) {
                firstImage = false;
              }
              if (index == 9 ||
                  index == 3 ||
                  index == 7 ||
                  index == 1 ||
                  widget.drink.number == 9 ||
                  widget.drink.number == 3 ||
                  widget.drink.number == 7 ||
                  widget.drink.number == 1) {
                positionbottom = MediaQuery.of(context).size.height * 0.098;
              } else {
                positionbottom = MediaQuery.of(context).size.height * 0.079;
              }

              final scale = drinkSize - (_currentPage - index).abs() * 1;
              final translateY = (_currentPage - index).abs() * 390;
              return Transform.translate(
                offset: Offset(translateY, -20),
                child: Transform.scale(
                  scale: scale.clamp(0.5, 3.0),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          firstImage
                              ? Image.asset(
                                  drinks[widget.drink.number].image,
                                  height:
                                      MediaQuery.of(context).size.height * 0.67,
                                )
                              : Image.asset(
                                  drinks[index].image,
                                  height:
                                      MediaQuery.of(context).size.height * 0.67,
                                ),

                          Positioned(
                            bottom: positionbottom,
                            right: 0,
                            left: 0,
                            child: Image.asset("assets/drinks/Ellipse 2.png"),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          CircleAvatar(
                            radius: 10,
                            foregroundColor: Colors.yellow,
                            backgroundColor: Colors.black,
                            child: Image.asset(Assets.drinksCupSize),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.03),
        const Row(children: [HotColdWidget(), Spacer(), CountItem()]),

        const SizedBox(height: 50),
      ],
    );
  }
}
