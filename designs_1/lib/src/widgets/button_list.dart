import 'package:flutter/material.dart';

class ButtonList extends StatelessWidget {
  final IconData icon;
  final String title;
  final List<Color> backgroundColors;
  final Color textColor;
  final Function() onPressed;
  final EdgeInsets margin;

  const ButtonList({
    super.key,
    required this.icon,
    required this.title,
    required this.onPressed,
    this.backgroundColors = const [Colors.indigo],
    this.textColor = Colors.white,
    this.margin = const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: margin,
        width: double.infinity,
        decoration: BoxDecoration(
          color: backgroundColors[0],
          gradient: backgroundColors.length > 1
              ? LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: backgroundColors,
                )
              : null,
          boxShadow: const [
            BoxShadow(
              color: Colors.black38,
              blurRadius: 10,
              spreadRadius: -5,
              offset: Offset(0, 6),
            ),
          ],
          borderRadius: const BorderRadius.all(Radius.circular(15)),
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          child: Stack(
            children: [
              Positioned(
                top: -20,
                right: -20,
                child: Icon(
                  icon,
                  color: textColor.withOpacity(0.2),
                  size: 150,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Wrap(
                        spacing: 15,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Icon(icon, color: textColor, size: 30),
                          Text(
                            title,
                            style: TextStyle(
                              color: textColor,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: textColor,
                      size: 20,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
