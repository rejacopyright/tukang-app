import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: TextField(
        maxLines: 1,
        style: const TextStyle(fontSize: 14),
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color(0xfff5f5f5),
          contentPadding: const EdgeInsets.symmetric(vertical: 0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
          hintText: 'Search user here',
          hintStyle: TextStyle(color: Colors.black.withOpacity(0.5)),
          prefixIcon: const Icon(Iconsax.search_normal_1, size: 15),
          prefixIconColor: Theme.of(context).primaryColor,
          prefixIconConstraints: const BoxConstraints(
            maxWidth: 35,
            minWidth: 35,
          ),
        ),
      ),
    );
  }
}
