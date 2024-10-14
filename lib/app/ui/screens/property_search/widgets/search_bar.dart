part of '../screen.dart';

class _SearchBar extends StatelessWidget {
  const _SearchBar();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: Row(
        children: [
          // search field
          Expanded(
            child: TextField(
                enabled: false,
                decoration: InputDecoration(
                  isDense: true,
                  hintText: 'Saint Petersburg',
                  hintStyle: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                      color: Colors.black),

                  prefixIconConstraints:
                      BoxConstraints.loose(const Size(24, 24)),
                  prefixIcon: SvgPicture.asset(
                    AppIcon.searchOutline,
                    height: 18,
                    width: 18,
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                        Theme.of(context).colorScheme.tertiary,
                        BlendMode.srcIn),
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.white, // Background color
                )),
          ),
          const SizedBox(width: 10),

          // settings icon
          Container(
            decoration: const BoxDecoration(
              color: Colors.white, // Background color of the circle
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: Icon(Icons.tune,
                  size: 18, color: Theme.of(context).colorScheme.tertiary),
              onPressed: () {
                // Add action for tune button here
              },
            ),
          ),
        ],
      ),
    );
  }
}
