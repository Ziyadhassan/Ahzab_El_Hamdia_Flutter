import 'package:flutter/material.dart';
import '../../AhzabMainPage.dart';

class DuaaKhtmKuraan extends StatefulWidget {
  @override
  _DuaaKhtmKuraanState createState() => _DuaaKhtmKuraanState();
}

class _DuaaKhtmKuraanState extends State<DuaaKhtmKuraan> {
  String title = "دعاء ختم القرآن الكريم";
  double _firstpage = 1;
  double _lastpage = 7;
  String _audiolink =
      "https://dl.dropboxusercontent.com/s/zr1a2ok9ehsguof/%D8%AE%D8%AA%D8%A7%D9%85%20%D8%A7%D9%84%D9%82%D8%B1%D8%A2%D9%86%20%D8%A7%D9%84%D9%83%D8%B1%D9%8A%D9%85.mp3";
  List<String> _imagies = [
    "lib/Images/DuaaKtmKuraan/Khtm_quran_1.jpg",
    "lib/Images/DuaaKtmKuraan/Khtm_quran_2.jpg",
    "lib/Images/DuaaKtmKuraan/Khtm_quran_3.jpg",
    "lib/Images/DuaaKtmKuraan/Khtm_quran_4.jpg",
    "lib/Images/DuaaKtmKuraan/Khtm_quran_5.jpg",
    "lib/Images/DuaaKtmKuraan/Khtm_quran_6.jpg",
    "lib/Images/DuaaKtmKuraan/Khtm_quran_7.jpg",
    "lib/Images/DuaaKtmKuraan/Khtm_quran_8.jpg"
  ];
  List<Duration> durations = [
    Duration(minutes: 0, seconds: 0), // Page 1
    Duration(minutes: 1, seconds: 22), // Page 2
    Duration(minutes: 3, seconds: 34), // Page 3
    Duration(minutes: 4, seconds: 20), // Page 4
    Duration(minutes: 5, seconds: 37), // Page 5
    Duration(minutes: 6, seconds: 55), // Page 6
    Duration(minutes: 8, seconds: 14), // Page 7
    //Duration(minutes: 9, seconds: 16), // Page 8 , Not there in the audio
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new AhzabWithAudio(
      title: title,
      firstpage: _firstpage,
      lastpage: _lastpage,
      audiolink: _audiolink,
      imagies: _imagies,
      durations: durations,
      tooltip: "تشغيل القرائه بصوت الشيخ على خليفه",
    );
  }
// Old UI [ Text ]
//  @override
//  Widget build(BuildContext context) {
//    return new SafeArea(
//      child: new Scaffold(
//        backgroundColor: Night_Mode ? DarkModeBlack : Colors.white,
//        body: new SingleChildScrollView(
//          child: Column(
//            children: <Widget>[
//              new Text(
//                "هو اللهُ الذي لا إلهَ الا هُو الرحمنُ الرحيمُ مالكُ القُدوسُ السَلامُ المؤمنُ المهيمنُ العَزيزُ الجَبارُ المتكبرُ الخالقُ البَارئُ المصورُ الغفارُ القهارُ الوهابُ الرزاقُ الفتاحُ العليمُ القابضُ الباسطُ الخافضُ الرافعُ المعزُ المذلُ السميعُ البصيرُ الحكمُ العدلُ اللطيفُ الخبيرُ الحليمُ العظيمُ الغفورُ الشكورُ العليُ الكبيرُ الحفيظُ المقيتُ الحسيبُ الجليلُ الكريمُ الرقيبُ المجيبُ الواسعُ الحكيمُ الودودُ المجيدُ الباعثُ الشهيدُ الحقُ الوكيلُ القويُ ميتينُ الوليُ الحميدُ المحصي المبدئُ المعيدُ المحيي المميتُ الحيُ القيومُ الواجدُ الماجدُ الواحدُ الصمدُ القادرُ المقتدرُ المقدمُ المؤخرُ الاولُ الاخرُ الظاهرُ الباطنُ الوالي المتعالِ البرٌ التوابُ المنتقمُ العفوٌ الرؤوفُ مالكُ الملكِ ذوُ الجلالِ والاكرامِ المقسطُ الجامعُ الغنيُ المغِني المانعُ الضاُر النافعُ النورُ الهادِي البديعُ الباقِي الوارثُ الرشيدُ الصَبور",
//                textDirection: TextDirection.rtl,
//                textAlign: TextAlign.center,
//                style: new TextStyle(
//                  fontSize: 30,
////                  fontFamily: "Amiri",
//                  color: Night_Mode ? Colors.white : Colors.black,
//                ),
//              ),
//              new Text(
//                "(اللهم يامن لطفت بخلق السماوات والأرض ولطفت بالأجنة في بطون امهاتها الطف بنا في قضائك وقدرك لطفا يليق بكرمك يا ارحم الراحمين) ثلاث مرات",
//                textDirection: TextDirection.rtl,
//                textAlign: TextAlign.center,
//                style: new TextStyle(
//                  fontSize: 30,
//                  color: Night_Mode ? Colors.white : Colors.black,
//                ),
//              ),
//              new Text(
//                "بسم الله الرحمن الرحيم صدق الله العظيم \u06DE وصدق رسوله النبي الكريم \u06DE ونحن على ذلك من الشاهدين \u06DE ربنا تقبل منا انك انت السميع العليم اللهم ارزقنا بكل حرف من القران حلاوة \u06DE وبكل جزء من القران جزاء \u06DE اللهم ارزقنا بالألف ألفة وبالباء بركة وبالتاء توبة وبثاء ثوابا \u06DE و بالجيم جمالا و بالحاء حكمه و بالخاء خيرا وبدل دايلا و بالذال ذكاء وبراء رحمة وبالزاء زكاة \u06DE وبسين سعادة و بالشين شفاء و بالصاد صدقا وبالضاد ضياء \u06DE و بالطاء طراوة وبالظاء ظفرا وبالعين علما والغين غنى و بالفاء فلاحا \u06DE وبالقاف قربة وبالكاف كرامة و باللام لطفا وبالميم موعظة وبنون نورا وبالواو وصلة وبلهاء هداية و بالياء يقينا \u06DE اللهم انفعنا بالقران العظيم \u06DE وارفعنا بالآيات والذكر الحكيم وتقبل منا قراءتنا وتجاوز عن ما كان في تلاوة القرآن من خطأ او نسيان \u06DE وارزقنا تلاوته وأذقنا حلاوته بفضلك يا ارحم الراحمين  \u06DE وتقبل منا انك انت السميع العليم وتب علينا يا مولانا انك انت التواب الرحيم \u06DE واهدنا وفقنا الى الحق والى الطريق المستقيم ببركه القران العظيم وبحرمة من ارسلته رحمة للعالمين \u06DE واعف عنا يا كريم واعف عنا يا رحيم \u06DE واغفر لنا ذنوبنا بفضلك وكرمك يا أكرم الأكرمين \u06DE اللهم نور قلوبنا بالقرآن \u06DE و زينا أخلاقنا بالقرآن \u06DE وادخلنا الجنة بالقرآن \u06DE يا حنان يا منان يا عظيم الاحسان \u06DE اللهم اجعل القرآن لنا في الدنيا قرينا \u06DE وفي القبر مؤنسا \u06DE وعلى الصراط نورا \u06DE وفي الجنة رفيقا ومن النار سترا وحجابا \u06DE الى الخيرات كلها دليلا \u06DE فكتبنا على التمام وارزقنا أدائه بالقلب واللسان وحب الخير والسعادة والبشارة من الايمان \u06DE وصلي اللهم على سيدنا محمد صلاتك الكاملة الازلية \u06DE الموصوفة بالبقاء والدوام والأبدية \u06DE التي صليتها في حضره العلم الأقدس الالهي القديم \u06DE الذي تنزل بسفرائك في حضرة القرآن الكريم \u06DE فقلت بلسان الفرقان المحمدي الرؤوف الرحيم (ان الله وملائكته يصلون على النبي يأيها الذين آمنوا صلوا عليه وسلموا تسليما) \u06DE فصل اللهم عليه بجميع صلواتك التامات المباركات \u06DE صلاه تستغرق جميع العلوم والمعلومات لا غايه لها ولا انتهاء ولا امد لها ولا اقضاء \u06DE دائمه بدوامك باقية ببقائك \u06DE تتولى وتتجدد في كل لحظه بعدد كمالك \u06DE وعلى اله وصحبه شموس سماء العلى وأصحابه والتابعين ومن تلى وسلم تسليما كثيرا \u06DE اللهم بلغ ما قرأناه ونور ما تلوناه الى من خلقته سيدا لكل من سواك \u06DE الحبيب الاعظم مولانا سيدنا رسول الله صلوات الله تعالى سلام وتحيه ورحمه وبركة عليه \u06DE وعلى اله وصحبه وعلى شيخنا وقدوتنا الى الله الحبيب الأعظم \u06DE مولانا السيد ابو حامد سلامه بن حسن الراضي رضي الله عنه وارضاه \u06DE ورضي الله عنه على خلفائه الكرام \u06DE ولأهل الطريق جميعا ولأهل الذكر والحضارات الى القارئين من احباب باب الشعرية والتالين في الحامدية الشاذلية اجمعين \u06DE وكل من تلقن طريقنا عن شيخنا الراضي الأمين \u06DE والمسلمين والمسلمات \u06DE والمؤمنين والمؤمنات \u06DE الاحياء منهم والاموات \u06DE برحمتك يا ارحم الراحمين \u06DE اللهم بجاهه تقبل دعائنا وفرج كروبنا و اشف أمراضنا و انصرنا على من ظلمنا \u06DE وأبحنا النظر الى وجهك الكريم في حضارات الشهود \u06DE واجعل خير أعمالنا خواتيمها يا رحيم يادودة \u06DE وجعلنا مع الذين انعمت عليهم من النبيين والصديقين والشهداء والصالحين وهب لنا العفو والعافية في الدنيا والأخرة والحمد لله رب العالمين.",
//                textDirection: TextDirection.rtl,
//                textAlign: TextAlign.center,
//                style: new TextStyle(
//                  fontSize: 30,
//                  color: Night_Mode ? Colors.white : Colors.black,
//                ),
//              ),
//              new Text(
//                "قل هو الله أحد (ثلاث مرات) الفلق ثم الناس والفاتحة. ان الله وملائكته يصلون على النبي يا ايها الذين امنوا صلوا عليه وسلموا تسليما اللهم صل وسلم وبارك على سيدنا محمد وعلى آلة وصحبه اجمعين. سبحان ربك رب العزة عما يصفون وسلام على المرسلين والحمد لله رب العالمين الصلاة والسلام عليك يا سيدي يا رسول الله الصلاة والسلام عليك يا سيدي يا حبيب الله ألف صلاه وألف سلامه عليك يا اول خلق الله وخاتم رسول الله.",
//                textDirection: TextDirection.rtl,
//                textAlign: TextAlign.center,
//                style: new TextStyle(
//                  fontSize: 30,
//                  color: Night_Mode ? Colors.white : Colors.black,
//                ),
//              ),
//            ],
//          ),
//        ),
//      ),
//    );
//  }

}
