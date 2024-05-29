import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rwa/models/category_model.dart';
import 'package:rwa/models/diet_model.dart';
import 'package:rwa/models/popular_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CategoryModel> categories = [];
  List<DietModel> diets = [];
  List<PopularDietModel> popularDiets = [];

  void _getCategories() {
    categories = CategoryModel.getAllCategories();
  }

  void _getDiets() {
    diets = DietModel.getAllDiets();
  }

  void _getPopularDiets() {
    popularDiets = PopularDietModel.getAllPopularDiets();
  }

  @override
  void initState() {
    super.initState();
    _getCategories();
    _getDiets();
    _getPopularDiets();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          searchField(),
          const SizedBox(height: 40),
          categorySection(),
          const SizedBox(height: 40),
          dietSection(),
          const SizedBox(height: 40),
          popularSection()
        ],
      ),
    );
  }

  Column popularSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            'Popular',
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600),
          ),
        ),
        ListView.separated(
          itemCount: popularDiets.length,
          shrinkWrap: true,
          padding: const EdgeInsets.only(left: 20, right: 20),
          itemBuilder: ((context, index) {
            return Container(
              height: 100,
              decoration: BoxDecoration(
                  color: popularDiets[index].isSelected
                      ? Colors.white
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: popularDiets[index].isSelected
                      ? [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.07),
                              offset: const Offset(0, 10),
                              blurRadius: 40,
                              spreadRadius: 0),
                        ]
                      : []),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SvgPicture.asset(
                    popularDiets[index].iconPath,
                    height: 60,
                    width: 60,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(popularDiets[index].name,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w500)),
                      Text(
                          '${diets[index].level} | ${diets[index].duration} | ${diets[index].calories}',
                          style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                              fontSize: 16)),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: SvgPicture.asset(
                      'assets/icons/button.svg',
                      height: 30,
                      width: 30,
                    ),
                  )
                ],
              ),
            );
          }),
          separatorBuilder: (context, index) => const SizedBox(
            height: 25,
          ),
        )
      ],
    );
  }

  Column dietSection() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Padding(
        padding: EdgeInsets.only(left: 20),
        child: Text(
          'Recomendação de dieta',
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600),
        ),
      ),
      SizedBox(
        height: 250,
        child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(left: 20, right: 20),
            itemCount: diets.length,
            separatorBuilder: (context, index) => const SizedBox(
                  width: 25,
                ),
            itemBuilder: (context, index) {
              return Container(
                width: 250,
                decoration: BoxDecoration(
                    color: diets[index].boxColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                        height: 100,
                        width: 100,
                        child: SvgPicture.asset(diets[index].iconPath)),
                    Column(
                      children: [
                        Text(
                          diets[index].name,
                          style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                              fontSize: 20),
                        ),
                        Text(
                          '${diets[index].level} | ${diets[index].duration} | ${diets[index].calories}',
                          style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                              fontSize: 16),
                        ),
                      ],
                    ),
                    Container(
                      height: 40,
                      width: 120,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                          diets[index].isSelected
                              ? Colors.lightBlueAccent
                              : Colors.transparent,
                          diets[index].isSelected
                              ? Colors.lightBlue
                              : Colors.transparent,
                        ]),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Center(
                        child: Text(
                          "Ver",
                          style: TextStyle(
                              color: diets[index].isSelected
                                  ? Colors.white
                                  : Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 16),
                        ),
                      ),
                    )
                  ],
                ),
              );
            }),
      )
    ]);
  }

  Column categorySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            'Categoria',
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600),
          ),
        ),
        SizedBox(
          height: 120,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(left: 20, right: 20),
              itemCount: categories.length,
              separatorBuilder: (context, index) => const SizedBox(
                    width: 25,
                  ),
              itemBuilder: (context, index) {
                return Container(
                  width: 100,
                  decoration: BoxDecoration(
                      color: categories[index].boxColor.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(16)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 50,
                        height: 50,
                        child: SvgPicture.asset(categories[index].iconPath),
                      ),
                      Text(
                        categories[index].name,
                        style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                            fontSize: 16),
                      )
                    ],
                  ),
                );
              }),
        )
      ],
    );
  }

  Container searchField() {
    return Container(
      margin: const EdgeInsets.only(top: 40, left: 20, right: 20),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: Colors.black.withOpacity(0.11),
            blurRadius: 40,
            spreadRadius: 0.0),
      ]),
      child: TextField(
        decoration: InputDecoration(
            hintText: "Bom dia",
            hintStyle: const TextStyle(color: Colors.black26, fontSize: 14),
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.all(15),
            prefixIcon: Padding(
              padding: const EdgeInsets.all(12),
              child: SvgPicture.asset('assets/icons/search.svg'),
            ),
            suffixIcon: SizedBox(
              width: 100,
              child: IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const VerticalDivider(
                      color: Colors.black45,
                      indent: 10,
                      endIndent: 10,
                      thickness: 0.1,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: SvgPicture.asset('assets/icons/filter.svg'),
                    ),
                  ],
                ),
              ),
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none)),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      title: const Text(
        'Thigas o lendário',
        style: TextStyle(
            color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
      ),
      backgroundColor: const Color(0xFFF7F7F7),
      elevation: 0.0,
      centerTitle: true,
      leading: GestureDetector(
        onTap: () {},
        child: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: SvgPicture.asset('assets/icons/goback.svg',
              width: 20, height: 20),
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () {},
          child: Container(
            alignment: Alignment.center,
            width: 37,
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: SvgPicture.asset('assets/icons/config.svg',
                width: 20, height: 20),
          ),
        )
      ],
    );
  }
}
