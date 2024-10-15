part of '../screen.dart';

class _SearchBar extends StatefulWidget {
  final Duration animationDuration;
  const _SearchBar({required this.animationDuration});

  @override
  State<_SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<_SearchBar> {
  double _textFieldHeight = 0;
  double _textFieldWidth = 0;
  double _tuneButtonSize = 0;

  _startTextFieldAnimation(BoxConstraints constraints) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _textFieldHeight = constraints.maxHeight;
        _textFieldWidth = constraints.maxWidth;
      });
    });
  }

  _startTuneIconAnimation(BoxConstraints constraints) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
    setState(() => _tuneButtonSize = constraints.maxHeight);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // search field
        Expanded(
          child: LayoutBuilder(
            builder: (_, constraints) {
              _startTextFieldAnimation(constraints);
              return AnimatedContainer(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                  duration: widget.animationDuration,
                  height: _textFieldHeight,
                  width: _textFieldWidth,
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.onPrimary,
                      borderRadius: BorderRadius.circular(30)),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        AppIcon.searchOutline,
                        height: 18,
                        width: 18,
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                            Theme.of(context).colorScheme.tertiary,
                            BlendMode.srcIn),
                      ),
                      const SizedBox(width: 10),
                      const Text("Saint Petersburg",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Colors.black)),
                    ],
                  ));
            },
          ),
        ),
        const SizedBox(width: 10),

        // settings icon
        LayoutBuilder(
          builder: (_, constraints) {
            _startTuneIconAnimation(constraints);
            return AnimatedContainer(
              alignment: Alignment.center,
              duration: widget.animationDuration,
              height: _tuneButtonSize,
              width: _tuneButtonSize,
              decoration: const BoxDecoration(
                color: Colors.white, 
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: Icon(Icons.tune,
                    size: 18, color: Theme.of(context).colorScheme.tertiary),
                onPressed: () {
                  // Add action for tune button here
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
