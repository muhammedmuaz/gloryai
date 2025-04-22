import 'package:flutter/material.dart';
import 'package:gloryai/services/helper_widgets/add_height.dart';
import '../../const/design_const.dart';

class TextFieldLabel extends StatelessWidget {
  final String label;
  final bool isRequired;
  final String? buttonText;
  final VoidCallback? buttonOnTap;
  const TextFieldLabel(
      {super.key,
      required this.label,
      this.isRequired = false,
      this.buttonText,
      this.buttonOnTap});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.labelMedium!.copyWith(color: Colors.black);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: RichText(
                text: TextSpan(children: [
                  TextSpan(
                    text: label,
                    style: 
                    Theme.of(context).textTheme.labelMedium!.copyWith(
                      fontWeight: FontWeight.w600,
                        fontSize: 12,
                        color: Colors.black
                    ),
                    
                  ),
                  if (isRequired)
                    TextSpan(
                      text: ' *',
                      style: textStyle.copyWith(
                        color: DesignConstants.kPrimaryColor,
                      ),
                    ),
                ]),
              ),
            ),
            // if (buttonText != null)
            // HalalTextButton(
            //   label: buttonText!,
            //   onTap: buttonOnTap ?? () {},
            //   isUnderline: true,
            // ),
          ],
        ),
        const AddHeight(0.01),
      ],
    );
  }
}
