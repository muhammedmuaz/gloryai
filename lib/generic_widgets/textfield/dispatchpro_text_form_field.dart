// import 'package:dispatchpro_v2/generic_widgets/textfield/text_field_label.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import '../../const/data_const.dart';
// import '../../const/design_const.dart';
// import '../../utils/screen_helper.dart';

// typedef TextFieldOnChangeCallBack = void Function(String text);
// typedef TextFieldOnFieldSubmittedCallBack = void Function(String text);
// typedef TextFieldOnTapCallBack = void Function();
// typedef TextFieldOnEditingCallBack = void Function();
// typedef TextFieldOnTapOutSideCallBack = void Function(PointerDownEvent a);

// class DispatchProTextFormField extends StatelessWidget {
//   final int? maxLines;
//   final String hint;
//   final VoidCallback? buttonOnTap;
//   final String? buttonText;
//   final String? label;
//   final bool isSecure;
//   final bool isEmail;
//   final bool isPassword;
//   final bool isPhoneNumber;
//   final bool isConfirmPassword;
//   final bool autoFocus;
//   final String? countryCode;
//   final Widget? prefixIcon;
//   final Widget? suffixIcon;
//   final bool fillColorWhite;
//   final bool isShowCursor;
//   final bool isOtpField;
//   final bool removePrefixPadding;
//   final bool isReadOnly;
//   final TextInputType textInputType;
//   final TextInputAction action;
//   final String validationText;
//   final bool isValidate;
//   final TextEditingController textEditingController;
//   final InputBorder? border;
//   final TextFieldOnChangeCallBack? onChanged;
//   final TextFieldOnFieldSubmittedCallBack? onFieldSubmittedCallBack;
//   final TextFieldOnTapCallBack? onTapCallBack;
//   final TextFieldOnEditingCallBack? onEditingCallBack;
//   final TextFieldOnTapOutSideCallBack? onTapOutsideCallBack;
//   final List<TextInputFormatter>? inputFormatters;
//   final double prefixPadding;
//   final bool showErrorBorder;
//   final bool showFocusedBorder;
//   final bool isRequired;
//   final EdgeInsetsGeometry? contentPadding;
//   final BoxConstraints? prefixBoxConstraints;

//   const DispatchProTextFormField({
//     super.key,
//     this.maxLines = 1,
//     this.prefixPadding = 16,
//     required this.textEditingController,
//     this.hint = '',
//     this.buttonOnTap,
//     this.prefixBoxConstraints,
//     this.buttonText,
//     this.label,
//     this.isRequired = false,
//     this.isSecure = false,
//     this.isEmail = false,
//     this.isPhoneNumber = false,
//     this.autoFocus = false,
//     this.countryCode = "+1",
//     this.isPassword = false,
//     this.isConfirmPassword = false,
//     this.onTapCallBack,
//     this.onEditingCallBack,
//     this.isOtpField = false, //used in max length controlling as well
//     this.onTapOutsideCallBack,
//     this.prefixIcon,
//     this.suffixIcon,
//     this.action = TextInputAction.next,
//     this.isShowCursor = true,
//     this.isReadOnly = false,
//     this.onChanged,
//     this.onFieldSubmittedCallBack,
//     this.textInputType = TextInputType.text,
//     this.validationText = 'This field is required.',
//     this.fillColorWhite = false,
//     this.isValidate = true,
//     this.removePrefixPadding = false,
//     this.inputFormatters,
//     this.showErrorBorder = true,
//     this.showFocusedBorder = true,
//     this.contentPadding = EdgeInsets.zero,
//     this.border,
//   });

//   InputBorder _errorBorder(BuildContext context) {
//     return OutlineInputBorder(
//       borderRadius: BorderRadius.circular(
//           isOtpField ? 40.0 : DataConstants.kHighBorderRadius),
//       borderSide: BorderSide(
//           color: isOtpField
//               ? DesignConstants.kGreyBorderColor
//               : DesignConstants.kErrorColor,
//           width: DataConstants.kBorderHighThickness),
//     );
//   }

