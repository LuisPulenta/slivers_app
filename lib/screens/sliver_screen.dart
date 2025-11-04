import 'package:flutter/material.dart';

class SliverScreen extends StatelessWidget {
  const SliverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _MainScroll(),
          Positioned(bottom: 0, right: -10, child: _BotonNewList()),
        ],
      ),
    );
  }
}

//----------------------- _BotonNewList -------------------------------
class _BotonNewList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ButtonTheme(
      minWidth: size.width * 0.9,
      height: 100,
      child: MaterialButton(
        color: const Color(0xffed6762),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(50)),
        ),
        child: const Text(
          'CREATE NEW LIST',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            letterSpacing: 3,
          ),
        ),
        onPressed: () {},
      ),
    );
  }
}

//----------------------- _MainScroll ---------------------------------

class _MainScroll extends StatelessWidget {
  final items = [
    const _ListItem('Orange', Color(0xffF08F66)),
    const _ListItem('Family', Color(0xffF2A38A)),
    const _ListItem('Subscriptions', Color(0xffF7CDD5)),
    const _ListItem('Books', Color(0xffFCEBAF)),
    const _ListItem('Orange', Color(0xffF08F66)),
    const _ListItem('Family', Color(0xffF2A38A)),
    const _ListItem('Subscriptions', Color(0xffF7CDD5)),
    const _ListItem('Books', Color(0xffFCEBAF)),
    const _ListItem('Orange', Color(0xffF08F66)),
    const _ListItem('Family', Color(0xffF2A38A)),
    const _ListItem('Subscriptions', Color(0xffF7CDD5)),
    const _ListItem('Books', Color(0xffFCEBAF)),
    const _ListItem('Orange', Color(0xffF08F66)),
    const _ListItem('Family', Color(0xffF2A38A)),
    const _ListItem('Subscriptions', Color(0xffF7CDD5)),
    const _ListItem('Books', Color(0xffFCEBAF)),
  ];

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        // SliverAppBar(
        //   floating: true,
        //   backgroundColor: Colors.red,
        //   title: _Titulo(),
        // ),
        SliverPersistentHeader(
          floating: true,
          delegate: _SliverCustomHeaderDelegate(
            minheight: 180,
            maxheight: 230,
            child: Container(
              alignment: Alignment.centerLeft,
              color: Colors.white,
              child: const _Titulo(),
            ),
          ),
        ),

        SliverList(
          delegate: SliverChildListDelegate([
            ...items,
            const SizedBox(height: 100),
          ]),
        ),
      ],
    );
  }
}

//----------------------- _SliverCustomHeaderDelegate ---------------------------------

class _SliverCustomHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double minheight;
  final double maxheight;
  final Widget child;

  _SliverCustomHeaderDelegate({
    required this.minheight,
    required this.maxheight,
    required this.child,
  });

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return SizedBox.expand(child: child);
  }

  @override
  double get maxExtent => maxheight;

  @override
  double get minExtent => minheight;

  @override
  bool shouldRebuild(covariant _SliverCustomHeaderDelegate oldDelegate) {
    return maxheight != oldDelegate.maxheight ||
        minheight != oldDelegate.minheight ||
        child != oldDelegate.child;
  }
}

//----------------------- _ListItem ---------------------------------
class _ListItem extends StatelessWidget {
  final String titulo;
  final Color color;

  const _ListItem(this.titulo, this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: const EdgeInsets.all(10),
      height: 130,
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(
        titulo,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

//----------------------- _Titulo ---------------------------------

class _Titulo extends StatelessWidget {
  const _Titulo();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
          child: const Text(
            'New',
            style: TextStyle(
              color: Color(0xff532128),
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Stack(
          children: [
            const SizedBox(width: 100),
            Positioned(
              bottom: 8,
              child: Container(
                width: 130,
                height: 08,
                color: const Color(0xfff7cdd5),
              ),
            ),
            const Text(
              'List',
              style: TextStyle(
                color: Color(0xffd93a30),
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
