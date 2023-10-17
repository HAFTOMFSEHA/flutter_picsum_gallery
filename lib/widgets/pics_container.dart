import 'package:flutter/material.dart';
import '../bloc/app/app_bloc.dart';
import '../models/pic_list_model.dart';

class PicsContainer extends StatelessWidget {
  final AppState appState;
  final BuildContext context;
  final int index;
  final ListPicResponse pic;

  const PicsContainer(
      {super.key,
      required this.appState,
      required this.context,
      required this.index,
      required this.pic});

  @override
  Widget build(BuildContext context) {
    const Color colorDark = Color(0xFF2A6F97);
    const Color colorLight = Color(0xFF07abcc);
    const Color backgroundColor = Colors.white; // for a minimalist background color
   return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16), // Reduced margin
      decoration: BoxDecoration(
        // Removed border decoration
        borderRadius: BorderRadius.circular(15), // Smaller border radius for a subtle curve
        color: backgroundColor, // Minimalist color
        boxShadow: const [
          BoxShadow(
            color: Colors.black12, // Softer shadow color
            offset: Offset(0, 2),
            blurRadius: 4,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(0),
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 221,
                child: FadeInImage(
                  fit: BoxFit.cover,
                  placeholder: const AssetImage('assets/images/loading.gif'),
                  image: pic.downloadUrl != null
                      ? NetworkImage(pic.downloadUrl!)
                      : const AssetImage('assets/images/404.png')
                          as ImageProvider<Object>,
                  imageErrorBuilder: (context, error, stackTrace) {
                    return Image.asset('assets/images/404.png');
                  },
                ),
              ),
              const SizedBox(height: 8),
                 Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12), // Symmetric padding for balance
              child: Text(
                pic.author ?? 'Unknown Photo Author', // Handle case where author information isn't available
                style: TextStyle(
                  color: appState.isThemeLight ? colorDark : colorLight, // Keeping your color condition
                  fontSize: 18, // Slightly reduced font size for minimalism
                ),
                maxLines: 2, // In case the text is too long
                overflow: TextOverflow.ellipsis, // ... to indicate more text
              ),
            ),
            ],
          ),
        ),
      ),
    );
  }
}


/* 


import 'package:flutter/material.dart';
import '../bloc/app/app_bloc.dart';
import '../models/pic_list_model.dart';

class PicsContainer extends StatelessWidget {
  final AppState appState;
  final BuildContext context;
  final int index;
  final ListPicResponse pic;

  const PicsContainer({
    super.key,
    required this.appState,
    required this.context,
    required this.index,
    required this.pic,
  });

  @override
  Widget build(BuildContext context) {
    // Removed the predefined colors for a border and kept simple color constants
    const Color colorDark = Color(0xFF2A6F97);
    const Color colorLight = Color(0xFF07abcc);
    const Color backgroundColor = Colors.white; // for a minimalist background color

    // We're aiming for a cleaner, borderless container, with fewer distractions from the content.
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16), // Reduced margin
      decoration: BoxDecoration(
        // Removed border decoration
        borderRadius: BorderRadius.circular(15), // Smaller border radius for a subtle curve
        color: backgroundColor, // Minimalist color
        boxShadow: [
          BoxShadow(
            color: Colors.black12, // Softer shadow color
            offset: const Offset(0, 2),
            blurRadius: 4,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15), // Consistent with the box decoration
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch, // To align the child widgets properly
          children: [
            SizedBox(
              width: double.infinity, // Takes the full width of the container
              height: 221, // Keeping your specified height
              child: FadeInImage(
                fit: BoxFit.cover,
                placeholder: const AssetImage('assets/images/loading.gif'),
                image: pic.downloadUrl != null
                    ? NetworkImage(pic.downloadUrl!)
                    : const AssetImage('assets/images/404.png'),
                imageErrorBuilder: (context, error, stackTrace) {
                  return const Image.asset('assets/images/404.png');
                },
              ),
            ),
            const SizedBox(height: 8), // Reduced spacer
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12), // Symmetric padding for balance
              child: Text(
                pic.author ?? 'Unknown Photo Author', // Handle case where author information isn't available
                style: TextStyle(
                  color: appState.isThemeLight ? colorDark : colorLight, // Keeping your color condition
                  fontSize: 18, // Slightly reduced font size for minimalism
                ),
                maxLines: 2, // In case the text is too long
                overflow: TextOverflow.ellipsis, // ... to indicate more text
              ),
            ),
          ],
        ),
      ),
    );
  }
}


*/
