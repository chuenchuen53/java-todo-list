String? nonEmptyAlphanumeric(String? value, String fieldName) {
  if (value == null || value.isEmpty) {
    return 'Please enter your $fieldName';
  }
  if (!RegExp(r'^[a-zA-Z0-9]+$').hasMatch(value)) {
    return '$fieldName must be alphanumeric';
  }
  return null;
}
