import 'package:get/get.dart';
import 'package:lachule/bases/base_controller.dart';
import 'package:lachule/models/best_sell_goods_model.dart';
import 'package:lachule/models/promotion_model.dart';
import 'package:lachule/models/recommend_goods_medel.dart';
import 'package:lachule/routes/app_pages.dart';

class HomeController extends BaseController {
  @override
  void onInit() {
    // TODO: implement onInit

    Future.delayed(const Duration(milliseconds: 2500), () {
      stopLoad();
    });
    super.onInit();
  }

  RxInt currentCarousel = 0.obs;
  String userFirstName = 'ดวงเดือน';
  String userLastName = 'ลัทธิพงศ์';

  // List

  List<String> imageCarousel = [
    'https://s3-alpha-sig.figma.com/img/04eb/1d0f/d9a28b59aa5b89ff2f7a59130c33015c?Expires=1676851200&Signature=qJcrfcqBZwdlPsmfuEpulc1GyX4RKc1qQaI2VQ1mLQY3RattAq98Dtf4NzQtgKaVqP3HcMZPazW2QxdXoriBETBEF~h3iMdckolup2DS9DkZ5NFpd7OkAoTR1Mhz~qviVHx-FTwV7D8LRoI-egNP0SNoBxxDpZaTny3Xb0i~pVHr6uSG9xfeohFwb3nD0114sZ93dAIjUgcUllB9trqVr9mnMFoSKTitwJBPmEZN3~dU3hLLd~Fh6WdcObpORkCYZG4R2kzq5PqIRiJfoLp5raPwCHA7tCDScC333ti5rEKXelaodQ472MQ5tTpU38mulLMuw0kIHiPP1a69xn3-5Q__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
    'https://s3-alpha-sig.figma.com/img/04eb/1d0f/d9a28b59aa5b89ff2f7a59130c33015c?Expires=1676851200&Signature=qJcrfcqBZwdlPsmfuEpulc1GyX4RKc1qQaI2VQ1mLQY3RattAq98Dtf4NzQtgKaVqP3HcMZPazW2QxdXoriBETBEF~h3iMdckolup2DS9DkZ5NFpd7OkAoTR1Mhz~qviVHx-FTwV7D8LRoI-egNP0SNoBxxDpZaTny3Xb0i~pVHr6uSG9xfeohFwb3nD0114sZ93dAIjUgcUllB9trqVr9mnMFoSKTitwJBPmEZN3~dU3hLLd~Fh6WdcObpORkCYZG4R2kzq5PqIRiJfoLp5raPwCHA7tCDScC333ti5rEKXelaodQ472MQ5tTpU38mulLMuw0kIHiPP1a69xn3-5Q__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
    'https://s3-alpha-sig.figma.com/img/04eb/1d0f/d9a28b59aa5b89ff2f7a59130c33015c?Expires=1676851200&Signature=qJcrfcqBZwdlPsmfuEpulc1GyX4RKc1qQaI2VQ1mLQY3RattAq98Dtf4NzQtgKaVqP3HcMZPazW2QxdXoriBETBEF~h3iMdckolup2DS9DkZ5NFpd7OkAoTR1Mhz~qviVHx-FTwV7D8LRoI-egNP0SNoBxxDpZaTny3Xb0i~pVHr6uSG9xfeohFwb3nD0114sZ93dAIjUgcUllB9trqVr9mnMFoSKTitwJBPmEZN3~dU3hLLd~Fh6WdcObpORkCYZG4R2kzq5PqIRiJfoLp5raPwCHA7tCDScC333ti5rEKXelaodQ472MQ5tTpU38mulLMuw0kIHiPP1a69xn3-5Q__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
    'https://s3-alpha-sig.figma.com/img/04eb/1d0f/d9a28b59aa5b89ff2f7a59130c33015c?Expires=1676851200&Signature=qJcrfcqBZwdlPsmfuEpulc1GyX4RKc1qQaI2VQ1mLQY3RattAq98Dtf4NzQtgKaVqP3HcMZPazW2QxdXoriBETBEF~h3iMdckolup2DS9DkZ5NFpd7OkAoTR1Mhz~qviVHx-FTwV7D8LRoI-egNP0SNoBxxDpZaTny3Xb0i~pVHr6uSG9xfeohFwb3nD0114sZ93dAIjUgcUllB9trqVr9mnMFoSKTitwJBPmEZN3~dU3hLLd~Fh6WdcObpORkCYZG4R2kzq5PqIRiJfoLp5raPwCHA7tCDScC333ti5rEKXelaodQ472MQ5tTpU38mulLMuw0kIHiPP1a69xn3-5Q__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
    'https://s3-alpha-sig.figma.com/img/04eb/1d0f/d9a28b59aa5b89ff2f7a59130c33015c?Expires=1676851200&Signature=qJcrfcqBZwdlPsmfuEpulc1GyX4RKc1qQaI2VQ1mLQY3RattAq98Dtf4NzQtgKaVqP3HcMZPazW2QxdXoriBETBEF~h3iMdckolup2DS9DkZ5NFpd7OkAoTR1Mhz~qviVHx-FTwV7D8LRoI-egNP0SNoBxxDpZaTny3Xb0i~pVHr6uSG9xfeohFwb3nD0114sZ93dAIjUgcUllB9trqVr9mnMFoSKTitwJBPmEZN3~dU3hLLd~Fh6WdcObpORkCYZG4R2kzq5PqIRiJfoLp5raPwCHA7tCDScC333ti5rEKXelaodQ472MQ5tTpU38mulLMuw0kIHiPP1a69xn3-5Q__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
  ];
  final List<PromotionModel> _promotionList = [
    PromotionModel(
      id: '1',
      image:
          'https://s3-alpha-sig.figma.com/img/f183/300a/727e94c90c923dfc3091ac83d14723e0?Expires=1676851200&Signature=EMRMPnmbvcddM19JJNiV3UPT5ESxKS9BQHvMGGddU20M7rxmGGAxwxuCnv0f-yAL6jCRCfaYCGBOB1lMDv8YtxuJSNvasBxLOWDmnfvjXD~xcQ6AhOcoRapzNNmdkrfRi6C4kZsXBUtrWzHlaRXMU5VxrEXRQa5aEqoYh~8GQ9nwTeuFy8YaGFc~H7wGf2nlejTPHURjiA8xzkHC0HgccVoucjlLYutZsFLH8ASrQOvxGJ8iLvzOM2IjERczjeGl5wR6WWghHCS6BF2FElIiT6o-~2Rr32UvHBVgtUfvaGHK~fAHVyn7jkF91Wm2cKK-M02kUpj0VEU-NIJ9GRRF2w__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'โปรโมชั่นเดือนพฤศจิกายน 2565',
    ),
    PromotionModel(
      id: '2',
      image:
          'https://s3-alpha-sig.figma.com/img/f183/300a/727e94c90c923dfc3091ac83d14723e0?Expires=1676851200&Signature=EMRMPnmbvcddM19JJNiV3UPT5ESxKS9BQHvMGGddU20M7rxmGGAxwxuCnv0f-yAL6jCRCfaYCGBOB1lMDv8YtxuJSNvasBxLOWDmnfvjXD~xcQ6AhOcoRapzNNmdkrfRi6C4kZsXBUtrWzHlaRXMU5VxrEXRQa5aEqoYh~8GQ9nwTeuFy8YaGFc~H7wGf2nlejTPHURjiA8xzkHC0HgccVoucjlLYutZsFLH8ASrQOvxGJ8iLvzOM2IjERczjeGl5wR6WWghHCS6BF2FElIiT6o-~2Rr32UvHBVgtUfvaGHK~fAHVyn7jkF91Wm2cKK-M02kUpj0VEU-NIJ9GRRF2w__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'โปรโมชั่นเดือนตุลาคม 2565',
    ),
    PromotionModel(
      id: '3',
      image:
          'https://s3-alpha-sig.figma.com/img/f183/300a/727e94c90c923dfc3091ac83d14723e0?Expires=1676851200&Signature=EMRMPnmbvcddM19JJNiV3UPT5ESxKS9BQHvMGGddU20M7rxmGGAxwxuCnv0f-yAL6jCRCfaYCGBOB1lMDv8YtxuJSNvasBxLOWDmnfvjXD~xcQ6AhOcoRapzNNmdkrfRi6C4kZsXBUtrWzHlaRXMU5VxrEXRQa5aEqoYh~8GQ9nwTeuFy8YaGFc~H7wGf2nlejTPHURjiA8xzkHC0HgccVoucjlLYutZsFLH8ASrQOvxGJ8iLvzOM2IjERczjeGl5wR6WWghHCS6BF2FElIiT6o-~2Rr32UvHBVgtUfvaGHK~fAHVyn7jkF91Wm2cKK-M02kUpj0VEU-NIJ9GRRF2w__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'โปรโมชั่นเดือนตุลาคม 2565',
    ),
    PromotionModel(
      id: '4',
      image:
          'https://s3-alpha-sig.figma.com/img/f183/300a/727e94c90c923dfc3091ac83d14723e0?Expires=1676851200&Signature=EMRMPnmbvcddM19JJNiV3UPT5ESxKS9BQHvMGGddU20M7rxmGGAxwxuCnv0f-yAL6jCRCfaYCGBOB1lMDv8YtxuJSNvasBxLOWDmnfvjXD~xcQ6AhOcoRapzNNmdkrfRi6C4kZsXBUtrWzHlaRXMU5VxrEXRQa5aEqoYh~8GQ9nwTeuFy8YaGFc~H7wGf2nlejTPHURjiA8xzkHC0HgccVoucjlLYutZsFLH8ASrQOvxGJ8iLvzOM2IjERczjeGl5wR6WWghHCS6BF2FElIiT6o-~2Rr32UvHBVgtUfvaGHK~fAHVyn7jkF91Wm2cKK-M02kUpj0VEU-NIJ9GRRF2w__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'โปรโมชั่นเดือนพฤศจิกายน 2565',
    ),
    PromotionModel(
      id: '5',
      image:
          'https://s3-alpha-sig.figma.com/img/f183/300a/727e94c90c923dfc3091ac83d14723e0?Expires=1676851200&Signature=EMRMPnmbvcddM19JJNiV3UPT5ESxKS9BQHvMGGddU20M7rxmGGAxwxuCnv0f-yAL6jCRCfaYCGBOB1lMDv8YtxuJSNvasBxLOWDmnfvjXD~xcQ6AhOcoRapzNNmdkrfRi6C4kZsXBUtrWzHlaRXMU5VxrEXRQa5aEqoYh~8GQ9nwTeuFy8YaGFc~H7wGf2nlejTPHURjiA8xzkHC0HgccVoucjlLYutZsFLH8ASrQOvxGJ8iLvzOM2IjERczjeGl5wR6WWghHCS6BF2FElIiT6o-~2Rr32UvHBVgtUfvaGHK~fAHVyn7jkF91Wm2cKK-M02kUpj0VEU-NIJ9GRRF2w__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'โปรโมชั่นเดือนตุลาคม 2565',
    ),
  ];