//   InputBorder _focusBorder(BuildContext context) {
//     return OutlineInputBorder(
//       borderRadius: BorderRadius.circular(
//           isOtpField ? 40.0 : DataConstants.kHighBorderRadius),
//       borderSide: BorderSide(
//           color: isOtpField
//               ? DesignConstants.kGreyBorderColor
//               : DesignConstants.kBorderColor,
//           width: DataConstants.kBorderHighThickness),
//     );
//   }

//   InputBorder _border(BuildContext context) {
//     return OutlineInputBorder(
//       borderRadius: BorderRadius.circular(
//           isOtpField ? 40.0 : DataConstants.kHighBorderRadius),
//       borderSide: BorderSide(
//           color: isOtpField
//               ? DesignConstants.kGreyBorderColor
//               : DesignConstants.kBorderColor,
//           width: DataConstants.kBorderHighThickness),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         if (label != null)
//           TextFieldLabel(
//             label: label!,
//             isRequired: isRequired,
//             buttonOnTap: buttonOnTap,
//             buttonText: buttonText,
//           ),
//           const SizedBox(height: 3,),
//         Container(
//           decoration: BoxDecoration(
//           color: Colors.white,
//             boxShadow: const [
//               BoxShadow(
//                 color: Color(
//                     0x1A000000), // Hexadecimal color with opacity (#0000001A)
//                 offset:
//                     Offset(0, 4), // Horizontal and vertical offset: (0px, 4px)
//                 blurRadius: 10, // Blur radius: 30px
//                 spreadRadius: 0, // Spread radius: 0px
//               ),
//             ],
//             borderRadius: BorderRadius.circular(8),
//           ),
//           child: TextFormField(
//             maxLength: isOtpField ? 1 : null,
//             textAlign: isOtpField ? TextAlign.center : TextAlign.start,
//             inputFormatters: inputFormatters,
//             autofocus: autoFocus,
//             onTap: onTapCallBack,
//             onEditingComplete: onEditingCallBack,
//             onTapOutside: onTapOutsideCallBack,
//             onFieldSubmitted: onFieldSubmittedCallBack,
//             textInputAction: action,
//             cursorColor: Colors.grey,
//             validator: (value) {
//               if (isValidate) {
//                 if (value == null || value.trim().isEmpty) {
//                   return validationText;
//                 } else if (isEmail && value.trim().isNotEmpty) {
//                   final RegExp regex = RegExp(
//                     r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,}$',
//                     caseSensitive: false,
//                     multiLine: false,
//                   );
//                   if (!regex.hasMatch(value.trim())) {
//                     return 'Invalid email';
//                   }
//                 } else if (isPassword && value.trim().isNotEmpty) {
//                   // Check for at least one uppercase letter
//                   final upperCaseRegex = RegExp(r'[A-Z]');
//                   final lowerCaseRegex = RegExp(r'[a-z]');

//                   // Check for at least one special character (non-alphanumeric)
//                   final specialCharacterRegex =
//                       RegExp(r'[!@#\$%^&*(),.?":{}|<>]');
//                   // Check for at least one digit
//                   final digitRegex = RegExp(r'[0-9]');

