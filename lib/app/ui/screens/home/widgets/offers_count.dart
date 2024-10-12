part of '../screen.dart';

class _OffersCount extends StatelessWidget {
  final double itemsHeight;
  const _OffersCount({required this.itemsHeight});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
          HomeScreen._topScreenPadding, 0, HomeScreen._topScreenPadding, 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 1,
            child: _BuyOfferView(
              height: itemsHeight,
            ),
          ),
          const SizedBox(width: 5),
          Flexible(
            flex: 1,
            child: _RentOfferView(
              height: itemsHeight,
            ),
          )
        ],
      ),
    );
  }
}

class _BuyOfferView extends StatelessWidget {
  final double height;
  const _BuyOfferView({required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: height,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          shape: BoxShape.circle, color: Theme.of(context).colorScheme.primary),
      alignment: Alignment.center,
      child: Column(
        children: [
          Text("BUY",
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Theme.of(context).colorScheme.onPrimary)),
          const SizedBox(height: 25),
          Text("1 034",
              style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.w700,
                  color: Theme.of(context).colorScheme.onPrimary)),
          Text(
            "offers",
            style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Theme.of(context).colorScheme.onPrimary),
          )
        ],
      ),
    );
  }
}

class _RentOfferView extends StatelessWidget {
  final double height;
  const _RentOfferView({required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Theme.of(context).colorScheme.surfaceContainerLow,
                Theme.of(context).colorScheme.surfaceContainerHigh
              ])),
      alignment: Alignment.center,
      child: Column(
        children: [
          Text("RENT",
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Theme.of(context).colorScheme.onSurface)),
          const SizedBox(height: 25),
          Text("2 212",
              style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.w700,
                  color: Theme.of(context).colorScheme.onSurface)),
          Text("offers",
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Theme.of(context).colorScheme.onSurface)),
        ],
      ),
    );
  }
}