  final List<BestSellGoodsModel> _bestSellGoodsList = [
    BestSellGoodsModel(
      id: '1',
      image:
          'https://s3-alpha-sig.figma.com/img/3882/55bc/dafa8fbfd8ac49059021da6fe48915a5?Expires=1676851200&Signature=i4FVia4VvNmeEbiFcw~60nY2n2SD0hKOaOllxxW1UTeWQbVmdIwonAewL3ymvSpm10ba1DAhtZFWesG7CxzlxNm7eJ89Uu6PA1qV2imVHpdJUWwqP1g48Y08iY187J5baqBg-omqWM2ABzY3TwmZR8DbdtnaxjMNFFY6UZdwavBsK5js2iD1ezz0xX3lbu6NRqi691J8oNmBPIiH5A--d4GfAX3hjdhxCxmAXpJZoBRWosemRWsdDGozCVcnvk~fSEgg5eC3~29dlRxDYNLVuzQ53nH1mPaOFcUzF0EkfqUPVzKMtO29eJYAj93TXHPrnlA8mDi1yQrCeysu-8fhjg__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'นาโน แอคเน่ ครีม จีพีโฟร์จี',
    ),
    BestSellGoodsModel(
      id: '2',
      image:
          'https://s3-alpha-sig.figma.com/img/3882/55bc/dafa8fbfd8ac49059021da6fe48915a5?Expires=1676851200&Signature=i4FVia4VvNmeEbiFcw~60nY2n2SD0hKOaOllxxW1UTeWQbVmdIwonAewL3ymvSpm10ba1DAhtZFWesG7CxzlxNm7eJ89Uu6PA1qV2imVHpdJUWwqP1g48Y08iY187J5baqBg-omqWM2ABzY3TwmZR8DbdtnaxjMNFFY6UZdwavBsK5js2iD1ezz0xX3lbu6NRqi691J8oNmBPIiH5A--d4GfAX3hjdhxCxmAXpJZoBRWosemRWsdDGozCVcnvk~fSEgg5eC3~29dlRxDYNLVuzQ53nH1mPaOFcUzF0EkfqUPVzKMtO29eJYAj93TXHPrnlA8mDi1yQrCeysu-8fhjg__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'นาโน ซันสกรีน ครีม จีพีโฟร์จี SPF50 PA+++',
    ),
    BestSellGoodsModel(
      id: '3',
      image:
          'https://s3-alpha-sig.figma.com/img/3882/55bc/dafa8fbfd8ac49059021da6fe48915a5?Expires=1676851200&Signature=i4FVia4VvNmeEbiFcw~60nY2n2SD0hKOaOllxxW1UTeWQbVmdIwonAewL3ymvSpm10ba1DAhtZFWesG7CxzlxNm7eJ89Uu6PA1qV2imVHpdJUWwqP1g48Y08iY187J5baqBg-omqWM2ABzY3TwmZR8DbdtnaxjMNFFY6UZdwavBsK5js2iD1ezz0xX3lbu6NRqi691J8oNmBPIiH5A--d4GfAX3hjdhxCxmAXpJZoBRWosemRWsdDGozCVcnvk~fSEgg5eC3~29dlRxDYNLVuzQ53nH1mPaOFcUzF0EkfqUPVzKMtO29eJYAj93TXHPrnlA8mDi1yQrCeysu-8fhjg__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'นาโน มอยส์เจอร์ไรเซอร์ ครีม จีพีโฟร์จี',
    ),
    BestSellGoodsModel(
      id: '4',
      image:
          'https://s3-alpha-sig.figma.com/img/3882/55bc/dafa8fbfd8ac49059021da6fe48915a5?Expires=1676851200&Signature=i4FVia4VvNmeEbiFcw~60nY2n2SD0hKOaOllxxW1UTeWQbVmdIwonAewL3ymvSpm10ba1DAhtZFWesG7CxzlxNm7eJ89Uu6PA1qV2imVHpdJUWwqP1g48Y08iY187J5baqBg-omqWM2ABzY3TwmZR8DbdtnaxjMNFFY6UZdwavBsK5js2iD1ezz0xX3lbu6NRqi691J8oNmBPIiH5A--d4GfAX3hjdhxCxmAXpJZoBRWosemRWsdDGozCVcnvk~fSEgg5eC3~29dlRxDYNLVuzQ53nH1mPaOFcUzF0EkfqUPVzKMtO29eJYAj93TXHPrnlA8mDi1yQrCeysu-8fhjg__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'นาโน แอคเน่ ครีม จีพีโฟร์จี',
    ),
    BestSellGoodsModel(
      id: '5',
      image:
          'https://s3-alpha-sig.figma.com/img/3882/55bc/dafa8fbfd8ac49059021da6fe48915a5?Expires=1676851200&Signature=i4FVia4VvNmeEbiFcw~60nY2n2SD0hKOaOllxxW1UTeWQbVmdIwonAewL3ymvSpm10ba1DAhtZFWesG7CxzlxNm7eJ89Uu6PA1qV2imVHpdJUWwqP1g48Y08iY187J5baqBg-omqWM2ABzY3TwmZR8DbdtnaxjMNFFY6UZdwavBsK5js2iD1ezz0xX3lbu6NRqi691J8oNmBPIiH5A--d4GfAX3hjdhxCxmAXpJZoBRWosemRWsdDGozCVcnvk~fSEgg5eC3~29dlRxDYNLVuzQ53nH1mPaOFcUzF0EkfqUPVzKMtO29eJYAj93TXHPrnlA8mDi1yQrCeysu-8fhjg__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'นาโน ซันสกรีน ครีม จีพีโฟร์จี SPF50 PA+++',
    ),
    BestSellGoodsModel(
      id: '6',
      image:
          'https://s3-alpha-sig.figma.com/img/3882/55bc/dafa8fbfd8ac49059021da6fe48915a5?Expires=1676851200&Signature=i4FVia4VvNmeEbiFcw~60nY2n2SD0hKOaOllxxW1UTeWQbVmdIwonAewL3ymvSpm10ba1DAhtZFWesG7CxzlxNm7eJ89Uu6PA1qV2imVHpdJUWwqP1g48Y08iY187J5baqBg-omqWM2ABzY3TwmZR8DbdtnaxjMNFFY6UZdwavBsK5js2iD1ezz0xX3lbu6NRqi691J8oNmBPIiH5A--d4GfAX3hjdhxCxmAXpJZoBRWosemRWsdDGozCVcnvk~fSEgg5eC3~29dlRxDYNLVuzQ53nH1mPaOFcUzF0EkfqUPVzKMtO29eJYAj93TXHPrnlA8mDi1yQrCeysu-8fhjg__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'นาโน มอยส์เจอร์ไรเซอร์ ครีม จีพีโฟร์จี',
    ),
    BestSellGoodsModel(
      id: '7',
      image:
          'https://s3-alpha-sig.figma.com/img/3882/55bc/dafa8fbfd8ac49059021da6fe48915a5?Expires=1676851200&Signature=i4FVia4VvNmeEbiFcw~60nY2n2SD0hKOaOllxxW1UTeWQbVmdIwonAewL3ymvSpm10ba1DAhtZFWesG7CxzlxNm7eJ89Uu6PA1qV2imVHpdJUWwqP1g48Y08iY187J5baqBg-omqWM2ABzY3TwmZR8DbdtnaxjMNFFY6UZdwavBsK5js2iD1ezz0xX3lbu6NRqi691J8oNmBPIiH5A--d4GfAX3hjdhxCxmAXpJZoBRWosemRWsdDGozCVcnvk~fSEgg5eC3~29dlRxDYNLVuzQ53nH1mPaOFcUzF0EkfqUPVzKMtO29eJYAj93TXHPrnlA8mDi1yQrCeysu-8fhjg__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'นาโน แอคเน่ ครีม จีพีโฟร์จี',
    ),
    BestSellGoodsModel(
      id: '8',
      image:
          'https://s3-alpha-sig.figma.com/img/3882/55bc/dafa8fbfd8ac49059021da6fe48915a5?Expires=1676851200&Signature=i4FVia4VvNmeEbiFcw~60nY2n2SD0hKOaOllxxW1UTeWQbVmdIwonAewL3ymvSpm10ba1DAhtZFWesG7CxzlxNm7eJ89Uu6PA1qV2imVHpdJUWwqP1g48Y08iY187J5baqBg-omqWM2ABzY3TwmZR8DbdtnaxjMNFFY6UZdwavBsK5js2iD1ezz0xX3lbu6NRqi691J8oNmBPIiH5A--d4GfAX3hjdhxCxmAXpJZoBRWosemRWsdDGozCVcnvk~fSEgg5eC3~29dlRxDYNLVuzQ53nH1mPaOFcUzF0EkfqUPVzKMtO29eJYAj93TXHPrnlA8mDi1yQrCeysu-8fhjg__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'นาโน ซันสกรีน ครีม จีพีโฟร์จี SPF50 PA+++',
    ),
    BestSellGoodsModel(
      id: '9',
      image:
          'https://s3-alpha-sig.figma.com/img/3882/55bc/dafa8fbfd8ac49059021da6fe48915a5?Expires=1676851200&Signature=i4FVia4VvNmeEbiFcw~60nY2n2SD0hKOaOllxxW1UTeWQbVmdIwonAewL3ymvSpm10ba1DAhtZFWesG7CxzlxNm7eJ89Uu6PA1qV2imVHpdJUWwqP1g48Y08iY187J5baqBg-omqWM2ABzY3TwmZR8DbdtnaxjMNFFY6UZdwavBsK5js2iD1ezz0xX3lbu6NRqi691J8oNmBPIiH5A--d4GfAX3hjdhxCxmAXpJZoBRWosemRWsdDGozCVcnvk~fSEgg5eC3~29dlRxDYNLVuzQ53nH1mPaOFcUzF0EkfqUPVzKMtO29eJYAj93TXHPrnlA8mDi1yQrCeysu-8fhjg__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'นาโน มอยส์เจอร์ไรเซอร์ ครีม จีพีโฟร์จี',
    ),
    BestSellGoodsModel(
      id: '10',
      image:
          'https://s3-alpha-sig.figma.com/img/3882/55bc/dafa8fbfd8ac49059021da6fe48915a5?Expires=1676851200&Signature=i4FVia4VvNmeEbiFcw~60nY2n2SD0hKOaOllxxW1UTeWQbVmdIwonAewL3ymvSpm10ba1DAhtZFWesG7CxzlxNm7eJ89Uu6PA1qV2imVHpdJUWwqP1g48Y08iY187J5baqBg-omqWM2ABzY3TwmZR8DbdtnaxjMNFFY6UZdwavBsK5js2iD1ezz0xX3lbu6NRqi691J8oNmBPIiH5A--d4GfAX3hjdhxCxmAXpJZoBRWosemRWsdDGozCVcnvk~fSEgg5eC3~29dlRxDYNLVuzQ53nH1mPaOFcUzF0EkfqUPVzKMtO29eJYAj93TXHPrnlA8mDi1yQrCeysu-8fhjg__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'นาโน แอคเน่ ครีม จีพีโฟร์จี',
    ),
  ];