//                   if (value.trim().length < 6) {
//                     return 'Password minimum length is 6';
//                   } else if (!upperCaseRegex.hasMatch(value.trim())) {
//                     return 'Password must have at least one uppercase';
//                   } else if (!lowerCaseRegex.hasMatch(value.trim())) {
//                     return 'Password must have at least one lowercase';
//                   } else if (!specialCharacterRegex.hasMatch(value.trim())) {
//                     return 'Password must have at least one special character';
//                   } else if (!digitRegex.hasMatch(value.trim())) {
//                     return 'Password must have at least one number';
//                   }
//                 } else if (isPhoneNumber && value.trim().isNotEmpty) {
//                   final RegExp numberRegExp = RegExp(r'^[0-9]*$');
//                   if (!numberRegExp.hasMatch(value.trim())) {
//                     return 'Invalid phone number';
//                   } else if (countryCode == "+1") {
//                     if (value.trim().length != 11) {
//                       return 'Phone number length must be 11';
//                     }
//                   } else if (countryCode == "+92") {
//                     if (value.trim().length != 10) {
//                       return 'Phone number length must be 10';
//                     }
//                   } else if (countryCode == "+966") {
//                     if (value.trim().length != 7) {
//                       return 'Phone number length must be 7';
//                     }
//                   }
//                 }
//                 return null;
//               }
//               return null;
//             },
//             maxLines: maxLines,
//             showCursor: isShowCursor,
//             autocorrect: false,
//             controller: textEditingController,
//             readOnly: isReadOnly,
//             obscureText: isSecure,
//             keyboardType: textInputType,
//             style: isOtpField
//                 ? Theme.of(context).textTheme.headlineMedium
//                 : Theme.of(context).textTheme.displayMedium!.copyWith(
//                     color: DesignConstants.kTextFieldTextColor,
//                     fontWeight: FontWeight.w300,
//                     fontSize: 12),
//             decoration: InputDecoration(
//               counterText: '',
//               constraints: isOtpField
//                   ? BoxConstraints(
//                       maxHeight: ScreenHelper.getScreenWidth(context) * 0.12,
//                       maxWidth: ScreenHelper.getScreenWidth(context) * 0.12,
//                     )
//                   : null,
//               isDense: false,
//               filled: fillColorWhite,
//               prefix: isOtpField || removePrefixPadding
//                   ? null
//                   : Padding(
//                       padding: EdgeInsets.only(left: prefixPadding),
//                     ),
//               fillColor: fillColorWhite
//                   ? DesignConstants.kBorderColor.withOpacity(0.2)
//                   : Colors.white,
//               contentPadding: contentPadding,
//               border: border ?? _border(context),
//               focusedErrorBorder: border ?? _focusBorder(context),
//               focusedBorder: border ?? _focusBorder(context),
//               errorBorder: border ?? _errorBorder(context),
//               enabledBorder: border ?? _border(context),
//               hintText: hint,
//               errorStyle: Theme.of(context).textTheme.labelSmall!.copyWith(
//                   color: DesignConstants.kErrorColor,
//                   letterSpacing: 0.6,
//                   fontWeight: FontWeight.w300,
//                   fontSize: 12),
//               errorMaxLines: 1,
//               hintStyle: Theme.of(context).textTheme.displayMedium!.copyWith(
//                   color: DesignConstants.kGreyBorderColor,
//                   fontWeight: FontWeight.w300,
//                   fontSize: 12),
//               prefixIcon: prefixIcon,
//               prefixIconConstraints: prefixBoxConstraints,
//               suffixIcon: suffixIcon,
//             ),
//             onChanged: (text) => onChanged == null ? () {} : onChanged!(text),
//           ),
//         ),
//       ],
//     );
//   }
// }

// class DispatchProAuthenticationFields extends StatelessWidget {
//   final TextFieldOnChangeCallBack? onChanged;
//   final TextFieldOnFieldSubmittedCallBack? onFieldSubmittedCallBack;
//   final TextFieldOnTapCallBack? onTapCallBack;
//   final TextFieldOnEditingCallBack? onEditingCallBack;
//   final TextFieldOnTapOutSideCallBack? onTapOutsideCallBack;
//   final TextEditingController textEditingController;
//   final String labelText;
//   final bool isSecure;
//   final String hintText;
//   final Widget? prefixIcon;
//   final Widget? suffixIcon; // Added suffixIcon
//   final TextInputType keyboardType;
//   final String validationText;
//   final bool isValidate;
//   final List<TextInputFormatter>? inputFormatters;
//   final bool isPassword;
//   final bool isEmail;

