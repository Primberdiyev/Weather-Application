import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_application/providers/country_provider.dart';

class SearchWidget extends StatefulWidget {
  final ValueChanged<String> onChanged;
  const SearchWidget({super.key, required this.onChanged});

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    bool isLoading=context.watch<CountryProvider>().isLoading;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20,horizontal: 30),
      padding: const EdgeInsets.only(left: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF000000).withOpacity(0.08),
            offset: const Offset(0, 4),
            blurRadius: 10
          )
        ],
        color: const Color(0xFFFFFFFF).withOpacity(0.6),
      ),
      child: Row(
        
        children: [
          Image.asset('assets/images/search1.png',width: 20,),
          const SizedBox(width: 20,),
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: const InputDecoration(
                 
                labelText: 'Enter name of country',
                labelStyle: TextStyle(
                  fontSize: 14,
                  color: Color(0xff848484),
                )
              ),
              onChanged: widget.onChanged,
            ),
          ),
          if(isLoading)
          const CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation(Colors.white)
          )
  
        ],
      ),
    );
  }
}

