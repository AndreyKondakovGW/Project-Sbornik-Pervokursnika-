import 'package:formz/formz.dart';

//Перечислимы тип ошибок которые могут возникать при вводе в поле
enum EmailInputError { invalid }

/*Тип поля ввода имени наследуется от специального класса FormzInput
с указание типа поля ввода и перечислимого типа ошибок ввода*/
class EmailInput extends FormzInput<String, EmailInputError >
{
  static EmailInputError errortext = EmailInputError.invalid;
  //Конструктор незаполненного поля ввода
  const EmailInput.pure() : super.pure('');
  //Конструктор заполненого поля ввода
  const EmailInput.dirty({String value = ''}) : super.dirty(value);

  String getUsernameInputErrorText()
  {
      switch (errortext) {
        case EmailInputError.invalid:
          return "Неверный формат электронной почты";
          break;
        default:
          return "";
      }
  }

  //Регекс для электронной почты
  static final RegExp _emailRegExp = RegExp(
    r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
  );

  //Валидатор
  @override
  EmailInputError validator(String value) 
  {
    errortext = EmailInputError.invalid;
    return _emailRegExp.hasMatch(value) ? null : EmailInputError.invalid;
  }
}