//   const DispatchProAuthenticationFields({
//     super.key,
//     required this.textEditingController,
//     this.labelText = '',
//     this.hintText = '',
//     this.onChanged,
//     this.onFieldSubmittedCallBack,
//     this.onTapCallBack,
//     this.onTapOutsideCallBack,
//     this.isValidate = true,
//     this.validationText = 'This field is required.',
//     this.onEditingCallBack,
//     this.isSecure = false,
//     this.inputFormatters,
//     this.prefixIcon,
//     this.suffixIcon, // Added suffixIcon
//     this.keyboardType = TextInputType.text,
//     this.isPassword = false,
//     this.isEmail = false,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       controller: textEditingController,
//       inputFormatters: inputFormatters,
//       maxLines: 1,
//       obscureText: isSecure,
//       onTap: onTapCallBack,
//       onEditingComplete: onEditingCallBack,
//       onFieldSubmitted: onFieldSubmittedCallBack,
//       onTapOutside: onTapOutsideCallBack,
//       keyboardType: keyboardType,
//       style: Theme.of(context).textTheme.bodyMedium!.copyWith(
//             color: DesignConstants.kDarkTextColor,
//           ),
//       validator: (value) {
//         if (isValidate) {
//           if (value == null || value.trim().isEmpty) {
//             return validationText;
//           } else if (isEmail && value.trim().isNotEmpty) {
//             final RegExp regex = RegExp(
//               r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,}$',
//               caseSensitive: false,
//               multiLine: false,
//             );
//             if (!regex.hasMatch(value.trim())) {
//               return 'Invalid email';
//             }
//           } else if (isPassword && value.trim().isNotEmpty) {
//             final upperCaseRegex = RegExp(r'[A-Z]');
//             final lowerCaseRegex = RegExp(r'[a-z]');
//             final specialCharacterRegex = RegExp(r'[!@#\$%^&*(),.?":{}|<>]');
//             final digitRegex = RegExp(r'[0-9]');

//             if (value.trim().length < 6) {
//               return 'Password minimum length is 6';
//             } else if (!upperCaseRegex.hasMatch(value.trim())) {
//               return 'Password must have at least one uppercase';
//             } else if (!lowerCaseRegex.hasMatch(value.trim())) {
//               return 'Password must have at least one lowercase';
//             } else if (!specialCharacterRegex.hasMatch(value.trim())) {
//               return 'Password must have at least one special character';
//             } else if (!digitRegex.hasMatch(value.trim())) {
//               return 'Password must have at least one number';
//             }
//           }
//           return null;
//         }
//         return null;
//       },
//       decoration: InputDecoration(
//         fillColor: Colors.white,
//         filled: true,
//         prefixIcon: prefixIcon,
//         suffixIcon: Padding(
//             padding: const EdgeInsets.only(top: 20.0), child: suffixIcon),
//         prefixIconConstraints: const BoxConstraints(
//           minWidth: 55,
//         ),
//         floatingLabelBehavior: FloatingLabelBehavior.auto,
//         labelText: labelText,
//         hintText: hintText,
//         labelStyle: Theme.of(context).textTheme.labelMedium!.copyWith(
//               color: const Color(0xff838383),
//               fontWeight: FontWeight.w400,
//               fontSize: 17,
//             ),
//         enabledBorder: InputBorder.none,
//         border: InputBorder.none,
//         errorBorder: InputBorder.none,
//         disabledBorder: InputBorder.none,
//         focusedErrorBorder: InputBorder.none,
//         focusedBorder: const UnderlineInputBorder(
//           borderSide: BorderSide(
//             color: DesignConstants.kPrimaryColor,
//             width: 1,
//           ),
//         ),
//         contentPadding: const EdgeInsets.symmetric(
//           vertical: 20,
//         ),
//         hintStyle: Theme.of(context).textTheme.labelMedium!.copyWith(
//               color: DesignConstants.kDarkTextColor.withOpacity(0.5),
//             ),
//       ),
//     );
//   }
// }
