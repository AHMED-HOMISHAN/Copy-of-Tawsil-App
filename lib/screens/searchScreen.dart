import 'package:flutter/material.dart';
import 'package:tawsil/components/components.dart';
import 'package:tawsil/components/consts.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
        children: [
          Container(
            height: height(context: context, precent: 0.09),
            decoration: BoxDecoration(color: ColorTheme.primaryColor),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.close_rounded,
                      color: Colors.white,
                    )),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  width: width(context: context, precent: 0.7),
                  height: height(context: context, precent: 1),
                  child: TextField(
                    onChanged: (value) async {
                      setState(() {
                        isLoading = true;
                      });
                      await Future.delayed(const Duration(milliseconds: 2000),
                          () {
                        setState(() {
                          isLoading = false;
                        });
                      });
                    },
                    controller: searchController,
                    cursorColor: Colors.white,
                    style: TextStyle(color: Colors.white.withOpacity(0.8)),
                    decoration: InputDecoration(
                        hintText: "بحث",
                        labelStyle:
                            TextStyle(color: Colors.white.withOpacity(0.8)),
                        hintStyle:
                            TextStyle(color: Colors.white.withOpacity(0.8)),
                        fillColor: Colors.white,
                        focusColor: Colors.white,
                        hoverColor: Colors.white),
                  ),
                ),
                isLoading
                    ? SizedBox(
                        height: width(context: context, precent: 0.08),
                        width: width(context: context, precent: 0.08),
                        child: CircleLoading(),
                      )
                    : SizedBox()
              ],
            ),
          )
        ],
      )),
    );
  }
}
