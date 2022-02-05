import 'package:flutter/material.dart';

import 'UI/EnshadPlayer.dart';

class EnshadPlayerPages extends StatefulWidget {
  int index;

  EnshadPlayerPages({
    required this.index,
  });

  @override
  _EnshadPlayerPagesState createState() => _EnshadPlayerPagesState();
}

class _EnshadPlayerPagesState extends State<EnshadPlayerPages> {
  late PageController _pageController;
  int index = 0;

  @override
  void initState() {
    super.initState();
    index = 0;
    _pageController = PageController(initialPage: widget.index);
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        EnshadPlayer(
          index: index++,
          title: "شئ لله يا ابا حامد",
          singer: "الشيخ على خليفة",
          audiolink:
              "https://dl.dropboxusercontent.com/s/wehocu5bi6lyz06/%D8%B4%D8%A6%20%D9%84%D9%84%D9%87%20%D9%8A%D8%A7%20%D8%A7%D8%A8%D8%A7%20%D8%AD%D8%A7%D9%85%D8%AF.m4a",
          downloadLink:
              "https://dl.dropboxusercontent.com/s/wehocu5bi6lyz06/%D8%B4%D8%A6%20%D9%84%D9%84%D9%87%20%D9%8A%D8%A7%20%D8%A7%D8%A8%D8%A7%20%D8%AD%D8%A7%D9%85%D8%AF.m4a?dl=1",
        ),
        EnshadPlayer(
          index: index++,
          title: "شاذلى يا ابا الحسن",
          singer: "الشيخ على خليفة",
          audiolink:
              "https://dl.dropboxusercontent.com/s/ofrypiqqdh9dowt/%D8%B4%D8%A7%D8%B0%D9%84%D9%89%20%D9%8A%D8%A7%20%D8%A7%D8%A8%D8%A7%20%D8%A7%D9%84%D8%AD%D8%B3%D9%86.mp3",
          downloadLink:
              "https://dl.dropboxusercontent.com/s/ofrypiqqdh9dowt/%D8%B4%D8%A7%D8%B0%D9%84%D9%89%20%D9%8A%D8%A7%20%D8%A7%D8%A8%D8%A7%20%D8%A7%D9%84%D8%AD%D8%B3%D9%86.mp3 ?dl=1",
        ),
        EnshadPlayer(
          index: index++,
          title: "صفت اوقاتنا",
          singer: "الشيخ على خليفة",
          audiolink:
              "https://dl.dropboxusercontent.com/s/wzun3yyr8lfxbbs/%D8%B5%D9%81%D8%AA%20%D8%A7%D9%88%D9%82%D8%A7%D8%AA%D9%86%D8%A7%20.m4a",
          downloadLink:
              "https://dl.dropboxusercontent.com/s/wzun3yyr8lfxbbs/%D8%B5%D9%81%D8%AA%20%D8%A7%D9%88%D9%82%D8%A7%D8%AA%D9%86%D8%A7%20.m4a?dl=1",
        ),
        EnshadPlayer(
          index: index++,
          title: "فؤادي وجسمي وروحي لكم",
          singer: "الشيخ على خليفة",
          audiolink:
              "https://dl.dropboxusercontent.com/s/zgdkxt2tjyz77ua/%D9%81%D8%A4%D8%A7%D8%AF%D9%8A%20%D9%88%D8%AC%D8%B3%D9%85%D9%8A%20%D9%88%D8%B1%D8%AD%D9%8A%20%D9%84%D9%83%D9%85-2.m4a",
          downloadLink:
              "https://dl.dropboxusercontent.com/s/zgdkxt2tjyz77ua/%D9%81%D8%A4%D8%A7%D8%AF%D9%8A%20%D9%88%D8%AC%D8%B3%D9%85%D9%8A%20%D9%88%D8%B1%D8%AD%D9%8A%20%D9%84%D9%83%D9%85-2.m4a?dl=1",
        ),
        EnshadPlayer(
          index: index++,
          title: "قصيدة سلامة سلامة",
          singer: "الشيخ على خليفة",
          audiolink:
              "https://dl.dropboxusercontent.com/s/50j4p1ahu01grwn/%D9%82%D8%B5%D9%8A%D8%AF%D8%A9%20%D8%B3%D9%84%D8%A7%D9%85%D9%87%20%D8%B3%D9%84%D8%A7%D9%85%D9%87.m4a",
          downloadLink:
              "https://dl.dropboxusercontent.com/s/50j4p1ahu01grwn/%D9%82%D8%B5%D9%8A%D8%AF%D8%A9%20%D8%B3%D9%84%D8%A7%D9%85%D9%87%20%D8%B3%D9%84%D8%A7%D9%85%D9%87.m4a?dl=1",
        ),
        EnshadPlayer(
          index: index++,
          title: "هو مولانا",
          singer: "الشيخ على خليفة",
          audiolink:
              "https://dl.dropboxusercontent.com/s/fwu2pe2hrutan5u/%D9%82%D8%B5%D9%8A%D8%AF%D8%A9%20%D9%87%D9%88%20%D9%85%D9%88%D9%84%D8%A7%D9%86%D8%A7%20%D8%A7%D9%84%D8%B4%D9%8A%D8%AE%20%D8%B9%D9%84%D9%8A%20%D9%88%D8%A7%D9%84%D8%A3%D8%AD%D8%A8%D8%A7%D8%A8%20%D9%85%D9%88%D9%84%D8%AF%20%D8%B3%D9%8A%D8%AF%D9%8A%20%D8%B3%D9%84%D8%A7%D9%85%D9%87%D9%A2%D9%A0%D9%A1%D9%A7.m4a",
          downloadLink:
              "https://dl.dropboxusercontent.com/s/fwu2pe2hrutan5u/%D9%82%D8%B5%D9%8A%D8%AF%D8%A9%20%D9%87%D9%88%20%D9%85%D9%88%D9%84%D8%A7%D9%86%D8%A7%20%D8%A7%D9%84%D8%B4%D9%8A%D8%AE%20%D8%B9%D9%84%D9%8A%20%D9%88%D8%A7%D9%84%D8%A3%D8%AD%D8%A8%D8%A7%D8%A8%20%D9%85%D9%88%D9%84%D8%AF%20%D8%B3%D9%8A%D8%AF%D9%8A%20%D8%B3%D9%84%D8%A7%D9%85%D9%87%D9%A2%D9%A0%D9%A1%D9%A7.m4a?dl=1",
        ),
        EnshadPlayer(
          index: index++,
          title: "يا اسم غالى",
          singer: "الشيخ على خليفة",
          audiolink:
              "https://dl.dropboxusercontent.com/s/4c2olwyafgrod86/%D9%82%D8%B5%D9%8A%D8%AF%D8%A9%20%D9%8A%D8%A7%20%D8%A7%D8%B3%D9%85%20%D8%BA%D8%A7%D9%84%D9%8A%20%D8%A7%D9%84%D8%B4%D9%8A%D8%AE%20%D8%B9%D9%84%D9%8A%20%D9%88%D8%A7%D9%84%D8%A7%D8%AD%D8%A8%D8%A7%D8%A8%20%D9%85%D9%88%D9%84%D8%AF%20%D8%B3%D9%8A%D8%AF%D9%8A%20%D8%B3%D9%84%D8%A7%D9%85%D9%87%D9%A2%D9%A0%D9%A1%D9%A7.m4a",
          downloadLink:
              "https://dl.dropboxusercontent.com/s/4c2olwyafgrod86/%D9%82%D8%B5%D9%8A%D8%AF%D8%A9%20%D9%8A%D8%A7%20%D8%A7%D8%B3%D9%85%20%D8%BA%D8%A7%D9%84%D9%8A%20%D8%A7%D9%84%D8%B4%D9%8A%D8%AE%20%D8%B9%D9%84%D9%8A%20%D9%88%D8%A7%D9%84%D8%A7%D8%AD%D8%A8%D8%A7%D8%A8%20%D9%85%D9%88%D9%84%D8%AF%20%D8%B3%D9%8A%D8%AF%D9%8A%20%D8%B3%D9%84%D8%A7%D9%85%D9%87%D9%A2%D9%A0%D9%A1%D9%A7.m4a?dl=1",
        ),
        EnshadPlayer(
          index: index++,
          title: "يا قرة العيون يا سيدي سلامة",
          singer: "زينب يونس",
          audiolink:
              "https://dl.dropboxusercontent.com/s/q2vrspt71f44dtw/%D9%82%D8%B5%D9%8A%D8%AF%D8%A9%20%D9%8A%D8%A7%D9%82%D8%B1%D8%A9%20%D8%A7%D9%84%D8%B9%D9%8A%D9%88%D9%86%20%D9%8A%D8%A7%D8%B3%D9%8A%D8%AF%D9%8A%20%D8%B3%D9%84%D8%A7%D9%85%D9%87%20%D8%B2%D9%8A%D9%86%D8%A8%20%D9%8A%D9%88%D9%86%D8%B3%20%D9%85%D9%88%D9%84%D8%AF%D9%A1%D9%A9%D9%A8%D9%A2.m4a",
          downloadLink:
              "https://dl.dropboxusercontent.com/s/q2vrspt71f44dtw/%D9%82%D8%B5%D9%8A%D8%AF%D8%A9%20%D9%8A%D8%A7%D9%82%D8%B1%D8%A9%20%D8%A7%D9%84%D8%B9%D9%8A%D9%88%D9%86%20%D9%8A%D8%A7%D8%B3%D9%8A%D8%AF%D9%8A%20%D8%B3%D9%84%D8%A7%D9%85%D9%87%20%D8%B2%D9%8A%D9%86%D8%A8%20%D9%8A%D9%88%D9%86%D8%B3%20%D9%85%D9%88%D9%84%D8%AF%D9%A1%D9%A9%D9%A8%D9%A2.m4a?dl=1",
        ),
        EnshadPlayer(
          index: index++,
          title: "يا سادة الحي",
          singer: "الشيخ على خليفة",
          audiolink:
              "https://dl.dropboxusercontent.com/s/bk2kb81jy800q61/%D9%8A%D8%A7%20%D8%B3%D8%A7%D8%AF%D8%A9%20%D8%A7%D9%84%D8%AD%D9%8A.m4a",
          downloadLink:
              "https://dl.dropboxusercontent.com/s/bk2kb81jy800q61/%D9%8A%D8%A7%20%D8%B3%D8%A7%D8%AF%D8%A9%20%D8%A7%D9%84%D8%AD%D9%8A.m4a?dl=1",
        ),
        EnshadPlayer(
          index: index++,
          title: "يا حلو خالص",
          singer: "الشيخ على خليفة",
          audiolink:
              "https://dl.dropboxusercontent.com/s/nvvxv6sqxbu7up1/%D8%A7%D9%84%D8%B4%D9%8A%D8%AE%20%D8%B9%D9%84%D9%8A%20%D8%AE%D9%84%D9%8A%D9%81%D8%A9%20_%20%D9%8A%D8%A7%20%D8%AD%D9%84%D9%88%20%D8%AE%D8%A7%D9%84%D8%B5.mp3",
          downloadLink:
              "https://dl.dropboxusercontent.com/s/nvvxv6sqxbu7up1/%D8%A7%D9%84%D8%B4%D9%8A%D8%AE%20%D8%B9%D9%84%D9%8A%20%D8%AE%D9%84%D9%8A%D9%81%D8%A9%20_%20%D9%8A%D8%A7%20%D8%AD%D9%84%D9%88%20%D8%AE%D8%A7%D9%84%D8%B5.mp3?dl=1",
        ),
        EnshadPlayer(
          index: index++,
          title: "توسلت بالهادي الحبيب محمد",
          singer: "الشيخ على خليفة",
          audiolink:
              "https://dl.dropboxusercontent.com/s/sren4t1fhzzonur/%D8%AA%D9%88%D8%B3%D9%84%D8%AA%20%D8%A8%D8%A7%D9%84%D9%87%D8%A7%D8%AF%D9%89%20%D8%A7%D9%84%D8%AD%D8%A8%D9%8A%D8%A8%20%D9%85%D8%AD%D9%85%D8%AF.mp3",
          downloadLink:
              "https://dl.dropboxusercontent.com/s/sren4t1fhzzonur/%D8%AA%D9%88%D8%B3%D9%84%D8%AA%20%D8%A8%D8%A7%D9%84%D9%87%D8%A7%D8%AF%D9%89%20%D8%A7%D9%84%D8%AD%D8%A8%D9%8A%D8%A8%20%D9%85%D8%AD%D9%85%D8%AF.mp3?dl=1",
        ),
        EnshadPlayer(
          index: index++,
          title: "اياما بالوفا",
          singer: "الشيخ على خليفة و خضرات الاحباب",
          audiolink:
              "https://dl.dropboxusercontent.com/s/ol54wxcoshtrt95/%D8%A7%D9%8A%D8%A7%D9%85%D8%A7%20%D8%A8%D8%A7%D9%84%D9%88%D9%81%D8%A7.m4a",
          downloadLink:
              "https://dl.dropboxusercontent.com/s/ol54wxcoshtrt95/%D8%A7%D9%8A%D8%A7%D9%85%D8%A7%20%D8%A8%D8%A7%D9%84%D9%88%D9%81%D8%A7.m4a?dl=1",
        ),
        EnshadPlayer(
          index: index++,
          title: "قسمآ بنور المصطفى و جماله",
          singer: "الشيخ على خليفة",
          audiolink:
              "https://dl.dropboxusercontent.com/s/zdzo4i9iuqqo9pm/%D9%82%D8%B3%D9%85%D8%A7%D9%8B%20%D8%A8%D9%86%D9%88%D8%B1%20%D8%A7%D9%84%D9%85%D8%B5%D8%B7%D9%81%D9%8A%20%D9%88%D8%AC%D9%85%D8%A7%D9%84%D9%87%D9%90.mp3",
          downloadLink:
              "https://dl.dropboxusercontent.com/s/zdzo4i9iuqqo9pm/%D9%82%D8%B3%D9%85%D8%A7%D9%8B%20%D8%A8%D9%86%D9%88%D8%B1%20%D8%A7%D9%84%D9%85%D8%B5%D8%B7%D9%81%D9%8A%20%D9%88%D8%AC%D9%85%D8%A7%D9%84%D9%87%D9%90.mp3?dl=1",
        ),
        EnshadPlayer(
          index: index++,
          title: "حب سادتنا سعادة",
          singer: "الشيخ على خليفة",
          audiolink:
              "https://dl.dropboxusercontent.com/s/28n05cfbyjlef9a/%D8%AD%D8%A8%20%D8%B3%D8%A7%D8%AF%D8%AA%D9%86%D8%A7%20%D8%B3%D8%B9%D8%A7%D8%AF%D8%A9.mp3",
          downloadLink:
              "https://dl.dropboxusercontent.com/s/28n05cfbyjlef9a/%D8%AD%D8%A8%20%D8%B3%D8%A7%D8%AF%D8%AA%D9%86%D8%A7%20%D8%B3%D8%B9%D8%A7%D8%AF%D8%A9.mp3?dl=1",
        ),
        EnshadPlayer(
          index: index++,
          title: "في حضرة تجلى",
          singer: "الشيخ على خليفة",
          audiolink:
              "https://dl.dropboxusercontent.com/s/mf52p90ikhvyar3/%D9%81%D9%8A%20%D8%AD%D8%B6%D8%B1%D8%A9%20%D8%AA%D8%AC%D9%84%D9%89.mp3",
          downloadLink:
              "https://dl.dropboxusercontent.com/s/mf52p90ikhvyar3/%D9%81%D9%8A%20%D8%AD%D8%B6%D8%B1%D8%A9%20%D8%AA%D8%AC%D9%84%D9%89.mp3?dl=1",
        ),
        EnshadPlayer(
          index: index++,
          title: "وحياة جمالك",
          singer: "الشيخ على خليفة",
          audiolink:
              "https://dl.dropboxusercontent.com/s/9010717ivx0llnc/%D9%82%D8%B5%D9%8A%D8%AF%D8%A9%20%D9%88%D8%AD%D9%8A%D8%A7%D8%A9%20%D8%AC%D9%85%D8%A7%D9%84%D9%83%20%D9%85%D9%88%D9%84%D8%AF%20%D8%B3%D9%8A%D8%AF%D9%8A%20%D8%B3%D9%84%D8%A7%D9%85%D9%87%20%D9%A2%D9%A0%D9%A1%D9%A8.mp3",
          downloadLink:
              "https://dl.dropboxusercontent.com/s/9010717ivx0llnc/%D9%82%D8%B5%D9%8A%D8%AF%D8%A9%20%D9%88%D8%AD%D9%8A%D8%A7%D8%A9%20%D8%AC%D9%85%D8%A7%D9%84%D9%83%20%D9%85%D9%88%D9%84%D8%AF%20%D8%B3%D9%8A%D8%AF%D9%8A%20%D8%B3%D9%84%D8%A7%D9%85%D9%87%20%D9%A2%D9%A0%D9%A1%D9%A8.mp3?dl=1",
        ),
      ],
    );
  }
}
