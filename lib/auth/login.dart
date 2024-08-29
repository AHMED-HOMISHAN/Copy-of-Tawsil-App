// import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
// import 'package:dctorappoitmentye/components/components.dart';
// import 'package:dctorappoitmentye/components/consts.dart';
// import 'package:dctorappoitmentye/cubit/cubit.dart';
// import 'package:dctorappoitmentye/screens/auth/register.dart';
// import 'package:dctorappoitmentye/states/states.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:animate_do/animate_do.dart';
// import 'package:iconly/iconly.dart';
// import 'package:url_launcher/url_launcher.dart';

// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});

//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   var phoneController = TextEditingController();
//   var passwordController = TextEditingController();
//   var formKey = GlobalKey<FormState>();
//   bool isChecked = false;

//   @override
//   void initState() {
//     super.initState();
//     phoneController.addListener(_restrictInput);
//   }

//   void _restrictInput() {
//     String value = phoneController.text;

//     if (value.isNotEmpty) {
//       if (value.length > 1) {
//         if (!RegExp(r'^[7]([13780])').hasMatch(value)) {
//           phoneController.text = value.substring(0, value.length - 1);
//           phoneController.selection = TextSelection.fromPosition(
//             TextPosition(offset: phoneController.text.length),
//           );
//         }
//       } else if (!RegExp(r'^[7]').hasMatch(value)) {
//         phoneController.text = value.substring(0, value.length - 1);
//         phoneController.selection = TextSelection.fromPosition(
//           TextPosition(offset: phoneController.text.length),
//         );
//       }
//     }
//   }

//   @override
//   void dispose() {
//     phoneController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => AppCubit(),
//       child: BlocConsumer<AppCubit, AppStates>(
//         builder: (context, state) {
//           AppCubit cubit = AppCubit.get(context);

//           return Scaffold(
//               backgroundColor: Colors.white,
//               body: SingleChildScrollView(
//                 child: Form(
//                   key: formKey,
//                   child: Column(
//                     children: <Widget>[
//                       Container(
//                         height: 400,
//                         decoration: const BoxDecoration(
//                             image: DecorationImage(
//                                 image:
//                                     AssetImage('assets/icons/background.png'),
//                                 fit: BoxFit.fill)),
//                         child: Stack(
//                           children: <Widget>[
//                             Positioned(
//                               left: 30,
//                               width: 80,
//                               height: 200,
//                               child: FadeInUp(
//                                   duration: const Duration(seconds: 1),
//                                   child: Container(
//                                     decoration: const BoxDecoration(
//                                         image: DecorationImage(
//                                             image: AssetImage(
//                                                 'assets/icons/light-1.png'))),
//                                   )),
//                             ),
//                             Positioned(
//                               left: 140,
//                               width: 80,
//                               height: 150,
//                               child: FadeInUp(
//                                   duration: const Duration(milliseconds: 1200),
//                                   child: Container(
//                                     decoration: const BoxDecoration(
//                                         image: DecorationImage(
//                                             image: AssetImage(
//                                                 'assets/icons/light-2.png'))),
//                                   )),
//                             ),
//                             Positioned(
//                               right: 40,
//                               top: 40,
//                               width: 80,
//                               height: 150,
//                               child: FadeInUp(
//                                   duration: const Duration(milliseconds: 1300),
//                                   child: Container(
//                                     decoration: const BoxDecoration(
//                                         image: DecorationImage(
//                                             image: AssetImage(
//                                                 'assets/icons/clock.png'))),
//                                   )),
//                             ),
//                             Positioned(
//                               child: FadeInUp(
//                                   duration: const Duration(milliseconds: 1600),
//                                   child: Container(
//                                     margin: const EdgeInsets.only(top: 50),
//                                     child: const Center(
//                                       child: Text(
//                                         "تسجيل الدخول",
//                                         style: TextStyle(
//                                             color: Colors.white,
//                                             fontSize: 30,
//                                             fontWeight: FontWeight.w800),
//                                       ),
//                                     ),
//                                   )),
//                             )
//                           ],
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(30.0),
//                         child: Column(
//                           children: <Widget>[
//                             FadeInUp(
//                                 duration: const Duration(milliseconds: 1800),
//                                 child: Column(
//                                   children: <Widget>[
//                                     SizedBox(
//                                       height: 75,
//                                       child: TextFormField(
//                                         controller: phoneController,
//                                         keyboardType: TextInputType.number,
//                                         maxLength: 9,
//                                         validator: (value) {
//                                           if (value!.isEmpty) {
//                                             return "يجب ادخال رقم الهاتف";
//                                           }
//                                           if (value.length < 9 ||
//                                               value.length > 10) {
//                                             return 'الرقم غير صحيح';
//                                           }
//                                           return null;
//                                         },
//                                         decoration: InputDecoration(
//                                             prefixIcon: Icon(
//                                               IconlyBroken.call,
//                                               color: primaryColor,
//                                             ),
//                                             label: const Text('رقم الهاتف'),
//                                             labelStyle: TextStyle(fontSize: 13),
//                                             border: OutlineInputBorder(
//                                                 borderRadius:
//                                                     BorderRadius.circular(10),
//                                                 borderSide: const BorderSide(
//                                                   style: BorderStyle.solid,
//                                                   color: Color.fromRGBO(
//                                                       143, 148, 251, 1),
//                                                 )),
//                                             hintText: "7xxxxxxxx",
//                                             hintStyle: TextStyle(
//                                                 fontSize: 13,
//                                                 color: Colors.grey[700])),
//                                       ),
//                                     ),
//                                     const SizedBox(
//                                       height: 20,
//                                     ),
//                                     SizedBox(
//                                       height: 75,
//                                       child: TextFormField(
//                                         controller: passwordController,
//                                         obscureText: cubit.isPassword,
//                                         validator: (value) {
//                                           if (value!.isEmpty) {
//                                             return "يجب ادخال كلمة السر ";
//                                           }
//                                           if (value.length < 9) {
//                                             return 'كلمة السر قصيرة جدا';
//                                           }

