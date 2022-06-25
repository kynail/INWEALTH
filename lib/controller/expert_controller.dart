// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

  class Expert extends Equatable {
  int? id;
  String name = "";
  String url = "";
  List<String> legislations = [];
  List<String> competencies = [];

    Expert({
    required this.id,
    required this.name,
    required this.url,
    required this.legislations,
    required this.competencies,
  });
    @override
  List<Object?> get props => [id, name, url, legislations, competencies];
}

class ExpertController extends GetxController {
  // int? id;
  // String name = "";
  // String url = "";
  // List<String> legislations = [];
  // List<String> competencies = [];
  bool docu = false;
  bool appbarCalendar = false;
  bool appbar2 = true;

  final controllerName = TextEditingController();
  final controllerSurame = TextEditingController();
  final controllerJob = TextEditingController();
  final controllerEmail = TextEditingController();
  final controllerNumber = TextEditingController();

  Map<num, Expert> experts = {
        1: Expert(
          id: 1,
          name: "Sébastien Pagano",
          url: "assets/experts/sebastien-pagano.jpeg",
          legislations: const ["France"],
          competencies: const ["Donation", "Assurance-vie", "Art"],
    ),
  };
}