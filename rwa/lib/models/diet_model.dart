import 'package:flutter/material.dart';

class DietModel {
  String name;
  String iconPath;
  Color boxColor;
  String level;
  String duration;
  String calories;
  bool isSelected;

  DietModel(
      {required this.name,
      required this.iconPath,
      required this.boxColor,
      required this.level,
      required this.duration,
      required this.calories,
      required this.isSelected});

  static List<DietModel> getAllDiets() {
    List<DietModel> diets = [];

    diets.add(DietModel(
      name: "Mel",
      iconPath: "assets/images/honey.svg",
      boxColor: Colors.purpleAccent,
      calories: "200g",
      level: "Fácil",
      duration: "4m",
      isSelected: true,
    ));
    diets.add(DietModel(
      name: "Hamburgue",
      iconPath: "assets/images/burguer.svg",
      boxColor: Colors.limeAccent,
      calories: "600g",
      level: "Dificil",
      duration: "50m",
      isSelected: false,
    ));

    return diets;
  }
}
