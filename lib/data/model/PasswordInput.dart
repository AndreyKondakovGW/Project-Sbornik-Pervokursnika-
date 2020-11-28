import 'package:formz/formz.dart';

//Перечислимы тип ошибок которые могут возникать при вводе в поле
enum PasswordInputError { tolong, toshort }

/*Тип поля ввода имени наследуется от специального класса FormzInput
с указание типа поля ввода и перечислимого типа ошибок ввода*/
class PasswordInput extends FormzInput<String, PasswordInputError>
{
  static PasswordInputError errortext = PasswordInputError.tolong;
  //Конструктор незаполненного поля ввода
  const PasswordInput.pure() : super.pure('');
  //Конструктор заполненого поля ввода
  const PasswordInput.dirty({String value = ''}) : super.dirty(value);

  String getUsernameInputErrorText()
  {
      switch (errortext) {
        case PasswordInputError.tolong:
          return "Пароль слишком длинный";
          break;
        case PasswordInputError.toshort:
          return "Пароль слишком короткий";
          break;
        default:
          return "";
      }
  }

  //Валидатор
  @override
  PasswordInputError validator(String value) 
  {
    if (value.length < 3)
    {
      errortext = PasswordInputError.toshort;
      return PasswordInputError.toshort;
    }
    if (value.length > 12)
    {
      errortext = PasswordInputError.tolong;
      return PasswordInputError.tolong;
    }
    return  null;
  }
}