import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:tawsil/components/components.dart';
import 'package:tawsil/components/consts.dart';
import 'package:tawsil/components/functions.dart';
import 'package:tawsil/screens/basketScreen.dart';

class FoodScreen extends StatefulWidget {
  final String name;
  final String rate;
  const FoodScreen({super.key, required this.name, required this.rate});

  @override
  State<FoodScreen> createState() => _FoodScreenState();
}

class _FoodScreenState extends State<FoodScreen> {
  int selectdcategoryIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorTheme.primaryColor,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              width: width(context: context, precent: 1),
              height: height(context: context, precent: 1),
              color: ColorTheme.primaryColor,
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    height: height(context: context, precent: 0.07),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.arrow_back_ios_rounded,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        SizedBox(
                          width: width(context: context, precent: 0.35),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: defaultText(
                                text: widget.name,
                                context: context,
                                fontSize: 15,
                                textColor: Colors.white),
                          ),
                        ),
                        Row(
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.search,
                                  color: Colors.white,
                                )),
                            IconButton(
                              onPressed: () async {
                                result = await navigateTo(
                                    context: context,
                                    screen: const BasketScreen());
                                if (result == true) {
                                  setState(() {});
                                }
                              },
                              icon: Stack(
                                alignment: Alignment.topRight,
                                children: [
                                  const Icon(
                                    Icons.shopping_cart,
                                    size: 25,
                                    color: Colors.white,
                                  ),
                                  cartItems.isNotEmpty
                                      ? Container(
                                          width: 15,
                                          height: 15,
                                          padding: const EdgeInsets.all(2),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                              color: ColorTheme.secondaryColor),
                                          child: Center(
                                            child: defaultText(
                                              context: context,
                                              fontSize: 5,
                                              text: cartItems.length.toString(),
                                            ),
                                          ))
                                      : const SizedBox.shrink()
                                ],
                              ),
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: CircleAvatar(
                                  maxRadius: 12,
                                  backgroundColor: Colors.white,
                                  child: Icon(
                                    Icons.person,
                                    size: 20,
                                    color: ColorTheme.primaryColor,
                                  ),
                                )),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.more_vert_rounded,
                                  color: Colors.white,
                                )),
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(20)),
                    width: width(context: context, precent: 0.8),
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            defaultText(
                                fontSize: 10,
                                fontWeight: FontWeight.normal,
                                textColor: Colors.white,
                                text: "عدد التقييمات ",
                                context: context),
                            defaultText(
                                fontSize: 10,
                                fontWeight: FontWeight.normal,
                                textColor: Colors.white,
                                text: "166",
                                context: context),
                          ],
                        ),
                        RatingBarIndicator(
                          rating: double.parse(widget.rate),
                          itemCount: 5,
                          itemSize: 15.0,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: Colors.white,
                          ),
                        ),
                        defaultText(
                            fontSize: 10,
                            fontWeight: FontWeight.normal,
                            textColor: Colors.white,
                            text: 'الاسعار مطابقة للمطعم',
                            context: context),
                        const SizedBox(
                          width: 20,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: ColorTheme.scaffoldColor,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              height: height(context: context, precent: 0.82),
              width: width(context: context, precent: 1),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(right: 15),
                    height: height(context: context, precent: 0.04),
                    width: width(context: context, precent: 1),
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.access_time)),
                        const SizedBox(
                          width: 3,
                        ),
                        const Text(
                          "الطلب يستغرق 40 - 60 دقيقة",
                          style: TextStyle(fontSize: 15),
                        ),
                        const Spacer(),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 5),
                          height: height(context: context, precent: 0.045),
                          decoration: BoxDecoration(
                              color: ColorTheme.secondaryColor,
                              borderRadius: const BorderRadius.only(
                                  bottomRight: Radius.circular(20),
                                  topLeft: Radius.circular(20))),
                          child: const Text(
                            'مفتوح',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height(context: context, precent: 0.05),
                    child: ListView.separated(
                        padding: const EdgeInsets.all(5),
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              setState(() {
                                selectdcategoryIndex = index;
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.only(left: 10),
                              decoration: BoxDecoration(
                                  color: index == selectdcategoryIndex
                                      ? ColorTheme.secondaryColor
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(50),
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Colors.white,
                                        blurRadius: 2,
                                        offset: Offset(0, 2))
                                  ]),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        border: Border.all(
                                            width: 1.2,
                                            color: TempData
                                                    .tempSubCategory[index]
                                                        ['image']
                                                    .isNotEmpty
                                                ? ColorTheme.dangerColor
                                                : Colors.transparent)),
                                    width: 30,
                                    height: 50,
                                    child: CircleAvatar(
                                      backgroundColor: Colors.white,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(50),
                                        child: TempData
                                                .tempSubCategory[index]['image']
                                                .isNotEmpty
                                            ? Image.asset(
                                                TempData.tempSubCategory[index]
                                                    ['image'],
                                                fit: BoxFit.cover,
                                                height: 50,
                                                width: 50,
                                              )
                                            : Icon(
                                                Icons.favorite,
                                                color: ColorTheme.primaryColor,
                                              ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  defaultText(
                                      text: TempData.tempSubCategory[index]
                                          ['name'],
                                      fontWeight: FontWeight.normal,
                                      context: context,
                                      textColor: Colors.black)
                                ],
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            width: 10,
                          );
                        },
                        itemCount: TempData.tempSubCategory.length),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      width: width(context: context, precent: 1),
                      height: height(context: context, precent: 0.71),
                      child: ListView.separated(
                          itemBuilder: (context, index) {
                            if (cart.isEmpty) {
                              for (int i = 0; i < 10; i++) {
                                cart.add(0);
                              }
                            }
                            return Container(
                              width: width(context: context, precent: 1),
                              height: 100,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  SizedBox(
                                    child: Stack(
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          child: Image.asset(
                                            TempData.tempAds[2],
                                            fit: BoxFit.fill,
                                            width: width(
                                                context: context,
                                                precent: 0.25),
                                            height: height(
                                                context: context, precent: 0.9),
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.zero,
                                          height: 30,
                                          width: 30,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  const BorderRadius.only(
                                                      bottomLeft:
                                                          Radius.circular(10),
                                                      topRight:
                                                          Radius.circular(10)),
                                              color: ColorTheme.primaryColor),
                                          child: IconButton(
                                              padding: EdgeInsets.zero,
                                              onPressed: () {},
                                              icon: const Icon(
                                                Icons.favorite_border,
                                                size: 14,
                                                color: Colors.white,
                                              )),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(
                                        top: 5, right: 10),
                                    width:
                                        width(context: context, precent: 0.65),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            defaultText(
                                                text: 'حمص',
                                                context: context,
                                                fontSize: 13,
                                                fontWeight: FontWeight.normal,
                                                textColor: Colors.black),
                                            defaultText(
                                                text: '600 ريال',
                                                context: context,
                                                fontSize: 12,
                                                fontWeight: FontWeight.normal,
                                                textColor: Colors.black),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            const SizedBox(),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 10),
                                              child: InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    cart[index] += 1;
                                                  });

                                                  addToCart(data: {
                                                    'id': index,
                                                    'name': 'حمص',
                                                    'price': '600 ريال',
                                                    'qty': cart[index],
                                                  });
                                                },
                                                child: Container(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 10,
                                                      vertical: 5),
                                                  decoration: BoxDecoration(
                                                      color: cart[index] > 0
                                                          ? Colors.white
                                                          : ColorTheme
                                                              .primaryColor,
                                                      border: Border.all(
                                                          color: ColorTheme
                                                              .primaryColor),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                  child: cart[index] > 0
                                                      ? SizedBox(
                                                          height: height(
                                                              context: context,
                                                              precent: 0.019),
                                                          width: width(
                                                              context: context,
                                                              precent: 0.14),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              InkWell(
                                                                  onTap: () {
                                                                    setState(
                                                                        () {
                                                                      if (cart
                                                                          .isNotEmpty) {
                                                                        cart[index] -=
                                                                            1;
                                                                        addToCart(
                                                                            data: {
                                                                              'id': index,
                                                                              'name': 'حمص',
                                                                              'price': '600 ريال',
                                                                              'qty': cart[index],
                                                                            });
                                                                      } else {
                                                                        cart =
                                                                            [];
                                                                      }
                                                                    });
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      border: Border.all(
                                                                          color:
                                                                              ColorTheme.primaryColor),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5),
                                                                    ),
                                                                    child: Icon(
                                                                      Icons
                                                                          .remove,
                                                                      size: 10,
                                                                      color: ColorTheme
                                                                          .primaryColor,
                                                                    ),
                                                                  )),
                                                              defaultText(
                                                                  text: cart[
                                                                          index]
                                                                      .toString(),
                                                                  context:
                                                                      context,
                                                                  fontSize: 10,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  textColor:
                                                                      ColorTheme
                                                                          .primaryColor),
                                                              InkWell(
                                                                  onTap: () {
                                                                    if (cart
                                                                        .isNotEmpty) {
                                                                      setState(
                                                                          () {
                                                                        cart[index] +=
                                                                            1;
                                                                      });
                                                                      addToCart(
                                                                          data: {
                                                                            'id':
                                                                                index,
                                                                            'name':
                                                                                'حمص',
                                                                            'price':
                                                                                '600 ريال',
                                                                            'qty':
                                                                                cart[index],
                                                                          });
                                                                    } else {
                                                                      cart = [];
                                                                    }
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      border: Border.all(
                                                                          color:
                                                                              ColorTheme.primaryColor),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5),
                                                                    ),
                                                                    child: Icon(
                                                                      Icons.add,
                                                                      size: 10,
                                                                      color: ColorTheme
                                                                          .primaryColor,
                                                                    ),
                                                                  )),
                                                            ],
                                                          ),
                                                        )
                                                      : defaultText(
                                                          text:
                                                              'اضافة الى السلة',
                                                          context: context,
                                                          fontSize: 10,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          textColor:
                                                              Colors.white),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                          separatorBuilder: (context, index) => const SizedBox(
                                height: 10,
                              ),
                          itemCount: 10)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
