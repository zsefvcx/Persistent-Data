

class ValidatorFields {

  static String? checkStringIfEmpty(String? value){
    if(value == null || value.isEmpty) return 'Text is empty';
    return null;
  }

  static String? checkAge(String? value){
    final res = checkStringIfEmpty(value);
    if (res != null) return res;
    final age = int.tryParse(value??'');
    if (age == null) return 'Age is not recognise';
    if (age < 18 || age > 110) return 'Age is wrong';
    return null;
  }

  static String? checkMonth(String? value){
    final res = checkStringIfEmpty(value);
    if (res != null) return res;
    final age = int.tryParse(value??'');
    if (age == null) return 'Month is not recognise';
    if (age < 0 || age > 12) return 'Month is wrong';
    return null;
  }

  static String? checkYear(String? value){
    final res = checkStringIfEmpty(value);
    if (res != null) return res;
    final age = int.tryParse(value??'');
    if (age == null) return 'Year is not recognise';
    if (age < 0 || age > 99) return 'Year is wrong';
    return null;
  }

  static String? checkName(String? value){
    final res = checkStringIfEmpty(value);
    if (res != null) return res;
               //r'[!@#<>?":_`~;[\]\\|=+)(*&^%\s-]'
    if(value != null && value.length > 255){
      return 'Format Firstname/Name is wrong';
    }
    return null;
  }

  static String? checkLastName(String? value){
    if (value == null || value.isEmpty) return null;
    //r'[!@#<>?":_`~;[\]\\|=+)(*&^%\s-]'
    if(value.length > 255){
      return 'Format Lastname is wrong';
    }
    return null;
  }

  static String? checkCreditCard(String? value){
    final res = checkStringIfEmpty(value);
    if (res != null) return res;
    if(!RegExp(r'(^([0-9]{4}[- ]?){3}[0-9]{4}$)').hasMatch(value ?? '')){
      return 'Format Card number is wrong';
    }
    return null;
  }

  static String? checkPhone(String? value){
    final res = checkStringIfEmpty(value);
    if (res != null) return res;
    if(!RegExp(r'(^[\+]?[0-9]{1,3}[-\s\.]?[(]?[0-9]{2,3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{2}[-\s\.]?[0-9]{2}$)').hasMatch(value ?? '')){
      return 'Format Phone number is wrong';
    }
    return null;
  }

  static String? checkValidUrl(String? value){
    final res = checkStringIfEmpty(value);
    if (res != null) return res;
    ///Используем встроенный валидатор
    if(value != null){
      final uri = Uri.tryParse(value);
      if(uri != null) {
        if (!uri.hasAbsolutePath) {
          return 'Please enter valid url';
        } else {
          return null;
        }
      }
    }
    return 'Please enter valid url';
    ///Используем регулярные выражения
    // String hasValidUrl(String value) {
    //   String pattern = r'(http|https)://[\w-]+(\.[\w-]+)+([\w.,@?^=%&amp;:/~+#-]*[\w@?^=%&amp;/~+#-])?';
    //   RegExp regExp = new RegExp(pattern);
    //   if (value.length == 0) {
    //     return 'Please enter url';
    //   }
    //   else if (!regExp.hasMatch(value)) {
    //     return 'Please enter valid url';
    //   }
    //   return null;
    // }
  }
}
