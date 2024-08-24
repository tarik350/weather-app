bool isZipCode(String searchString) {
  final zipCodePattern = RegExp(r'^\d{5}(?:,\w{2})?$');

  return zipCodePattern.hasMatch(searchString);
}

bool isCityName(String searchString) {
  return !isZipCode(searchString);
}
