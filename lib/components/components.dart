// ignore_for_file: non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:dctorappoitmentye/cubit/cubit.dart';
import 'dart:core';

import 'package:tawsil/components/consts.dart';

Widget defaultButton(
    {required double width,
    required Function() function,
    double textSize = 15,
    required String label,
    Color? buttonColor,
    Color? borderColor,
    Color? iconColor,
    Color TextColor = Colors.white,
    IconData? icon,
    double iconSized = 30,
    double radius = 8.0}) {
  return Container(
      width: width,
      decoration: BoxDecoration(
          color: buttonColor ?? ColorTheme.primaryColor,
          border: Border.all(color: borderColor ?? ColorTheme.primaryColor),
          borderRadius: BorderRadius.circular(radius)),
      child: MaterialButton(
        padding: const EdgeInsets.all(3),
        onPressed: function,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) ...{
              Icon(
                icon,
                size: iconSized,
                color: iconColor ?? Colors.white,
              ),
              const SizedBox(
                width: 5,
              )
            },
            Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: TextColor,
                fontSize: textSize,
                fontWeight: FontWeight.w500,
                overflow: TextOverflow.clip,
              ),
            ),
          ],
        ),
      ));
}

Widget defaultForm(
    {required TextEditingController controller,
    required BuildContext context,
    required TextInputType type,
    IconData? prefixIcon,
    bool isWordRestricted = false,
    bool isEmailValid = false,
    String? hint,
    IconData? sufixIcon,
    Function()? OnTapSufixIcon,
    isClickable = true,
    Function()? onSubmit,
    Function()? onTap,
    List data = const [],
    bool validate = false,
    String validationMessage = 'يجب ادخال الحقل',
    bool isPassword = false,
    bool isHidden = false,
    String? label,
    int minLines = 1,
    int maxLines = 2,
    Color? borderColor,
    bool isDisable = false,
    int? length}) {
  return TextFormField(
    readOnly: isDisable,
    controller: controller,
    obscureText: isHidden == true ? true : false,
    keyboardType: type,
    onTap: onTap,
    minLines: minLines,
    maxLines: maxLines,
    enabled: isClickable,
    maxLength: length,
    validator: validate == true
        ? (value) {
            if (value!.isEmpty) {
              return validationMessage;
            }
            if (isPassword == true && value.length < 8) {
              return 'كلمة السر  ضعيفة';
            }
            if (isPassword == true && value == "123456789") {
              return 'كلمة السر  ضعيفة جداً';
            }

            if (isWordRestricted) {
              int wordCount = value.split(RegExp(r'\s+')).length;

              // If the word count is less than 4, show a message to the user
              if (wordCount < 4) {
                // Show a message to the user
                return 'يرجى كتابة الاسم الرباعي';
              }
              return null;
            }
            return null;
          }
        : null,
    decoration: InputDecoration(
      contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
      iconColor: ColorTheme.primaryColor,
      prefixIcon: Icon(
        prefixIcon,
        color: ColorTheme.primaryColor,
      ),
      suffixIcon: sufixIcon != null
          ? IconButton(
              onPressed: OnTapSufixIcon,
              icon: Icon(
                sufixIcon,
              ),
            )
          : null,
      labelText: label,
      labelStyle: const TextStyle(fontSize: 13),
      hintText: hint,
      hintStyle: TextStyle(color: ColorTheme.primaryColor),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
              style: BorderStyle.solid,
              color: borderColor ?? ColorTheme.primaryColor)),
    ),
  );
}

// Messanger(
//     {required BuildContext context,
//     required String message,
//     bool status = true}) {
//   return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//     content: Text(message),
//     behavior: SnackBarBehavior.floating,
//     backgroundColor:
//         status ? ColorTheme.primaryColor : const Color.fromARGB(255, 191, 50, 40),
//   ));
// }

Future<dynamic> navigateTo(
    {required BuildContext context, required Widget screen}) async {
  return await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => screen,
      ));
}

void navigateReplacementTo(
    {required BuildContext context, required Widget screen}) {
  try {
    Navigator.of(context).popUntil((route) => route.isFirst);
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (BuildContext context) => screen));
  } catch (e) {
    print('Navigtor ERORR is $e');
    SystemNavigator.pop();
  }
}

Widget CircleLoading(
    {Color backgroundColor = Colors.transparent, Color? indicatorColor}) {
  return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: backgroundColor, borderRadius: BorderRadius.circular(8.0)),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child:
              CircularProgressIndicator(color: indicatorColor ?? Colors.white),
        ),
      ));
}

