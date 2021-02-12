import 'package:sbornik_pervokursnika/data/api/model/api_Post.dart';
import 'package:sbornik_pervokursnika/data/api/model/api_Teg.dart';
import 'package:sbornik_pervokursnika/data/api/request/get_lenta_request_body.dart';


///Заглушка сервиса пока нет бэка
class LentaServicePlug{
  final int postpageCap = 3;

  final AllTegs = {
    'МехМат': false,
    'Новости': false,
    'Самоделка': false,
    'Сессия': false,
    'Депрессия': false,
    'flutter': false,
  };

  final AllPosts = [
    ApiPost.fromApi(
      id: '1',
      title: 'СИЦ ИММиКН',
      text: '''КУРСЫ ПО ГИТ ‼
        Со следующей недели начинается курс по GitHub, организуемый студентами 2 курса ФИИТ. Они помогут разобраться в азах пользования гитом на практических заданиях. Факультатив будет состоять из 4-5 занятий с вводной лекционной частью и будет проводиться дистанционно. Для закрепления знаний возможны дополнительные задания на дом. Скорее заполняй форму внизу!https://forms.gle/kL4keKG4rNwdcqnX8''',
      image: 'assets/images/git_courses.jpg',
      tegs: ['Новости'],
      timeofcreation: DateTime.parse("1969-07-20 20:18:04Z"),
    ),
    ApiPost.fromApi(
      id: '2',
      title: 'СИЦ ЮФУ',
      text: '''ЭСТЕТИКА ВО ВСЁМ 
        Художественный проект «Геометрия пространства‑5» открыт до конца ноября!Причины провести свой день культурно:Не только картины! Помимо живописи, тебя ждут графика, скульптура, фотография и декоративно-прикладное искусство.Работы молодых или уже известных художников из России, Австрии, Италии, Украины и др.Работы преподавателей высших художественных учебных заведений г. Ростова-на-Дону, а также студентов направлений искусства, дизайна и архитектуры.Возможность провести время с пользой, а главное — не дома✊🏻Организаторы обещают, равнодушных не останется:💬 «Ключевое направление арт-проекта: пространство как важнейшая и необходимая составляющая в решении любого произведения пластического искусства. Широкий спектр индивидуальных подходов к исполнению темы проекта, разнообразие видов и техник, представленных на выставке не оставят равнодушными ни одного зрителя»Приходи к ААИ❤''',
      image: 'assets/images/estetic.jpg',
      tegs: ['МехМат'],
      timeofcreation: DateTime.parse("1969-07-20 20:19:04Z"),
    ),
    ApiPost.fromApi(
      id: '3',
      title: 'СИЦ ИММиКН',
      text:
        'Хэй, мехматовец! Близится декабрь, а вместе с ним - традиционный инструментальный концерт! Именно здесь ты сможешь полностью раскрыть весь свой музыкальный потенциал и окунуться в атмосферу настоящей музыки!Хочешь принять участие? Приходи на прослушивание в этот четверг:19 НОЯБРЯ 15:30 120 АУДИТОРИЯ ',
      image: 'assets/images/music.jpg',
      tegs: ['МехМат','Самоделка'],
      timeofcreation: DateTime.parse("1969-07-20 20:20:04Z"),
    ),
    ApiPost.fromApi(
      id: '4',
      title: 'ЮФУ(Южный Федеральный Университет)',
      text:
        'Ректор и президент ЮФУ приняли участие в подведении итогов проекта «Золотые Имена Высшей Школы»Проект «Золотые Имена Высшей Школы» – ежегодный конкурсный отбор по рекомендации вузов и научных учреждений самых достойных представителей профессорско-преподавательского состава, которые имеют личный успех, достижения в учебном процессе с применением новейших методик, а также инновационных практик для повышения качества образования. 24 ноября состоялась онлайн конференция, где обсудили перспективы проекта "Золотые Имена Высшей Школы", социальный статус преподавателя современного вуза, работу региональных учреждений высшего образования и роль ученых в развитии гражданского общества.',
      image: 'assets/images/gold_names.jpg',
      tegs: ['Новости'],
      timeofcreation: DateTime.parse("1969-07-20 20:21:04Z"),
    ),
      
    ApiPost.fromApi(
      id: '5',
      title: 'ЮФУ',
      text:
        'Простыми словами: эпизод 14. Завтра, 26 ноября, в День информационной безопасности, аналитик НЦПТИ, аспирант Института социологии и регионоведения ЮФУ Максим Куценко расскажет о кибербезопасности. Не пропусти прямой эфир и будь с нами ',
      image: 'assets/images/simple_word.jpg',
      tegs: ['Новости'],
      timeofcreation: DateTime.parse("1969-07-20 20:22:04Z"),
    ),
    ApiPost.fromApi(
      id: '6',
      title: 'СИЦ ЮФУ',
      text:
        'РЕГИСТРАЦИЯ НА ЗОЛОТОЙ ГОЛОС Если готов быть услышанным, прими участие в самом важном событии каждого певца университета!Заполни заявку ниже и приходи на Отборочный этап, который состоится уже 28 и 29 ноября.Следи за новостями проекта в группе Центра культуры и творчества ЮФУ. Кстати, там уже появилось первое интервью с членом жюри🔥Заявки принимаются до 26 ноября',
      image: 'assets/images/gold_voice.jpg',
      tegs: ['МехМат','Самоделка','Новости'],
      timeofcreation: DateTime.parse("1969-07-20 20:23:04Z"),
    ),
  ];

  Future<ApiTegList> GetTegs() =>
  Future.delayed(Duration(milliseconds: 100), () {
    return ApiTegList.fromApi(AllTegs.entries.map((e) => ApiTeg.fromApi(e.key,e.value)).toList());
  });


  Future<void> AddTeg(name)async
  {
    AllTegs[name] = true;
  }

  Future<void> RemoveTeg(name)async
  {
    AllTegs[name] = false;
  }

  Future<ApiPostList> GetPosts(GetPostRequestBody body)=>
  Future.delayed(Duration(milliseconds: 100), () {
    var posts = AllPosts;
    if (body.time != null)
    {
      posts = AllPosts.where((e) => e.timeofcreation.isAfter(body.time)).toList();
    }
    List<ApiPost> res =[];  
    if (body.tegs.length > 0)
    {
      for(var p in posts)
      {
        if(p.tegs.any((element) => body.tegs.map((e) => e.name).contains(element)))
        {
          res.add(p);
        }
      }
    }
    else {res = posts;}
    print(res.length);
    return ApiPostList.fromApi(posts: res.length > postpageCap?res.take(postpageCap).toList():res);
  });

  //AddtoFavorites(postid)

  //RemoveFavorites(String postid)
}