  final List<RecommendGoodsModel> _recommendGoodsList = [
    RecommendGoodsModel(
      id: '1',
      image:
          'https://s3-alpha-sig.figma.com/img/25b4/a6a3/3534ecc797a82bba2a7bc30315dc5dca?Expires=1676851200&Signature=hP5awaFDxeO0iGQkyMmkbVsitg7mGXNbHvfN06z7AmaiDNQ8ArwxmgvKJfAyDHIjniqmO~j2p-NnI0uRg06tHw5GjiWz11AQwff9rGFzkUiCXRarzUrU3HOzR45op9cTLgRWcG0-mOGDmThwM4jG58KjUKHHGGviTEk2Ow6UCX3cTJ~Xm8MClgIw~e1ufG5~LV9WwfFgvXUVNUyrFnIadWu3PF~0B~VzZGw0PBJXeUvbI3Ts7BwrbQV3PGrOElGmXYneMs64fNqnxKkmt8i8riXplNzF2pgZ9ZjGkUgdz1cjf4v9KpEdK3BV2Mq1Qq5Y5XEXcetr8icfWFKkXrXPxw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'นาโน ไวท์เทนนิ่ง โซฟ จีพีโฟร์จี',
    ),
    RecommendGoodsModel(
      id: '2',
      image:
          'https://s3-alpha-sig.figma.com/img/25b4/a6a3/3534ecc797a82bba2a7bc30315dc5dca?Expires=1676851200&Signature=hP5awaFDxeO0iGQkyMmkbVsitg7mGXNbHvfN06z7AmaiDNQ8ArwxmgvKJfAyDHIjniqmO~j2p-NnI0uRg06tHw5GjiWz11AQwff9rGFzkUiCXRarzUrU3HOzR45op9cTLgRWcG0-mOGDmThwM4jG58KjUKHHGGviTEk2Ow6UCX3cTJ~Xm8MClgIw~e1ufG5~LV9WwfFgvXUVNUyrFnIadWu3PF~0B~VzZGw0PBJXeUvbI3Ts7BwrbQV3PGrOElGmXYneMs64fNqnxKkmt8i8riXplNzF2pgZ9ZjGkUgdz1cjf4v9KpEdK3BV2Mq1Qq5Y5XEXcetr8icfWFKkXrXPxw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'คอมแพค พาวเดอร์',
    ),
    RecommendGoodsModel(
      id: '3',
      image:
          'https://s3-alpha-sig.figma.com/img/25b4/a6a3/3534ecc797a82bba2a7bc30315dc5dca?Expires=1676851200&Signature=hP5awaFDxeO0iGQkyMmkbVsitg7mGXNbHvfN06z7AmaiDNQ8ArwxmgvKJfAyDHIjniqmO~j2p-NnI0uRg06tHw5GjiWz11AQwff9rGFzkUiCXRarzUrU3HOzR45op9cTLgRWcG0-mOGDmThwM4jG58KjUKHHGGviTEk2Ow6UCX3cTJ~Xm8MClgIw~e1ufG5~LV9WwfFgvXUVNUyrFnIadWu3PF~0B~VzZGw0PBJXeUvbI3Ts7BwrbQV3PGrOElGmXYneMs64fNqnxKkmt8i8riXplNzF2pgZ9ZjGkUgdz1cjf4v9KpEdK3BV2Mq1Qq5Y5XEXcetr8icfWFKkXrXPxw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'บูสเตอร์ มาส์ก',
    ),
    RecommendGoodsModel(
      id: '4',
      image:
          'https://s3-alpha-sig.figma.com/img/25b4/a6a3/3534ecc797a82bba2a7bc30315dc5dca?Expires=1676851200&Signature=hP5awaFDxeO0iGQkyMmkbVsitg7mGXNbHvfN06z7AmaiDNQ8ArwxmgvKJfAyDHIjniqmO~j2p-NnI0uRg06tHw5GjiWz11AQwff9rGFzkUiCXRarzUrU3HOzR45op9cTLgRWcG0-mOGDmThwM4jG58KjUKHHGGviTEk2Ow6UCX3cTJ~Xm8MClgIw~e1ufG5~LV9WwfFgvXUVNUyrFnIadWu3PF~0B~VzZGw0PBJXeUvbI3Ts7BwrbQV3PGrOElGmXYneMs64fNqnxKkmt8i8riXplNzF2pgZ9ZjGkUgdz1cjf4v9KpEdK3BV2Mq1Qq5Y5XEXcetr8icfWFKkXrXPxw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'นาโน ไวท์เทนนิ่ง โซฟ จีพีโฟร์จี',
    ),
    RecommendGoodsModel(
      id: '5',
      image:
          'https://s3-alpha-sig.figma.com/img/25b4/a6a3/3534ecc797a82bba2a7bc30315dc5dca?Expires=1676851200&Signature=hP5awaFDxeO0iGQkyMmkbVsitg7mGXNbHvfN06z7AmaiDNQ8ArwxmgvKJfAyDHIjniqmO~j2p-NnI0uRg06tHw5GjiWz11AQwff9rGFzkUiCXRarzUrU3HOzR45op9cTLgRWcG0-mOGDmThwM4jG58KjUKHHGGviTEk2Ow6UCX3cTJ~Xm8MClgIw~e1ufG5~LV9WwfFgvXUVNUyrFnIadWu3PF~0B~VzZGw0PBJXeUvbI3Ts7BwrbQV3PGrOElGmXYneMs64fNqnxKkmt8i8riXplNzF2pgZ9ZjGkUgdz1cjf4v9KpEdK3BV2Mq1Qq5Y5XEXcetr8icfWFKkXrXPxw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'คอมแพค พาวเดอร์',
    ),
    RecommendGoodsModel(
      id: '6',
      image:
          'https://s3-alpha-sig.figma.com/img/25b4/a6a3/3534ecc797a82bba2a7bc30315dc5dca?Expires=1676851200&Signature=hP5awaFDxeO0iGQkyMmkbVsitg7mGXNbHvfN06z7AmaiDNQ8ArwxmgvKJfAyDHIjniqmO~j2p-NnI0uRg06tHw5GjiWz11AQwff9rGFzkUiCXRarzUrU3HOzR45op9cTLgRWcG0-mOGDmThwM4jG58KjUKHHGGviTEk2Ow6UCX3cTJ~Xm8MClgIw~e1ufG5~LV9WwfFgvXUVNUyrFnIadWu3PF~0B~VzZGw0PBJXeUvbI3Ts7BwrbQV3PGrOElGmXYneMs64fNqnxKkmt8i8riXplNzF2pgZ9ZjGkUgdz1cjf4v9KpEdK3BV2Mq1Qq5Y5XEXcetr8icfWFKkXrXPxw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'บูสเตอร์ มาส์ก',
    ),
    RecommendGoodsModel(
      id: '7',
      image:
          'https://s3-alpha-sig.figma.com/img/25b4/a6a3/3534ecc797a82bba2a7bc30315dc5dca?Expires=1676851200&Signature=hP5awaFDxeO0iGQkyMmkbVsitg7mGXNbHvfN06z7AmaiDNQ8ArwxmgvKJfAyDHIjniqmO~j2p-NnI0uRg06tHw5GjiWz11AQwff9rGFzkUiCXRarzUrU3HOzR45op9cTLgRWcG0-mOGDmThwM4jG58KjUKHHGGviTEk2Ow6UCX3cTJ~Xm8MClgIw~e1ufG5~LV9WwfFgvXUVNUyrFnIadWu3PF~0B~VzZGw0PBJXeUvbI3Ts7BwrbQV3PGrOElGmXYneMs64fNqnxKkmt8i8riXplNzF2pgZ9ZjGkUgdz1cjf4v9KpEdK3BV2Mq1Qq5Y5XEXcetr8icfWFKkXrXPxw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'นาโน ไวท์เทนนิ่ง โซฟ จีพีโฟร์จี',
    ),
    RecommendGoodsModel(
      id: '8',
      image:
          'https://s3-alpha-sig.figma.com/img/25b4/a6a3/3534ecc797a82bba2a7bc30315dc5dca?Expires=1676851200&Signature=hP5awaFDxeO0iGQkyMmkbVsitg7mGXNbHvfN06z7AmaiDNQ8ArwxmgvKJfAyDHIjniqmO~j2p-NnI0uRg06tHw5GjiWz11AQwff9rGFzkUiCXRarzUrU3HOzR45op9cTLgRWcG0-mOGDmThwM4jG58KjUKHHGGviTEk2Ow6UCX3cTJ~Xm8MClgIw~e1ufG5~LV9WwfFgvXUVNUyrFnIadWu3PF~0B~VzZGw0PBJXeUvbI3Ts7BwrbQV3PGrOElGmXYneMs64fNqnxKkmt8i8riXplNzF2pgZ9ZjGkUgdz1cjf4v9KpEdK3BV2Mq1Qq5Y5XEXcetr8icfWFKkXrXPxw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'คอมแพค พาวเดอร์',
    ),
    RecommendGoodsModel(
      id: '9',
      image:
          'https://s3-alpha-sig.figma.com/img/25b4/a6a3/3534ecc797a82bba2a7bc30315dc5dca?Expires=1676851200&Signature=hP5awaFDxeO0iGQkyMmkbVsitg7mGXNbHvfN06z7AmaiDNQ8ArwxmgvKJfAyDHIjniqmO~j2p-NnI0uRg06tHw5GjiWz11AQwff9rGFzkUiCXRarzUrU3HOzR45op9cTLgRWcG0-mOGDmThwM4jG58KjUKHHGGviTEk2Ow6UCX3cTJ~Xm8MClgIw~e1ufG5~LV9WwfFgvXUVNUyrFnIadWu3PF~0B~VzZGw0PBJXeUvbI3Ts7BwrbQV3PGrOElGmXYneMs64fNqnxKkmt8i8riXplNzF2pgZ9ZjGkUgdz1cjf4v9KpEdK3BV2Mq1Qq5Y5XEXcetr8icfWFKkXrXPxw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'บูสเตอร์ มาส์ก',
    ),
    RecommendGoodsModel(
      id: '10',
      image:
          'https://s3-alpha-sig.figma.com/img/25b4/a6a3/3534ecc797a82bba2a7bc30315dc5dca?Expires=1676851200&Signature=hP5awaFDxeO0iGQkyMmkbVsitg7mGXNbHvfN06z7AmaiDNQ8ArwxmgvKJfAyDHIjniqmO~j2p-NnI0uRg06tHw5GjiWz11AQwff9rGFzkUiCXRarzUrU3HOzR45op9cTLgRWcG0-mOGDmThwM4jG58KjUKHHGGviTEk2Ow6UCX3cTJ~Xm8MClgIw~e1ufG5~LV9WwfFgvXUVNUyrFnIadWu3PF~0B~VzZGw0PBJXeUvbI3Ts7BwrbQV3PGrOElGmXYneMs64fNqnxKkmt8i8riXplNzF2pgZ9ZjGkUgdz1cjf4v9KpEdK3BV2Mq1Qq5Y5XEXcetr8icfWFKkXrXPxw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'นาโน ไวท์เทนนิ่ง โซฟ จีพีโฟร์จี',
    ),
    RecommendGoodsModel(
      id: '11',
      image:
          'https://s3-alpha-sig.figma.com/img/25b4/a6a3/3534ecc797a82bba2a7bc30315dc5dca?Expires=1676851200&Signature=hP5awaFDxeO0iGQkyMmkbVsitg7mGXNbHvfN06z7AmaiDNQ8ArwxmgvKJfAyDHIjniqmO~j2p-NnI0uRg06tHw5GjiWz11AQwff9rGFzkUiCXRarzUrU3HOzR45op9cTLgRWcG0-mOGDmThwM4jG58KjUKHHGGviTEk2Ow6UCX3cTJ~Xm8MClgIw~e1ufG5~LV9WwfFgvXUVNUyrFnIadWu3PF~0B~VzZGw0PBJXeUvbI3Ts7BwrbQV3PGrOElGmXYneMs64fNqnxKkmt8i8riXplNzF2pgZ9ZjGkUgdz1cjf4v9KpEdK3BV2Mq1Qq5Y5XEXcetr8icfWFKkXrXPxw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'คอมแพค พาวเดอร์',
    ),
    RecommendGoodsModel(
      id: '12',
      image:
          'https://s3-alpha-sig.figma.com/img/25b4/a6a3/3534ecc797a82bba2a7bc30315dc5dca?Expires=1676851200&Signature=hP5awaFDxeO0iGQkyMmkbVsitg7mGXNbHvfN06z7AmaiDNQ8ArwxmgvKJfAyDHIjniqmO~j2p-NnI0uRg06tHw5GjiWz11AQwff9rGFzkUiCXRarzUrU3HOzR45op9cTLgRWcG0-mOGDmThwM4jG58KjUKHHGGviTEk2Ow6UCX3cTJ~Xm8MClgIw~e1ufG5~LV9WwfFgvXUVNUyrFnIadWu3PF~0B~VzZGw0PBJXeUvbI3Ts7BwrbQV3PGrOElGmXYneMs64fNqnxKkmt8i8riXplNzF2pgZ9ZjGkUgdz1cjf4v9KpEdK3BV2Mq1Qq5Y5XEXcetr8icfWFKkXrXPxw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'บูสเตอร์ มาส์ก',
    ),
    RecommendGoodsModel(
      id: '13',
      image:
          'https://s3-alpha-sig.figma.com/img/25b4/a6a3/3534ecc797a82bba2a7bc30315dc5dca?Expires=1676851200&Signature=hP5awaFDxeO0iGQkyMmkbVsitg7mGXNbHvfN06z7AmaiDNQ8ArwxmgvKJfAyDHIjniqmO~j2p-NnI0uRg06tHw5GjiWz11AQwff9rGFzkUiCXRarzUrU3HOzR45op9cTLgRWcG0-mOGDmThwM4jG58KjUKHHGGviTEk2Ow6UCX3cTJ~Xm8MClgIw~e1ufG5~LV9WwfFgvXUVNUyrFnIadWu3PF~0B~VzZGw0PBJXeUvbI3Ts7BwrbQV3PGrOElGmXYneMs64fNqnxKkmt8i8riXplNzF2pgZ9ZjGkUgdz1cjf4v9KpEdK3BV2Mq1Qq5Y5XEXcetr8icfWFKkXrXPxw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'นาโน ไวท์เทนนิ่ง โซฟ จีพีโฟร์จี',
    ),
    RecommendGoodsModel(
      id: '14',
      image:
          'https://s3-alpha-sig.figma.com/img/25b4/a6a3/3534ecc797a82bba2a7bc30315dc5dca?Expires=1676851200&Signature=hP5awaFDxeO0iGQkyMmkbVsitg7mGXNbHvfN06z7AmaiDNQ8ArwxmgvKJfAyDHIjniqmO~j2p-NnI0uRg06tHw5GjiWz11AQwff9rGFzkUiCXRarzUrU3HOzR45op9cTLgRWcG0-mOGDmThwM4jG58KjUKHHGGviTEk2Ow6UCX3cTJ~Xm8MClgIw~e1ufG5~LV9WwfFgvXUVNUyrFnIadWu3PF~0B~VzZGw0PBJXeUvbI3Ts7BwrbQV3PGrOElGmXYneMs64fNqnxKkmt8i8riXplNzF2pgZ9ZjGkUgdz1cjf4v9KpEdK3BV2Mq1Qq5Y5XEXcetr8icfWFKkXrXPxw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'คอมแพค พาวเดอร์',
    ),
    RecommendGoodsModel(
      id: '15',
      image:
          'https://s3-alpha-sig.figma.com/img/25b4/a6a3/3534ecc797a82bba2a7bc30315dc5dca?Expires=1676851200&Signature=hP5awaFDxeO0iGQkyMmkbVsitg7mGXNbHvfN06z7AmaiDNQ8ArwxmgvKJfAyDHIjniqmO~j2p-NnI0uRg06tHw5GjiWz11AQwff9rGFzkUiCXRarzUrU3HOzR45op9cTLgRWcG0-mOGDmThwM4jG58KjUKHHGGviTEk2Ow6UCX3cTJ~Xm8MClgIw~e1ufG5~LV9WwfFgvXUVNUyrFnIadWu3PF~0B~VzZGw0PBJXeUvbI3Ts7BwrbQV3PGrOElGmXYneMs64fNqnxKkmt8i8riXplNzF2pgZ9ZjGkUgdz1cjf4v9KpEdK3BV2Mq1Qq5Y5XEXcetr8icfWFKkXrXPxw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'บูสเตอร์ มาส์ก',
    ),
    RecommendGoodsModel(
      id: '16',
      image:
          'https://s3-alpha-sig.figma.com/img/25b4/a6a3/3534ecc797a82bba2a7bc30315dc5dca?Expires=1676851200&Signature=hP5awaFDxeO0iGQkyMmkbVsitg7mGXNbHvfN06z7AmaiDNQ8ArwxmgvKJfAyDHIjniqmO~j2p-NnI0uRg06tHw5GjiWz11AQwff9rGFzkUiCXRarzUrU3HOzR45op9cTLgRWcG0-mOGDmThwM4jG58KjUKHHGGviTEk2Ow6UCX3cTJ~Xm8MClgIw~e1ufG5~LV9WwfFgvXUVNUyrFnIadWu3PF~0B~VzZGw0PBJXeUvbI3Ts7BwrbQV3PGrOElGmXYneMs64fNqnxKkmt8i8riXplNzF2pgZ9ZjGkUgdz1cjf4v9KpEdK3BV2Mq1Qq5Y5XEXcetr8icfWFKkXrXPxw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'นาโน ไวท์เทนนิ่ง โซฟ จีพีโฟร์จี',
    ),
    RecommendGoodsModel(
      id: '17',
      image:
          'https://s3-alpha-sig.figma.com/img/25b4/a6a3/3534ecc797a82bba2a7bc30315dc5dca?Expires=1676851200&Signature=hP5awaFDxeO0iGQkyMmkbVsitg7mGXNbHvfN06z7AmaiDNQ8ArwxmgvKJfAyDHIjniqmO~j2p-NnI0uRg06tHw5GjiWz11AQwff9rGFzkUiCXRarzUrU3HOzR45op9cTLgRWcG0-mOGDmThwM4jG58KjUKHHGGviTEk2Ow6UCX3cTJ~Xm8MClgIw~e1ufG5~LV9WwfFgvXUVNUyrFnIadWu3PF~0B~VzZGw0PBJXeUvbI3Ts7BwrbQV3PGrOElGmXYneMs64fNqnxKkmt8i8riXplNzF2pgZ9ZjGkUgdz1cjf4v9KpEdK3BV2Mq1Qq5Y5XEXcetr8icfWFKkXrXPxw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'คอมแพค พาวเดอร์',
    ),
    RecommendGoodsModel(
      id: '18',
      image:
          'https://s3-alpha-sig.figma.com/img/25b4/a6a3/3534ecc797a82bba2a7bc30315dc5dca?Expires=1676851200&Signature=hP5awaFDxeO0iGQkyMmkbVsitg7mGXNbHvfN06z7AmaiDNQ8ArwxmgvKJfAyDHIjniqmO~j2p-NnI0uRg06tHw5GjiWz11AQwff9rGFzkUiCXRarzUrU3HOzR45op9cTLgRWcG0-mOGDmThwM4jG58KjUKHHGGviTEk2Ow6UCX3cTJ~Xm8MClgIw~e1ufG5~LV9WwfFgvXUVNUyrFnIadWu3PF~0B~VzZGw0PBJXeUvbI3Ts7BwrbQV3PGrOElGmXYneMs64fNqnxKkmt8i8riXplNzF2pgZ9ZjGkUgdz1cjf4v9KpEdK3BV2Mq1Qq5Y5XEXcetr8icfWFKkXrXPxw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'บูสเตอร์ มาส์ก',
    ),
    RecommendGoodsModel(
      id: '19',
      image:
          'https://s3-alpha-sig.figma.com/img/25b4/a6a3/3534ecc797a82bba2a7bc30315dc5dca?Expires=1676851200&Signature=hP5awaFDxeO0iGQkyMmkbVsitg7mGXNbHvfN06z7AmaiDNQ8ArwxmgvKJfAyDHIjniqmO~j2p-NnI0uRg06tHw5GjiWz11AQwff9rGFzkUiCXRarzUrU3HOzR45op9cTLgRWcG0-mOGDmThwM4jG58KjUKHHGGviTEk2Ow6UCX3cTJ~Xm8MClgIw~e1ufG5~LV9WwfFgvXUVNUyrFnIadWu3PF~0B~VzZGw0PBJXeUvbI3Ts7BwrbQV3PGrOElGmXYneMs64fNqnxKkmt8i8riXplNzF2pgZ9ZjGkUgdz1cjf4v9KpEdK3BV2Mq1Qq5Y5XEXcetr8icfWFKkXrXPxw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'นาโน ไวท์เทนนิ่ง โซฟ จีพีโฟร์จี',
    ),
    RecommendGoodsModel(
      id: '20',
      image:
          'https://s3-alpha-sig.figma.com/img/25b4/a6a3/3534ecc797a82bba2a7bc30315dc5dca?Expires=1676851200&Signature=hP5awaFDxeO0iGQkyMmkbVsitg7mGXNbHvfN06z7AmaiDNQ8ArwxmgvKJfAyDHIjniqmO~j2p-NnI0uRg06tHw5GjiWz11AQwff9rGFzkUiCXRarzUrU3HOzR45op9cTLgRWcG0-mOGDmThwM4jG58KjUKHHGGviTEk2Ow6UCX3cTJ~Xm8MClgIw~e1ufG5~LV9WwfFgvXUVNUyrFnIadWu3PF~0B~VzZGw0PBJXeUvbI3Ts7BwrbQV3PGrOElGmXYneMs64fNqnxKkmt8i8riXplNzF2pgZ9ZjGkUgdz1cjf4v9KpEdK3BV2Mq1Qq5Y5XEXcetr8icfWFKkXrXPxw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'คอมแพค พาวเดอร์',
    ),
    RecommendGoodsModel(
      id: '21',
      image:
          'https://s3-alpha-sig.figma.com/img/25b4/a6a3/3534ecc797a82bba2a7bc30315dc5dca?Expires=1676851200&Signature=hP5awaFDxeO0iGQkyMmkbVsitg7mGXNbHvfN06z7AmaiDNQ8ArwxmgvKJfAyDHIjniqmO~j2p-NnI0uRg06tHw5GjiWz11AQwff9rGFzkUiCXRarzUrU3HOzR45op9cTLgRWcG0-mOGDmThwM4jG58KjUKHHGGviTEk2Ow6UCX3cTJ~Xm8MClgIw~e1ufG5~LV9WwfFgvXUVNUyrFnIadWu3PF~0B~VzZGw0PBJXeUvbI3Ts7BwrbQV3PGrOElGmXYneMs64fNqnxKkmt8i8riXplNzF2pgZ9ZjGkUgdz1cjf4v9KpEdK3BV2Mq1Qq5Y5XEXcetr8icfWFKkXrXPxw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'บูสเตอร์ มาส์ก',
    ),
    RecommendGoodsModel(
      id: '22',
      image:
          'https://s3-alpha-sig.figma.com/img/25b4/a6a3/3534ecc797a82bba2a7bc30315dc5dca?Expires=1676851200&Signature=hP5awaFDxeO0iGQkyMmkbVsitg7mGXNbHvfN06z7AmaiDNQ8ArwxmgvKJfAyDHIjniqmO~j2p-NnI0uRg06tHw5GjiWz11AQwff9rGFzkUiCXRarzUrU3HOzR45op9cTLgRWcG0-mOGDmThwM4jG58KjUKHHGGviTEk2Ow6UCX3cTJ~Xm8MClgIw~e1ufG5~LV9WwfFgvXUVNUyrFnIadWu3PF~0B~VzZGw0PBJXeUvbI3Ts7BwrbQV3PGrOElGmXYneMs64fNqnxKkmt8i8riXplNzF2pgZ9ZjGkUgdz1cjf4v9KpEdK3BV2Mq1Qq5Y5XEXcetr8icfWFKkXrXPxw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'นาโน ไวท์เทนนิ่ง โซฟ จีพีโฟร์จี',
    ),
    RecommendGoodsModel(
      id: '23',
      image:
          'https://s3-alpha-sig.figma.com/img/25b4/a6a3/3534ecc797a82bba2a7bc30315dc5dca?Expires=1676851200&Signature=hP5awaFDxeO0iGQkyMmkbVsitg7mGXNbHvfN06z7AmaiDNQ8ArwxmgvKJfAyDHIjniqmO~j2p-NnI0uRg06tHw5GjiWz11AQwff9rGFzkUiCXRarzUrU3HOzR45op9cTLgRWcG0-mOGDmThwM4jG58KjUKHHGGviTEk2Ow6UCX3cTJ~Xm8MClgIw~e1ufG5~LV9WwfFgvXUVNUyrFnIadWu3PF~0B~VzZGw0PBJXeUvbI3Ts7BwrbQV3PGrOElGmXYneMs64fNqnxKkmt8i8riXplNzF2pgZ9ZjGkUgdz1cjf4v9KpEdK3BV2Mq1Qq5Y5XEXcetr8icfWFKkXrXPxw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'คอมแพค พาวเดอร์',
    ),
    RecommendGoodsModel(
      id: '24',
      image:
          'https://s3-alpha-sig.figma.com/img/25b4/a6a3/3534ecc797a82bba2a7bc30315dc5dca?Expires=1676851200&Signature=hP5awaFDxeO0iGQkyMmkbVsitg7mGXNbHvfN06z7AmaiDNQ8ArwxmgvKJfAyDHIjniqmO~j2p-NnI0uRg06tHw5GjiWz11AQwff9rGFzkUiCXRarzUrU3HOzR45op9cTLgRWcG0-mOGDmThwM4jG58KjUKHHGGviTEk2Ow6UCX3cTJ~Xm8MClgIw~e1ufG5~LV9WwfFgvXUVNUyrFnIadWu3PF~0B~VzZGw0PBJXeUvbI3Ts7BwrbQV3PGrOElGmXYneMs64fNqnxKkmt8i8riXplNzF2pgZ9ZjGkUgdz1cjf4v9KpEdK3BV2Mq1Qq5Y5XEXcetr8icfWFKkXrXPxw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'บูสเตอร์ มาส์ก',
    ),
    RecommendGoodsModel(
      id: '25',
      image:
          'https://s3-alpha-sig.figma.com/img/25b4/a6a3/3534ecc797a82bba2a7bc30315dc5dca?Expires=1676851200&Signature=hP5awaFDxeO0iGQkyMmkbVsitg7mGXNbHvfN06z7AmaiDNQ8ArwxmgvKJfAyDHIjniqmO~j2p-NnI0uRg06tHw5GjiWz11AQwff9rGFzkUiCXRarzUrU3HOzR45op9cTLgRWcG0-mOGDmThwM4jG58KjUKHHGGviTEk2Ow6UCX3cTJ~Xm8MClgIw~e1ufG5~LV9WwfFgvXUVNUyrFnIadWu3PF~0B~VzZGw0PBJXeUvbI3Ts7BwrbQV3PGrOElGmXYneMs64fNqnxKkmt8i8riXplNzF2pgZ9ZjGkUgdz1cjf4v9KpEdK3BV2Mq1Qq5Y5XEXcetr8icfWFKkXrXPxw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'นาโน ไวท์เทนนิ่ง โซฟ จีพีโฟร์จี',
    ),
    RecommendGoodsModel(
      id: '26',
      image:
          'https://s3-alpha-sig.figma.com/img/25b4/a6a3/3534ecc797a82bba2a7bc30315dc5dca?Expires=1676851200&Signature=hP5awaFDxeO0iGQkyMmkbVsitg7mGXNbHvfN06z7AmaiDNQ8ArwxmgvKJfAyDHIjniqmO~j2p-NnI0uRg06tHw5GjiWz11AQwff9rGFzkUiCXRarzUrU3HOzR45op9cTLgRWcG0-mOGDmThwM4jG58KjUKHHGGviTEk2Ow6UCX3cTJ~Xm8MClgIw~e1ufG5~LV9WwfFgvXUVNUyrFnIadWu3PF~0B~VzZGw0PBJXeUvbI3Ts7BwrbQV3PGrOElGmXYneMs64fNqnxKkmt8i8riXplNzF2pgZ9ZjGkUgdz1cjf4v9KpEdK3BV2Mq1Qq5Y5XEXcetr8icfWFKkXrXPxw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'คอมแพค พาวเดอร์',
    ),
    RecommendGoodsModel(
      id: '27',
      image:
          'https://s3-alpha-sig.figma.com/img/25b4/a6a3/3534ecc797a82bba2a7bc30315dc5dca?Expires=1676851200&Signature=hP5awaFDxeO0iGQkyMmkbVsitg7mGXNbHvfN06z7AmaiDNQ8ArwxmgvKJfAyDHIjniqmO~j2p-NnI0uRg06tHw5GjiWz11AQwff9rGFzkUiCXRarzUrU3HOzR45op9cTLgRWcG0-mOGDmThwM4jG58KjUKHHGGviTEk2Ow6UCX3cTJ~Xm8MClgIw~e1ufG5~LV9WwfFgvXUVNUyrFnIadWu3PF~0B~VzZGw0PBJXeUvbI3Ts7BwrbQV3PGrOElGmXYneMs64fNqnxKkmt8i8riXplNzF2pgZ9ZjGkUgdz1cjf4v9KpEdK3BV2Mq1Qq5Y5XEXcetr8icfWFKkXrXPxw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'บูสเตอร์ มาส์ก',
    ),
    RecommendGoodsModel(
      id: '28',
      image:
          'https://s3-alpha-sig.figma.com/img/25b4/a6a3/3534ecc797a82bba2a7bc30315dc5dca?Expires=1676851200&Signature=hP5awaFDxeO0iGQkyMmkbVsitg7mGXNbHvfN06z7AmaiDNQ8ArwxmgvKJfAyDHIjniqmO~j2p-NnI0uRg06tHw5GjiWz11AQwff9rGFzkUiCXRarzUrU3HOzR45op9cTLgRWcG0-mOGDmThwM4jG58KjUKHHGGviTEk2Ow6UCX3cTJ~Xm8MClgIw~e1ufG5~LV9WwfFgvXUVNUyrFnIadWu3PF~0B~VzZGw0PBJXeUvbI3Ts7BwrbQV3PGrOElGmXYneMs64fNqnxKkmt8i8riXplNzF2pgZ9ZjGkUgdz1cjf4v9KpEdK3BV2Mq1Qq5Y5XEXcetr8icfWFKkXrXPxw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'นาโน ไวท์เทนนิ่ง โซฟ จีพีโฟร์จี',
    ),
    RecommendGoodsModel(
      id: '29',
      image:
          'https://s3-alpha-sig.figma.com/img/25b4/a6a3/3534ecc797a82bba2a7bc30315dc5dca?Expires=1676851200&Signature=hP5awaFDxeO0iGQkyMmkbVsitg7mGXNbHvfN06z7AmaiDNQ8ArwxmgvKJfAyDHIjniqmO~j2p-NnI0uRg06tHw5GjiWz11AQwff9rGFzkUiCXRarzUrU3HOzR45op9cTLgRWcG0-mOGDmThwM4jG58KjUKHHGGviTEk2Ow6UCX3cTJ~Xm8MClgIw~e1ufG5~LV9WwfFgvXUVNUyrFnIadWu3PF~0B~VzZGw0PBJXeUvbI3Ts7BwrbQV3PGrOElGmXYneMs64fNqnxKkmt8i8riXplNzF2pgZ9ZjGkUgdz1cjf4v9KpEdK3BV2Mq1Qq5Y5XEXcetr8icfWFKkXrXPxw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'คอมแพค พาวเดอร์',
    ),
    RecommendGoodsModel(
      id: '30',
      image:
          'https://s3-alpha-sig.figma.com/img/25b4/a6a3/3534ecc797a82bba2a7bc30315dc5dca?Expires=1676851200&Signature=hP5awaFDxeO0iGQkyMmkbVsitg7mGXNbHvfN06z7AmaiDNQ8ArwxmgvKJfAyDHIjniqmO~j2p-NnI0uRg06tHw5GjiWz11AQwff9rGFzkUiCXRarzUrU3HOzR45op9cTLgRWcG0-mOGDmThwM4jG58KjUKHHGGviTEk2Ow6UCX3cTJ~Xm8MClgIw~e1ufG5~LV9WwfFgvXUVNUyrFnIadWu3PF~0B~VzZGw0PBJXeUvbI3Ts7BwrbQV3PGrOElGmXYneMs64fNqnxKkmt8i8riXplNzF2pgZ9ZjGkUgdz1cjf4v9KpEdK3BV2Mq1Qq5Y5XEXcetr8icfWFKkXrXPxw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'บูสเตอร์ มาส์ก',
    ),
    RecommendGoodsModel(
      id: '31',
      image:
          'https://s3-alpha-sig.figma.com/img/25b4/a6a3/3534ecc797a82bba2a7bc30315dc5dca?Expires=1676851200&Signature=hP5awaFDxeO0iGQkyMmkbVsitg7mGXNbHvfN06z7AmaiDNQ8ArwxmgvKJfAyDHIjniqmO~j2p-NnI0uRg06tHw5GjiWz11AQwff9rGFzkUiCXRarzUrU3HOzR45op9cTLgRWcG0-mOGDmThwM4jG58KjUKHHGGviTEk2Ow6UCX3cTJ~Xm8MClgIw~e1ufG5~LV9WwfFgvXUVNUyrFnIadWu3PF~0B~VzZGw0PBJXeUvbI3Ts7BwrbQV3PGrOElGmXYneMs64fNqnxKkmt8i8riXplNzF2pgZ9ZjGkUgdz1cjf4v9KpEdK3BV2Mq1Qq5Y5XEXcetr8icfWFKkXrXPxw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'นาโน ไวท์เทนนิ่ง โซฟ จีพีโฟร์จี',
    ),
    RecommendGoodsModel(
      id: '32',
      image:
          'https://s3-alpha-sig.figma.com/img/25b4/a6a3/3534ecc797a82bba2a7bc30315dc5dca?Expires=1676851200&Signature=hP5awaFDxeO0iGQkyMmkbVsitg7mGXNbHvfN06z7AmaiDNQ8ArwxmgvKJfAyDHIjniqmO~j2p-NnI0uRg06tHw5GjiWz11AQwff9rGFzkUiCXRarzUrU3HOzR45op9cTLgRWcG0-mOGDmThwM4jG58KjUKHHGGviTEk2Ow6UCX3cTJ~Xm8MClgIw~e1ufG5~LV9WwfFgvXUVNUyrFnIadWu3PF~0B~VzZGw0PBJXeUvbI3Ts7BwrbQV3PGrOElGmXYneMs64fNqnxKkmt8i8riXplNzF2pgZ9ZjGkUgdz1cjf4v9KpEdK3BV2Mq1Qq5Y5XEXcetr8icfWFKkXrXPxw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'คอมแพค พาวเดอร์',
    ),
    RecommendGoodsModel(
      id: '33',
      image:
          'https://s3-alpha-sig.figma.com/img/25b4/a6a3/3534ecc797a82bba2a7bc30315dc5dca?Expires=1676851200&Signature=hP5awaFDxeO0iGQkyMmkbVsitg7mGXNbHvfN06z7AmaiDNQ8ArwxmgvKJfAyDHIjniqmO~j2p-NnI0uRg06tHw5GjiWz11AQwff9rGFzkUiCXRarzUrU3HOzR45op9cTLgRWcG0-mOGDmThwM4jG58KjUKHHGGviTEk2Ow6UCX3cTJ~Xm8MClgIw~e1ufG5~LV9WwfFgvXUVNUyrFnIadWu3PF~0B~VzZGw0PBJXeUvbI3Ts7BwrbQV3PGrOElGmXYneMs64fNqnxKkmt8i8riXplNzF2pgZ9ZjGkUgdz1cjf4v9KpEdK3BV2Mq1Qq5Y5XEXcetr8icfWFKkXrXPxw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'บูสเตอร์ มาส์ก',
    ),
    RecommendGoodsModel(
      id: '34',
      image:
          'https://s3-alpha-sig.figma.com/img/25b4/a6a3/3534ecc797a82bba2a7bc30315dc5dca?Expires=1676851200&Signature=hP5awaFDxeO0iGQkyMmkbVsitg7mGXNbHvfN06z7AmaiDNQ8ArwxmgvKJfAyDHIjniqmO~j2p-NnI0uRg06tHw5GjiWz11AQwff9rGFzkUiCXRarzUrU3HOzR45op9cTLgRWcG0-mOGDmThwM4jG58KjUKHHGGviTEk2Ow6UCX3cTJ~Xm8MClgIw~e1ufG5~LV9WwfFgvXUVNUyrFnIadWu3PF~0B~VzZGw0PBJXeUvbI3Ts7BwrbQV3PGrOElGmXYneMs64fNqnxKkmt8i8riXplNzF2pgZ9ZjGkUgdz1cjf4v9KpEdK3BV2Mq1Qq5Y5XEXcetr8icfWFKkXrXPxw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'นาโน ไวท์เทนนิ่ง โซฟ จีพีโฟร์จี',
    ),
    RecommendGoodsModel(
      id: '35',
      image:
          'https://s3-alpha-sig.figma.com/img/25b4/a6a3/3534ecc797a82bba2a7bc30315dc5dca?Expires=1676851200&Signature=hP5awaFDxeO0iGQkyMmkbVsitg7mGXNbHvfN06z7AmaiDNQ8ArwxmgvKJfAyDHIjniqmO~j2p-NnI0uRg06tHw5GjiWz11AQwff9rGFzkUiCXRarzUrU3HOzR45op9cTLgRWcG0-mOGDmThwM4jG58KjUKHHGGviTEk2Ow6UCX3cTJ~Xm8MClgIw~e1ufG5~LV9WwfFgvXUVNUyrFnIadWu3PF~0B~VzZGw0PBJXeUvbI3Ts7BwrbQV3PGrOElGmXYneMs64fNqnxKkmt8i8riXplNzF2pgZ9ZjGkUgdz1cjf4v9KpEdK3BV2Mq1Qq5Y5XEXcetr8icfWFKkXrXPxw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'คอมแพค พาวเดอร์',
    ),
    RecommendGoodsModel(
      id: '36',
      image:
          'https://s3-alpha-sig.figma.com/img/25b4/a6a3/3534ecc797a82bba2a7bc30315dc5dca?Expires=1676851200&Signature=hP5awaFDxeO0iGQkyMmkbVsitg7mGXNbHvfN06z7AmaiDNQ8ArwxmgvKJfAyDHIjniqmO~j2p-NnI0uRg06tHw5GjiWz11AQwff9rGFzkUiCXRarzUrU3HOzR45op9cTLgRWcG0-mOGDmThwM4jG58KjUKHHGGviTEk2Ow6UCX3cTJ~Xm8MClgIw~e1ufG5~LV9WwfFgvXUVNUyrFnIadWu3PF~0B~VzZGw0PBJXeUvbI3Ts7BwrbQV3PGrOElGmXYneMs64fNqnxKkmt8i8riXplNzF2pgZ9ZjGkUgdz1cjf4v9KpEdK3BV2Mq1Qq5Y5XEXcetr8icfWFKkXrXPxw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'บูสเตอร์ มาส์ก',
    ),
    RecommendGoodsModel(
      id: '37',
      image:
          'https://s3-alpha-sig.figma.com/img/25b4/a6a3/3534ecc797a82bba2a7bc30315dc5dca?Expires=1676851200&Signature=hP5awaFDxeO0iGQkyMmkbVsitg7mGXNbHvfN06z7AmaiDNQ8ArwxmgvKJfAyDHIjniqmO~j2p-NnI0uRg06tHw5GjiWz11AQwff9rGFzkUiCXRarzUrU3HOzR45op9cTLgRWcG0-mOGDmThwM4jG58KjUKHHGGviTEk2Ow6UCX3cTJ~Xm8MClgIw~e1ufG5~LV9WwfFgvXUVNUyrFnIadWu3PF~0B~VzZGw0PBJXeUvbI3Ts7BwrbQV3PGrOElGmXYneMs64fNqnxKkmt8i8riXplNzF2pgZ9ZjGkUgdz1cjf4v9KpEdK3BV2Mq1Qq5Y5XEXcetr8icfWFKkXrXPxw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'นาโน ไวท์เทนนิ่ง โซฟ จีพีโฟร์จี',
    ),
    RecommendGoodsModel(
      id: '38',
      image:
          'https://s3-alpha-sig.figma.com/img/25b4/a6a3/3534ecc797a82bba2a7bc30315dc5dca?Expires=1676851200&Signature=hP5awaFDxeO0iGQkyMmkbVsitg7mGXNbHvfN06z7AmaiDNQ8ArwxmgvKJfAyDHIjniqmO~j2p-NnI0uRg06tHw5GjiWz11AQwff9rGFzkUiCXRarzUrU3HOzR45op9cTLgRWcG0-mOGDmThwM4jG58KjUKHHGGviTEk2Ow6UCX3cTJ~Xm8MClgIw~e1ufG5~LV9WwfFgvXUVNUyrFnIadWu3PF~0B~VzZGw0PBJXeUvbI3Ts7BwrbQV3PGrOElGmXYneMs64fNqnxKkmt8i8riXplNzF2pgZ9ZjGkUgdz1cjf4v9KpEdK3BV2Mq1Qq5Y5XEXcetr8icfWFKkXrXPxw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'คอมแพค พาวเดอร์',
    ),
    RecommendGoodsModel(
      id: '39',
      image:
          'https://s3-alpha-sig.figma.com/img/25b4/a6a3/3534ecc797a82bba2a7bc30315dc5dca?Expires=1676851200&Signature=hP5awaFDxeO0iGQkyMmkbVsitg7mGXNbHvfN06z7AmaiDNQ8ArwxmgvKJfAyDHIjniqmO~j2p-NnI0uRg06tHw5GjiWz11AQwff9rGFzkUiCXRarzUrU3HOzR45op9cTLgRWcG0-mOGDmThwM4jG58KjUKHHGGviTEk2Ow6UCX3cTJ~Xm8MClgIw~e1ufG5~LV9WwfFgvXUVNUyrFnIadWu3PF~0B~VzZGw0PBJXeUvbI3Ts7BwrbQV3PGrOElGmXYneMs64fNqnxKkmt8i8riXplNzF2pgZ9ZjGkUgdz1cjf4v9KpEdK3BV2Mq1Qq5Y5XEXcetr8icfWFKkXrXPxw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'บูสเตอร์ มาส์ก',
    ),
    RecommendGoodsModel(
      id: '40',
      image:
          'https://s3-alpha-sig.figma.com/img/25b4/a6a3/3534ecc797a82bba2a7bc30315dc5dca?Expires=1676851200&Signature=hP5awaFDxeO0iGQkyMmkbVsitg7mGXNbHvfN06z7AmaiDNQ8ArwxmgvKJfAyDHIjniqmO~j2p-NnI0uRg06tHw5GjiWz11AQwff9rGFzkUiCXRarzUrU3HOzR45op9cTLgRWcG0-mOGDmThwM4jG58KjUKHHGGviTEk2Ow6UCX3cTJ~Xm8MClgIw~e1ufG5~LV9WwfFgvXUVNUyrFnIadWu3PF~0B~VzZGw0PBJXeUvbI3Ts7BwrbQV3PGrOElGmXYneMs64fNqnxKkmt8i8riXplNzF2pgZ9ZjGkUgdz1cjf4v9KpEdK3BV2Mq1Qq5Y5XEXcetr8icfWFKkXrXPxw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'นาโน ไวท์เทนนิ่ง โซฟ จีพีโฟร์จี',
    ),
    RecommendGoodsModel(
      id: '41',
      image:
          'https://s3-alpha-sig.figma.com/img/25b4/a6a3/3534ecc797a82bba2a7bc30315dc5dca?Expires=1676851200&Signature=hP5awaFDxeO0iGQkyMmkbVsitg7mGXNbHvfN06z7AmaiDNQ8ArwxmgvKJfAyDHIjniqmO~j2p-NnI0uRg06tHw5GjiWz11AQwff9rGFzkUiCXRarzUrU3HOzR45op9cTLgRWcG0-mOGDmThwM4jG58KjUKHHGGviTEk2Ow6UCX3cTJ~Xm8MClgIw~e1ufG5~LV9WwfFgvXUVNUyrFnIadWu3PF~0B~VzZGw0PBJXeUvbI3Ts7BwrbQV3PGrOElGmXYneMs64fNqnxKkmt8i8riXplNzF2pgZ9ZjGkUgdz1cjf4v9KpEdK3BV2Mq1Qq5Y5XEXcetr8icfWFKkXrXPxw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'คอมแพค พาวเดอร์',
    ),
    RecommendGoodsModel(
      id: '42',
      image:
          'https://s3-alpha-sig.figma.com/img/25b4/a6a3/3534ecc797a82bba2a7bc30315dc5dca?Expires=1676851200&Signature=hP5awaFDxeO0iGQkyMmkbVsitg7mGXNbHvfN06z7AmaiDNQ8ArwxmgvKJfAyDHIjniqmO~j2p-NnI0uRg06tHw5GjiWz11AQwff9rGFzkUiCXRarzUrU3HOzR45op9cTLgRWcG0-mOGDmThwM4jG58KjUKHHGGviTEk2Ow6UCX3cTJ~Xm8MClgIw~e1ufG5~LV9WwfFgvXUVNUyrFnIadWu3PF~0B~VzZGw0PBJXeUvbI3Ts7BwrbQV3PGrOElGmXYneMs64fNqnxKkmt8i8riXplNzF2pgZ9ZjGkUgdz1cjf4v9KpEdK3BV2Mq1Qq5Y5XEXcetr8icfWFKkXrXPxw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'บูสเตอร์ มาส์ก',
    ),
    RecommendGoodsModel(
      id: '43',
      image:
          'https://s3-alpha-sig.figma.com/img/25b4/a6a3/3534ecc797a82bba2a7bc30315dc5dca?Expires=1676851200&Signature=hP5awaFDxeO0iGQkyMmkbVsitg7mGXNbHvfN06z7AmaiDNQ8ArwxmgvKJfAyDHIjniqmO~j2p-NnI0uRg06tHw5GjiWz11AQwff9rGFzkUiCXRarzUrU3HOzR45op9cTLgRWcG0-mOGDmThwM4jG58KjUKHHGGviTEk2Ow6UCX3cTJ~Xm8MClgIw~e1ufG5~LV9WwfFgvXUVNUyrFnIadWu3PF~0B~VzZGw0PBJXeUvbI3Ts7BwrbQV3PGrOElGmXYneMs64fNqnxKkmt8i8riXplNzF2pgZ9ZjGkUgdz1cjf4v9KpEdK3BV2Mq1Qq5Y5XEXcetr8icfWFKkXrXPxw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'นาโน ไวท์เทนนิ่ง โซฟ จีพีโฟร์จี',
    ),
    RecommendGoodsModel(
      id: '44',
      image:
          'https://s3-alpha-sig.figma.com/img/25b4/a6a3/3534ecc797a82bba2a7bc30315dc5dca?Expires=1676851200&Signature=hP5awaFDxeO0iGQkyMmkbVsitg7mGXNbHvfN06z7AmaiDNQ8ArwxmgvKJfAyDHIjniqmO~j2p-NnI0uRg06tHw5GjiWz11AQwff9rGFzkUiCXRarzUrU3HOzR45op9cTLgRWcG0-mOGDmThwM4jG58KjUKHHGGviTEk2Ow6UCX3cTJ~Xm8MClgIw~e1ufG5~LV9WwfFgvXUVNUyrFnIadWu3PF~0B~VzZGw0PBJXeUvbI3Ts7BwrbQV3PGrOElGmXYneMs64fNqnxKkmt8i8riXplNzF2pgZ9ZjGkUgdz1cjf4v9KpEdK3BV2Mq1Qq5Y5XEXcetr8icfWFKkXrXPxw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'คอมแพค พาวเดอร์',
    ),
    RecommendGoodsModel(
      id: '45',
      image:
          'https://s3-alpha-sig.figma.com/img/25b4/a6a3/3534ecc797a82bba2a7bc30315dc5dca?Expires=1676851200&Signature=hP5awaFDxeO0iGQkyMmkbVsitg7mGXNbHvfN06z7AmaiDNQ8ArwxmgvKJfAyDHIjniqmO~j2p-NnI0uRg06tHw5GjiWz11AQwff9rGFzkUiCXRarzUrU3HOzR45op9cTLgRWcG0-mOGDmThwM4jG58KjUKHHGGviTEk2Ow6UCX3cTJ~Xm8MClgIw~e1ufG5~LV9WwfFgvXUVNUyrFnIadWu3PF~0B~VzZGw0PBJXeUvbI3Ts7BwrbQV3PGrOElGmXYneMs64fNqnxKkmt8i8riXplNzF2pgZ9ZjGkUgdz1cjf4v9KpEdK3BV2Mq1Qq5Y5XEXcetr8icfWFKkXrXPxw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'บูสเตอร์ มาส์ก',
    ),
    RecommendGoodsModel(
      id: '46',
      image:
          'https://s3-alpha-sig.figma.com/img/25b4/a6a3/3534ecc797a82bba2a7bc30315dc5dca?Expires=1676851200&Signature=hP5awaFDxeO0iGQkyMmkbVsitg7mGXNbHvfN06z7AmaiDNQ8ArwxmgvKJfAyDHIjniqmO~j2p-NnI0uRg06tHw5GjiWz11AQwff9rGFzkUiCXRarzUrU3HOzR45op9cTLgRWcG0-mOGDmThwM4jG58KjUKHHGGviTEk2Ow6UCX3cTJ~Xm8MClgIw~e1ufG5~LV9WwfFgvXUVNUyrFnIadWu3PF~0B~VzZGw0PBJXeUvbI3Ts7BwrbQV3PGrOElGmXYneMs64fNqnxKkmt8i8riXplNzF2pgZ9ZjGkUgdz1cjf4v9KpEdK3BV2Mq1Qq5Y5XEXcetr8icfWFKkXrXPxw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'นาโน ไวท์เทนนิ่ง โซฟ จีพีโฟร์จี',
    ),
    RecommendGoodsModel(
      id: '47',
      image:
          'https://s3-alpha-sig.figma.com/img/25b4/a6a3/3534ecc797a82bba2a7bc30315dc5dca?Expires=1676851200&Signature=hP5awaFDxeO0iGQkyMmkbVsitg7mGXNbHvfN06z7AmaiDNQ8ArwxmgvKJfAyDHIjniqmO~j2p-NnI0uRg06tHw5GjiWz11AQwff9rGFzkUiCXRarzUrU3HOzR45op9cTLgRWcG0-mOGDmThwM4jG58KjUKHHGGviTEk2Ow6UCX3cTJ~Xm8MClgIw~e1ufG5~LV9WwfFgvXUVNUyrFnIadWu3PF~0B~VzZGw0PBJXeUvbI3Ts7BwrbQV3PGrOElGmXYneMs64fNqnxKkmt8i8riXplNzF2pgZ9ZjGkUgdz1cjf4v9KpEdK3BV2Mq1Qq5Y5XEXcetr8icfWFKkXrXPxw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'คอมแพค พาวเดอร์',
    ),
    RecommendGoodsModel(
      id: '48',
      image:
          'https://s3-alpha-sig.figma.com/img/25b4/a6a3/3534ecc797a82bba2a7bc30315dc5dca?Expires=1676851200&Signature=hP5awaFDxeO0iGQkyMmkbVsitg7mGXNbHvfN06z7AmaiDNQ8ArwxmgvKJfAyDHIjniqmO~j2p-NnI0uRg06tHw5GjiWz11AQwff9rGFzkUiCXRarzUrU3HOzR45op9cTLgRWcG0-mOGDmThwM4jG58KjUKHHGGviTEk2Ow6UCX3cTJ~Xm8MClgIw~e1ufG5~LV9WwfFgvXUVNUyrFnIadWu3PF~0B~VzZGw0PBJXeUvbI3Ts7BwrbQV3PGrOElGmXYneMs64fNqnxKkmt8i8riXplNzF2pgZ9ZjGkUgdz1cjf4v9KpEdK3BV2Mq1Qq5Y5XEXcetr8icfWFKkXrXPxw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'บูสเตอร์ มาส์ก',
    ),
    RecommendGoodsModel(
      id: '49',
      image:
          'https://s3-alpha-sig.figma.com/img/25b4/a6a3/3534ecc797a82bba2a7bc30315dc5dca?Expires=1676851200&Signature=hP5awaFDxeO0iGQkyMmkbVsitg7mGXNbHvfN06z7AmaiDNQ8ArwxmgvKJfAyDHIjniqmO~j2p-NnI0uRg06tHw5GjiWz11AQwff9rGFzkUiCXRarzUrU3HOzR45op9cTLgRWcG0-mOGDmThwM4jG58KjUKHHGGviTEk2Ow6UCX3cTJ~Xm8MClgIw~e1ufG5~LV9WwfFgvXUVNUyrFnIadWu3PF~0B~VzZGw0PBJXeUvbI3Ts7BwrbQV3PGrOElGmXYneMs64fNqnxKkmt8i8riXplNzF2pgZ9ZjGkUgdz1cjf4v9KpEdK3BV2Mq1Qq5Y5XEXcetr8icfWFKkXrXPxw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'คอมแพค พาวเดอร์',
    ),
    RecommendGoodsModel(
      id: '50',
      image:
          'https://s3-alpha-sig.figma.com/img/25b4/a6a3/3534ecc797a82bba2a7bc30315dc5dca?Expires=1676851200&Signature=hP5awaFDxeO0iGQkyMmkbVsitg7mGXNbHvfN06z7AmaiDNQ8ArwxmgvKJfAyDHIjniqmO~j2p-NnI0uRg06tHw5GjiWz11AQwff9rGFzkUiCXRarzUrU3HOzR45op9cTLgRWcG0-mOGDmThwM4jG58KjUKHHGGviTEk2Ow6UCX3cTJ~Xm8MClgIw~e1ufG5~LV9WwfFgvXUVNUyrFnIadWu3PF~0B~VzZGw0PBJXeUvbI3Ts7BwrbQV3PGrOElGmXYneMs64fNqnxKkmt8i8riXplNzF2pgZ9ZjGkUgdz1cjf4v9KpEdK3BV2Mq1Qq5Y5XEXcetr8icfWFKkXrXPxw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'บูสเตอร์ มาส์ก',
    ),
  ];

  // Getter

  List<PromotionModel> get promotionList => _promotionList;
  List<BestSellGoodsModel> get bestSellGoodsList => _bestSellGoodsList;
  List<RecommendGoodsModel> get recommendGoodsList => _recommendGoodsList;

  void pressProduct() {
    Get.toNamed(AppRoutes.PRODUCTDETAIL);
  }

  void pressPromotion() {
    Get.toNamed(AppRoutes.PROMOTIONDETAIL);
  }
}
