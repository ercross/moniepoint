part of '../screen.dart';

class _PropertyLocationPin extends StatelessWidget {
  final Size size;
  const _PropertyLocationPin(this.size);

  @override
  Widget build(BuildContext context) {
    const Radius radius = Radius.circular(12);
    return Container(
      height: size.height,
      width: size.width,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: const BorderRadius.only(
              topLeft: radius, topRight: radius, bottomRight: radius)),
      child: Icon(Icons.apartment_rounded,
          color: Theme.of(context).colorScheme.onPrimary, size: 20),
    );
  }
}

List<Widget> _randomisePropertyLocationPins(
    {required double boundaryTop, required double boundaryLeft}) {
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
          width: size.width,
          child: const _PropertyLocationPin(size)))
      .toList();
}
