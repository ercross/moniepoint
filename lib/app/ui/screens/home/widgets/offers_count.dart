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
      padding: const EdgeInsets.all(10),
      decoration:
          const BoxDecoration(shape: BoxShape.circle, color: AppColor.primary),
      alignment: Alignment.center,
      child: Column(
        children: [
          Text("BUY",
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: Colors.white)),
          const SizedBox(height: 40),
          Text("1 034",
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium
                  ?.copyWith(color: Colors.white)),
          const SizedBox(height: 10),
          Text(
            "offers",
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(color: Colors.white),
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
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: const LinearGradient(
              colors: [Color(0xFFFCF6F0), Color(0xFFFEFFFE)])),
      alignment: Alignment.center,
      child: Column(
        children: [
          Text("RENT", style: Theme.of(context).textTheme.bodyMedium),
          const SizedBox(height: 40),
          Text("2 212", style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: 10),
          Text("offers", style: Theme.of(context).textTheme.bodySmall),
        ],
      ),
    );
  }
}