Widget GridViewContainer(
    {required String image,
    required String title,
    required Function() onTap,
    required BuildContext context,
    bool isNetworkImage = true}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      // margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          image: isNetworkImage
              ? DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                    image,
                  ),
                )
              : null,
          boxShadow: [
            BoxShadow(
              color: Colors.grey
                  .withOpacity(0.2), // You can adjust the color and opacity
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(0, 3), // changes the position of the shadow
            ),
          ],
          borderRadius: BorderRadius.circular(20),
          color: Colors.white),
      child: Column(
        mainAxisAlignment: isNetworkImage
            ? MainAxisAlignment.end
            : MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 20,
          ),
          !isNetworkImage
              ? Image.asset(
                  'assets/icons/$image',
                  color: ColorTheme.secondaryColor,
                  height: 50,
                )
              : const SizedBox.shrink(),
          Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.8),
                borderRadius: BorderRadius.circular(20)),
            child: Text(
              title,
              overflow: TextOverflow.fade,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 10,
          )
        ],
      ),
    ),
  );
}

Widget ListViewContainer(
    {required String image,
    required String title,
    required String address,
    required Function() onTap,
    required BuildContext context,
    bool isNetworkImage = true}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.all(10),
      // margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.grey
              .withOpacity(0.05), // You can adjust the color and opacity

          offset: const Offset(0, 3), // changes the position of the shadow
        ),
      ], borderRadius: BorderRadius.circular(10), color: Colors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          !isNetworkImage
              ? Image.asset(
                  'assets/icons/$image',
                  color: ColorTheme.secondaryColor,
                  height: 50,
                )
              : ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.network(
                    image,
                    width: 50,
                    height: 50,
                    frameBuilder:
                        (context, child, frame, wasSynchronouslyLoaded) {
                      return child;
                    },
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) {
                        return child;
                      } else {
                        return Center(
                          child: CircularProgressIndicator(
                            color: ColorTheme.secondaryColor,
                          ),
                        );
                      }
                    },
                    errorBuilder: (context, error, stackTrace) =>
                        const Icon(Icons.info),
                    filterQuality: FilterQuality.low,
                    fit: BoxFit.cover,
                  ),
                ),
          const SizedBox(
            height: 10,
            width: 10,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(5),
                child: Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                  overflow: TextOverflow.fade,
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(5),
                child: Text(
                  address,
                  overflow: TextOverflow.fade,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
            width: 10,
          )
        ],
      ),
    ),
  );
}

Widget defaultText({
  required String text,
  double fontSize = 15,
  Color? textColor,
  FontWeight fontWeight = FontWeight.bold,
  TextAlign align = TextAlign.center,
  required BuildContext context,
}) {
  return Text(
    textAlign: align,
    softWrap: true,
    maxLines: 3,
    text,
    overflow: TextOverflow.clip,
    style: TextStyle(
        color: textColor ?? (ColorTheme.primaryColor),
        fontSize: fontSize,
        fontWeight: fontWeight),
  );
}

double width({required BuildContext context, required double precent}) {
  return MediaQuery.of(context).size.width * precent;
}

double height({required BuildContext context, required double precent}) {
  return MediaQuery.of(context).size.height * precent;
}

Messanger({
  required BuildContext context,
  bool status = true,
  Widget? screen,
  required String message,
  bool isDialog = false,
  bool dismissible = false,
  bool withOtherButtonText = false,
}) {
  // PanaraInfoDialog.showAnimatedGrow(
  //   color: ColorTheme.primaryColor,
  //   context,
  //   title: '',

  //   message: message,
  //   buttonText: 'حسناً',
  //   onTapDismiss: () {
  //     try {
  //       if (screen != null) {
  //         navigateReplacementTo(context: context, screen: screen);
  //       } else {
  //         Navigator.of(context).pop();
  //         if (isDialog) {
  //           Navigator.of(context).pop();
  //         }
  //       }
  //     } catch (e) {
  //       print("onTapDismiss Error is $e");
  //     }
  //   },
  //   panaraDialogType:
  //       status == true ? PanaraDialogType.success : PanaraDialogType.error,
  //   barrierDismissible: true, // optional parameter (default is true)
  // );
}

showWarningDialog({
  required BuildContext context,
  required String title,
  required String message,
  required String confirmMessage,
  required Function onTapConfirm,
}) {
  // PanaraConfirmDialog.showAnimatedGrow(
  //   context,
  //   title: title,
  //   message: message,
  //   confirmButtonText: confirmMessage,
  //   cancelButtonText: 'الغاء',

  //   onTapCancel: () {
  //     try {
  //       Navigator.of(context).pop();
  //     } catch (e) {
  //       print('showWarningDialog Error is $e');
  //     }
  //   },
  //   onTapConfirm: () {
  //     onTapConfirm();
  //   },
  //   panaraDialogType: PanaraDialogType.error,
  //   color: ColorTheme.primaryColor,

  //   barrierDismissible: false, // optional parameter (default is true)
  // );
}
