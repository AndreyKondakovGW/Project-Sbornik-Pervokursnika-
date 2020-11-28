import 'package:formz/formz.dart';

//Перечислимы тип ошибок которые могут возникать при вводе в поле
enum UsernameInputError { tolong, toshort }

/*Тип поля ввода имени наследуется от специального класса FormzInput
с указание типа поля ввода и перечислимого типа ошибок ввода*/
class UsernameInput extends FormzInput<String, UsernameInputError>
{
  static UsernameInputError errortext = UsernameInputError.tolong;
  //Конструктор незаполненного поля ввода
  const UsernameInput.pure() : super.pure('');
  //Конструктор заполненого поля ввода
  const UsernameInput.dirty({String value = ''}) : super.dirty(value);

  
  String getUsernameInputErrorText()
  {
      switch (errortext) {
        case UsernameInputError.tolong:
          return "Имя слишком длинное";
          break;
        case UsernameInputError.toshort:
          return "Имя слишком короткое";
          break;
        default:
          return "";
      }
  }

  //Валидатор
  @override
  UsernameInputError validator(String value) 
  {
    if (value.length < 2)
    {
      errortext = UsernameInputError.toshort;
      return UsernameInputError.toshort;
    }
    if (value.length > 12)
    {
      errortext = UsernameInputError.tolong;
      return UsernameInputError.tolong;
    }
    return  null;
  }
}