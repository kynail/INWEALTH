class Profile {
  final double completeness;
  
  final String name;
  final int? age;
  final int? familySituationId;
  final int? matrimonialPropertyRegimeId;
  final int? agePartner;
  final bool hasChild;
  final int? youngCount;
  final int? adultCount;
  final bool hasChildFromPreviousUnion;
  final bool hasDisabledChild;
  final bool hasGrandChild;
  final int? grandChildCount;

  //FR
  final int? countryId;
  final int? birthCountryId;
  final bool isTaxResidenceChangePlanned;
  final int? futureCountryId;
  final bool hasForeignElement;
  final int? foreignCountryId;



  final int? fortuneLevelId;

  final int? wishedLifeStyle;
  final int? netIncomeExcludingTax;
  final int? netTaxableIncome;
  final int? charges;

  final int? businessSectorId;

  final bool hasHoldingCompany;
  final bool hasOperatingRealEstate;
  final int? operatingRealEstateTypeId;

  final int? legalFormId;

  final int? valuation;

  const Profile({
    required this.completeness,
    required this.name,
    required this.countryId,
    required this.birthCountryId,
    required this.isTaxResidenceChangePlanned,
    required this.futureCountryId,
    required this.hasForeignElement,
    required this.foreignCountryId,
    required this.age,
    required this.familySituationId,
    required this.matrimonialPropertyRegimeId,
    required this.agePartner,
    required this.hasChild,
    required this.youngCount,
    required this.adultCount,
    required this.hasChildFromPreviousUnion,
    required this.hasDisabledChild,
    required this.hasGrandChild,
    required this.grandChildCount,
    required this.fortuneLevelId,
    required this.wishedLifeStyle,
    required this.netIncomeExcludingTax,
    required this.netTaxableIncome,
    required this.charges,
    required this.businessSectorId,
    required this.hasHoldingCompany,
    required this.hasOperatingRealEstate,
    required this.operatingRealEstateTypeId,
    required this.legalFormId,
    required this.valuation,
  });

}