//                                           return null;
//                                         },
//                                         decoration: InputDecoration(
//                                             contentPadding:
//                                                 const EdgeInsets.symmetric(
//                                                     horizontal: 15,
//                                                     vertical: 7),
//                                             label: const Text("كلمة السر"),
//                                             labelStyle: TextStyle(fontSize: 13),
//                                             border: OutlineInputBorder(
//                                                 gapPadding: 0,
//                                                 borderRadius:
//                                                     BorderRadius.circular(10),
//                                                 borderSide: const BorderSide(
//                                                   style: BorderStyle.solid,
//                                                   color: Color.fromRGBO(
//                                                       143, 148, 251, 1),
//                                                 )),
//                                             prefixIcon: Icon(
//                                               IconlyBroken.lock,
//                                               color: primaryColor,
//                                             ),
//                                             hintText: " ******* ",
//                                             suffix: Padding(
//                                               padding:
//                                                   const EdgeInsets.symmetric(
//                                                       horizontal: 10,
//                                                       vertical: 10),
//                                               child: InkWell(
//                                                 onTap: () {
//                                                   cubit.showOrhideSuffixIcon();
//                                                 },
//                                                 child: Icon(
//                                                   cubit.suffixIcon,
//                                                   size: 20,
//                                                 ),
//                                               ),
//                                             ),
//                                             hintStyle: TextStyle(
//                                                 fontSize: 13,
//                                                 color: Colors.grey[700])),
//                                       ),
//                                     )
//                                   ],
//                                 )),
//                             const SizedBox(
//                               height: 20,
//                             ),
//                             FadeInUp(
//                               duration: const Duration(milliseconds: 1900),
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Checkbox(
//                                       onChanged: (value) {
//                                         setState(() {
//                                           isChecked = value ?? false;
//                                         });
//                                       },
//                                       value: isChecked,
//                                       side: BorderSide(
//                                           color: isChecked
//                                               ? primaryColor
//                                               : Colors.red)),
//                                   const Text('بالتسجيل فإنك توافق على '),
//                                   InkWell(
//                                     onTap: () async {
//                                       if (!await launchUrl(Uri.parse(
//                                           'https://sites.google.com/view/doctor-appoitement-ye/%D8%A7%D9%84%D8%B5%D9%81%D8%AD%D8%A9-%D8%A7%D9%84%D8%B1%D8%A6%D9%8A%D8%B3%D9%8A%D8%A9'))) {
//                                         throw Exception('Could not launch url');
//                                       }
//                                     },
//                                     child: Text(
//                                       'الشروط والاحكام',
//                                       style: TextStyle(
//                                         color: primaryColor,
//                                         fontWeight: FontWeight.w700,
//                                       ),
//                                     ),
//                                   )
//                                 ],
//                               ),
//                             ),
//                             FadeInUp(
//                                 duration: const Duration(milliseconds: 1900),
//                                 child: InkWell(
//                                     onTap: () {
//                                       if (formKey.currentState!.validate()) {
//                                         isChecked
//                                             ? cubit.userLogin(
//                                                 context: context,
//                                                 password:
//                                                     passwordController.text,
//                                                 phonenumber:
//                                                     phoneController.text)
//                                             : {};
//                                       }
//                                     },
//                                     child: ConditionalBuilder(
//                                       condition: state is! AppLoginLoadingState,
//                                       builder: (context) => Container(
//                                         height: 50,
//                                         decoration: BoxDecoration(
//                                           borderRadius:
//                                               BorderRadius.circular(10),
//                                           gradient: isChecked
//                                               ? const LinearGradient(colors: [
//                                                   Color.fromRGBO(
//                                                       136, 141, 250, 1),
//                                                   Color.fromRGBO(
//                                                       143, 148, 251, 0.772),
//                                                 ])
//                                               : LinearGradient(colors: [
//                                                   Colors.grey.withOpacity(0.5),
//                                                   Colors.grey.withOpacity(0.5),
//                                                 ]),
//                                         ),
//                                         child: const Center(
//                                           child: Text(
//                                             "تسجيل الدخول",
//                                             style: TextStyle(
//                                                 color: Colors.white,
//                                                 fontWeight: FontWeight.bold),
//                                           ),
//                                         ),
//                                       ),
//                                       fallback: (context) => CircleLoading(
//                                           backgroundColor: primaryColor),
//                                     ))),
//                             const SizedBox(
//                               height: 70,
//                             ),
//                             FadeInUp(
//                                 duration: const Duration(milliseconds: 2000),
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     const Text(
//                                       "  ليس لديك حساب؟ ",
//                                       style: TextStyle(color: Colors.black),
//                                     ),
//                                     const SizedBox(
//                                       width: 5,
//                                     ),
//                                     InkWell(
//                                       onTap: () {
//                                         navigateTo(
//                                             context: context,
//                                             screen: const RegisterScreen());
//                                       },
//                                       child: const Text(
//                                         " انشاء حساب جديد",
//                                         style: TextStyle(
//                                             fontWeight: FontWeight.w700,
//                                             color: Color.fromRGBO(
//                                                 143, 148, 251, 1)),
//                                       ),
//                                     ),
//                                   ],
//                                 )),
//                             verticalSpacing,
//                           ],
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ));
//         },
//         listener: (context, state) {},
//       ),
//     );
//   }
// }
