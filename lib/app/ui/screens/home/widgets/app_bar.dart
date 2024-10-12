part of '../screen.dart';

class _AppBar extends StatelessWidget {
  const _AppBar();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: HomeScreen._topScreenPadding,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const _LocationView(),
          const Expanded(child: SizedBox()),
          CircleAvatar(
            radius: 20,
            foregroundImage: Image.asset(AppImage.profilePics).image,
          )
        ],
      ),
    );
  }
}

class _LocationView extends StatelessWidget {
  const _LocationView();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 12),
      height: 45,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Color(0xFFFEFFFE)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            AppIcon.location,
            height: 18,
            width: 18,
            fit: BoxFit.contain,
            colorFilter: ColorFilter.mode(
                Theme.of(context).colorScheme.secondary, BlendMode.srcIn),
          ),
          const SizedBox(width: 6),
          Text(
            "Saint Petersburg",
            style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Theme.of(context).colorScheme.secondary),
          )
        ],
      ),
    );
  }
}
