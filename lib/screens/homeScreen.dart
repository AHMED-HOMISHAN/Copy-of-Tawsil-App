import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:tawsil/components/components.dart';
import 'package:tawsil/components/consts.dart';
import 'package:tawsil/screens/foodScreen.dart';
import 'package:tawsil/screens/profileScreen.dart';
import 'package:tawsil/screens/searchScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ScrollController _scrollController;
  bool lastStatus = true;
  int selectdTabIndex = 0;
  int selectdcategoryIndex = 0;

  bool get isShrink {
    return _scrollController.hasClients &&
        _scrollController.offset > (300 - kToolbarHeight);
  }

  _scrollListener() {
    if (isShrink != lastStatus) {
      setState(() {
        lastStatus = isShrink;
      });
    }
  }

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    super.dispose();
  }

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
                        defaultText(
                            text: AppData.appName,
                            context: context,
                            fontSize: 25,
                            textColor: Colors.white),
                        Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  navigateTo(
                                      context: context,
                                      screen: const SearchScreen());
                                },
                                icon: const Icon(
                                  Icons.search,
                                  color: Colors.white,
                                )),
                            IconButton(
                                onPressed: () {
                                  navigateTo(
                                      context: context,
                                      screen: const ProfileScreen());
                                },
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
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: ColorTheme.scaffoldColor,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              height: height(context: context, precent: 0.9),
              width: width(context: context, precent: 1),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(right: 15),
                    height: height(context: context, precent: 0.04),
                    width: width(context: context, precent: 1),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "أوقات الدوام من 7:30 صباحاً إلى 10:30 مساءً. ",
                          style: TextStyle(fontSize: 12),
                        ),
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
                                            color: ColorTheme.dangerColor)),
                                    width: 30,
                                    height: 50,
                                    child: CircleAvatar(
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(50),
                                        child: Image.asset(
                                          TempData.tempCategory[index]['image'],
                                          fit: BoxFit.cover,
                                          height: 50,
                                          width: 50,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  defaultText(
                                      text: TempData.tempCategory[index]
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
                        itemCount: TempData.tempCategory.length),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: width(context: context, precent: 1),
                    height: height(context: context, precent: 0.79),
                    child: CustomScrollView(
                      slivers: [
                        SliverAppBar(
                            // collapsedHeight: 10,
                            expandedHeight: 250,
                            backgroundColor: ColorTheme.scaffoldColor,
                            flexibleSpace: FlexibleSpaceBar(
                              background: Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                height: height(context: context, precent: 0.3),
                                width: width(context: context, precent: 1),
                                child: ListView.separated(
                                    shrinkWrap: true,
                                    physics: const BouncingScrollPhysics(),
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) => Container(
                                          width: 250,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                          child: Stack(
                                            alignment: Alignment.bottomRight,
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                child: Image.asset(
                                                  TempData.tempAds[index],
                                                  width: width(
                                                      context: context,
                                                      precent: 1),
                                                  height: height(
                                                      context: context,
                                                      precent: 1),
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                              InkWell(
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.all(5),
                                                  decoration: BoxDecoration(
                                                      color: Colors.black
                                                          .withOpacity(0.3),
                                                      borderRadius:
                                                          const BorderRadius
                                                              .only(
                                                              bottomRight:
                                                                  Radius
                                                                      .circular(
                                                                          10),
                                                              topLeft: Radius
                                                                  .circular(
                                                                      10))),
                                                  child: const Icon(
                                                    Icons.zoom_in,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                    separatorBuilder: (context, index) =>
                                        const SizedBox(
                                          width: 10,
                                        ),
                                    itemCount: TempData.tempAds.length),
                              ),
                            )),
                        SliverToBoxAdapter(
                          child: Container(
                            color: ColorTheme.scaffoldColor,
                            height: height(context: context, precent: 0.8),
                            width: width(context: context, precent: 1),
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: ColorTheme.scaffoldColor,
                                  ),
                                  height:
                                      height(context: context, precent: 0.06),
                                  width: width(context: context, precent: 1),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      for (int index = 0;
                                          index < TempData.tempTab.length;
                                          index++)
                                        InkWell(
                                          onTap: () {
                                            setState(() {
                                              selectdTabIndex = index;
                                            });
                                          },
                                          child: Container(
                                            width: width(
                                                context: context,
                                                precent: 0.23),
                                            padding: const EdgeInsets.all(10),
                                            decoration: selectdTabIndex == index
                                                ? BoxDecoration(
                                                    // borderRadius: (index ==
                                                    //         (TempData.tempTab
                                                    //                 .length -
                                                    //             1))
                                                    //     ? const BorderRadius
                                                    //         .only(
                                                    //         topLeft:
                                                    //             Radius.circular(
                                                    //                 15),
                                                    //       )
                                                    //     : (index == 0)
                                                    //         ? const BorderRadius
                                                    //             .only(
                                                    //             topRight: Radius
                                                    //                 .circular(
                                                    //                     15))
                                                    //         : null,
                                                    color: Colors.grey
                                                        .withOpacity(0.05),
                                                    border: Border(
                                                        bottom: BorderSide(
                                                            width: 3,
                                                            color: ColorTheme
                                                                .primaryColor)))
                                                : null,
                                            child: defaultText(
                                                text: TempData.tempTab[index],
                                                context: context,
                                                fontSize: 13,
                                                fontWeight: FontWeight.normal),
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                    child: ListView.separated(
                                        padding: EdgeInsets.zero,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemBuilder: (context, index) =>
                                            InkWell(
                                              onTap: () {
                                                navigateTo(
                                                    context: context,
                                                    screen: FoodScreen(
                                                      name: TempData
                                                          .tempResturant[index]
                                                              ['name']
                                                          .toString(),
                                                      rate: TempData
                                                          .tempResturant[index]
                                                              ['rates']
                                                          .toString(),
                                                    ));
                                              },
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 10,
                                                        vertical: 0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        TempData.tempResturant[
                                                                    index]
                                                                    ['image']
                                                                .toString()
                                                                .isNotEmpty
                                                            ? Image.asset(
                                                                TempData.tempResturant[
                                                                        index]
                                                                    ['image'],
                                                                width: 60,
                                                              )
                                                            : Icon(
                                                                Icons.info,
                                                                color: ColorTheme
                                                                    .dangerColor,
                                                              ),
                                                        RatingBarIndicator(
                                                          rating: double.parse(
                                                              TempData
                                                                  .tempResturant[
                                                                      index]
                                                                      ['rates']
                                                                  .toString()),
                                                          itemCount: 5,
                                                          itemSize: 13.0,
                                                          physics:
                                                              const BouncingScrollPhysics(),
                                                          itemBuilder:
                                                              (context, _) =>
                                                                  const Icon(
                                                            Icons.star,
                                                            color: Colors.amber,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      width: width(
                                                          context: context,
                                                          precent: 0.6),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        children: [
                                                          defaultText(
                                                              text:
                                                                  TempData.tempResturant[
                                                                          index]
                                                                      ['name'],
                                                              fontSize: 12,
                                                              textColor:
                                                                  Colors.black,
                                                              context: context),
                                                          defaultText(
                                                              text: TempData
                                                                          .tempResturant[
                                                                      index]
                                                                  ['address'],
                                                              textColor:
                                                                  Colors.black,
                                                              fontSize: 10,
                                                              context: context)
                                                        ],
                                                      ),
                                                    ),
                                                    Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Container(
                                                          padding:
                                                              const EdgeInsets
                                                                  .symmetric(
                                                                  horizontal:
                                                                      14,
                                                                  vertical: 8),
                                                          decoration: BoxDecoration(
                                                              color: ColorTheme
                                                                  .dangerColor,
                                                              borderRadius: const BorderRadius
                                                                  .only(
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          10),
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          10))),
                                                          child: defaultText(
                                                              fontSize: 10,
                                                              textColor:
                                                                  Colors.white,
                                                              text: TempData.tempResturant[
                                                                          index]
                                                                      ['isOpen']
                                                                  ? 'مفتوح'
                                                                  : 'مغلق',
                                                              context: context),
                                                        ),
                                                        IconButton(
                                                            onPressed: () {},
                                                            icon: Icon(
                                                              Icons
                                                                  .favorite_border,
                                                              color: ColorTheme
                                                                  .dangerColor,
                                                            ))
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                        separatorBuilder: (context, index) =>
                                            const Column(
                                              children: [
                                                SizedBox(
                                                  height: 6,
                                                ),
                                                Divider(
                                                  height: 1,
                                                  color: Colors.black26,
                                                ),
                                              ],
                                            ),
                                        itemCount:
                                            TempData.tempResturant.length))
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
