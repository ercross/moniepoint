part of '../screen.dart';

class _PropertyLocationPin extends StatefulWidget {
  final Size size;
  final Duration animationDuration;
  final String amount;
  const _PropertyLocationPin(
      {required this.size,
      required this.amount,
      required this.animationDuration});

  @override
  State<_PropertyLocationPin> createState() => _PropertyLocationPinState();
}

class _PropertyLocationPinState extends State<_PropertyLocationPin> {
  double _height = 0;
  double _width = 0;
  late bool _showIcon;

  @override
  void initState() {
    super.initState();
    _showIcon = false;
    _startAnimation();
  }

  _startAnimation() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(milliseconds: 100), () {
        setState(() {
          _height = widget.size.height;
          _width = 90;
        });
        final delay = Duration(
            milliseconds: widget.animationDuration.inMilliseconds + 1000);
        Future.delayed(delay, () {
          setState(() {
            _width = widget.size.width;
            _showIcon = true;
          } );
          
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    const Radius radius = Radius.circular(12);
    return AnimatedContainer(
      duration: widget.animationDuration,
      height: _height,
      width: _width,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: const BorderRadius.only(
              topLeft: radius, topRight: radius, bottomRight: radius)),
      child: AnimatedSwitcher(
        duration: widget.animationDuration,
        transitionBuilder: (Widget child, Animation<double> animation) {
          return FadeTransition(
            opacity: animation, // Apply fade transition
            child: child,
          );
        },
        child: _showIcon
            ? Icon(Icons.apartment_rounded,
                color: Theme.of(context).colorScheme.onPrimary, size: 20)
            : Text(widget.amount,
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Theme.of(context).colorScheme.onPrimary)),
      ),
    );
  }
}

String _randomAmount() {
  const List<String> prices = [
    "10,3 mn ₱",
    "11 mn ₱",
    "7,8 mn ₱",
    "8,5 mn ₱",
    "13,3 mn ₱",
    "6,95 mn ₱"
  ];
  Random random = Random();

  return prices[random.nextInt(prices.length)];
}

List<Widget> _randomisePropertyLocationPins(
    {required double boundaryTop,
    required double boundaryLeft,
    required Duration animationDuration}) {
  final List<Offset> positions = [
    Offset(boundaryLeft + 80, boundaryTop + 70),
    Offset(boundaryLeft + 95, boundaryTop + 120),
    Offset(boundaryLeft + 240, boundaryTop + 140),
    Offset(boundaryLeft + 230, boundaryTop + 250),
    Offset(boundaryLeft + 50, boundaryTop + 300),
    Offset(boundaryLeft + 200, boundaryTop + 350)
  ];

  const Size size = Size(40, 40);
  return positions
      .map((position) => Positioned(
          top: position.dy,
          left: position.dx,
          height: size.height,
          child: _PropertyLocationPin(
            size: size,
            amount: _randomAmount(),
            animationDuration: animationDuration,
          )))
      .toList();
}
