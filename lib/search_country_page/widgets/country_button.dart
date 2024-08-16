import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CountryButton extends StatefulWidget {
  String? CountryName;
  CountryButton({super.key, required this.CountryName});

  @override
  State<CountryButton> createState() => _CountryButtonState();
}

class _CountryButtonState extends State<CountryButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        minimumSize: const Size(50, 70),
                        backgroundColor: const Color(0xFFFFFFFF).withOpacity(0.36),
                        alignment: Alignment.centerLeft,
                        shape: const RoundedRectangleBorder(
                            borderRadius:  BorderRadius.all(
                          Radius.circular(20),
                        )),
                      ),
                      child: Text(
                        '${widget.CountryName}',
                        style: const TextStyle(
                          color: Color(0xFF303345),
                        ),
                      ),
                    );
  }
}
