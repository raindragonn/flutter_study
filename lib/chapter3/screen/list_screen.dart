import 'package:flutter/material.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Book List"),
      ),
      body: ListView(
        children: [
          BookTile(
              title: "헤어질 결심 각본",
              category: "  국내도서 > 예술 > 영화/드라마 > 시나리오/연출",
              description:
                  "영화 각본이 선사하는 즐거움 중 하나는 촬영과 편집을 마친 최종 결과물과의 차이를 발견하는 것이다. 『헤어질 결심 각본』은 특히 이런 발견의 즐거움을 풍부하게 담고 있다. 예를 들어 서래가 직접 지어낸 『산해경』 이야기는 서래의 내면을 바라볼 수 있는 열쇠를 하나 더 제공하며, 이포로 떠난 해준이 전해 듣게 되는 질곡동 사건의 후일담은 불길한 기운을 풍긴다. 이렇듯 편집 과정에서 삭제된 부분들 역시 하나같이 [헤어질 결심]의 세계를 더 풍요롭게 만들어 주고 있어서, 이 책의 독자들은 자신만의 ‘관객판’ 편집본을 상상할 수 있을 것이다.",
              image: "http://image.yes24.com/goods/110791050/L"),
          BookTile(
              title: "흔한남매 11",
              category:
                  "  국내도서 > 어린이 > 1-2학년 > 1-2학년 만화/애니메이션 > 1-2학년 애니메이션/영화드라마 원작",
              description:
                  "『흔한남매 11』은 [흔한남매] 유튜브 영상의 스토리를 앙증맞고 유머러스한 만화로 풀어 낸 코믹북입니다. 어린이의 웃음 코드에 맞춰 엄선한 에피소드를 앙증맞고 유머러스한 만화로 풀어 냈습니다. 웃음을 유발하는 에이미와 으뜸이의 티격태격 일상은 물론이고, 무더운 여름날 펼쳐지는 왁자지껄 물총 싸움, 흔한남매의 시골 생활, 흔한 동네에서 유명한 씁아저씨와의 첫 만남 등 골라 읽는 재미가 가득한 에피소드 만화가 수록되어 있습니다. 또한 에피소드 만화 중간중간에는 유튜브에서는 만날 수 없었던 ‘욱신욱신 숨은 충치균 찾기’, ‘구독, 좋아요! 나만의 너튜브 만들기’, ‘요리조리 사다리 타기’ 등 깨알 재미가 가득한 놀이 페이지가 수록되어 있습니다.",
              image: "http://image.yes24.com/goods/110836828/L"),
          BookTile(
              title: "계속 가보겠습니다",
              category: "  국내도서 > 사회 정치 > 사회비평/비판 > 정치비평",
              description:
                  "《계속 가보겠습니다》의 저자인 임은정은 2007년 ‘공판 업무 유공’을 인정받아 검찰총장상을 받았고, 2012년에는 법무부가 선정하는 ‘우수 여성 검사’가 되어 서울중앙지검 공판부에 배치되는 등 검찰 내 엘리트 코스를 밟던 검사였다. 한때 ‘도가니 검사’로도 불리며 검찰 조직에서 승승장구하던 검사 임은정, 이제는 끊임없이 검사 적격 심사의 대상자에 오르는 검찰 조직의 ‘미운 오리 새끼’가 되었다. 검찰 내 각종 부조리를 폭로하고, 과거사 재심 사건에서 ‘백지 구형’이 아닌 ‘무죄 구형’을 강행하면서 골칫거리 문제 검사가 됐기 때문이다.",
              image: "http://image.yes24.com/goods/110665496/L"),
          BookTile(
              title: "역행자",
              category: "  국내도서 > 자기계발 > 성공학/경력관리",
              description:
                  "대부분의 사람들은 유전자와 본성의 명령을 그대로 따르기 때문에 평범함을 벗어날 수 없다. 하지만 정작 자신은 이를 모른 채 ‘나는 달라’ 하는 자의식에 사로잡혀서 무한 합리화에 빠져 살아간다. 스스로가 얼마나 많은 정신적, 심리적 오류를 저지르는지 알지 못한 채 매일 똑같은 쳇바퀴를 돌 뿐이다. 왜 우리는 진짜 자유를 얻지 못하는가? 왜 늘 돈 이야기를 하면서도 평생 돈에 허덕이는가?",
              image: "http://image.yes24.com/goods/109705390/L"),
          BookTile(
              title: "불편한 편의점",
              category: "  국내도서 > 소설/시/희곡 > 한국소설 > 한국 장편소설",
              description:
                  "2013년 세계문학상 우수상 수상작 『망원동 브라더스』로 데뷔한 후 일상적 현실을 위트 있게 그린 경쾌한 작품과 인간의 내밀한 욕망을 기발한 상상력으로 풀어낸 스릴러 장르를 오가며 독자적인 작품 세계를 쌓아올린 작가 김호연. 그의 다섯 번째 장편소설 『불편한 편의점』이 출간되었다. 『불편한 편의점』은 청파동 골목 모퉁이에 자리 잡은 작은 편의점을 무대로 힘겨운 시대를 살아가는 우리 이웃들의 삶의 속내와 희로애락을 따뜻하고 유머러스하게 담아낸 작품이다. 『망원동 브라더스』에서 망원동이라는 공간의 체험적 지리지를 잘 활용해 유쾌한 재미와 공감을 이끌어냈듯 이번에는 서울의 오래된 동네 청파동에 대한 공감각을 생생하게 포착해 또 하나의 흥미진진한 ‘동네 이야기’를 탄생시켰다.",
              image: "http://image.yes24.com/goods/99308021/L"),
        ],
      ),
    );
  }
}

class BookTile extends StatelessWidget {
  final String title;
  final String category;
  final String description;
  final String image;

  BookTile(
      {required this.title,
      required this.category,
      required this.description,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      child: ListTile(
        title: Text(title),
        leading: Image.network(image),
        onTap: () {},
      ),
    );
  }
}
