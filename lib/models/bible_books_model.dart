import 'package:gloryai/services/app_images.dart';

class BibleBooksModel {
  String name;
  String imgUrl;
  BibleBooksModel({required this.imgUrl, required this.name});
}

class MentalStateModel {
  String name;
  String imgUrl;
  MentalStateModel({required this.imgUrl, required this.name});
}

List<BibleBooksModel> mentalStates = [
  BibleBooksModel(imgUrl: AppImages.regularFaceIcon, name: 'Regular'),
  BibleBooksModel(imgUrl: AppImages.smileIcon, name: 'Devoted'),
  BibleBooksModel(imgUrl: AppImages.unconvincedFaceIcon, name: 'Unconvinced'),
  BibleBooksModel(imgUrl: AppImages.excitedFaceIcon, name: 'Excited'),
  BibleBooksModel(imgUrl: AppImages.dissapointedFaceIcon, name: 'Dissapointed'),
  BibleBooksModel(imgUrl: AppImages.amazedFaceIcon, name: 'Amazed'),
  BibleBooksModel(imgUrl: AppImages.inactiveFaceIcon, name: 'Inactive'),
  BibleBooksModel(imgUrl: AppImages.dissatisfiedFaceIcon, name: 'Dissatisfied'),
  BibleBooksModel(imgUrl: AppImages.angryFaceIcon, name: 'Angry'),
];

List<BibleBooksModel> bibleBooks = [
  BibleBooksModel(imgUrl: AppImages.bibleIcon6Glory, name: 'Gospel of Thomas'),
  BibleBooksModel(imgUrl: AppImages.bibleIcon7Glory, name: 'Gospel of Mary'),
  BibleBooksModel(imgUrl: AppImages.bibleIcon8Glory, name: 'Gospel of Judas'),
  BibleBooksModel(
    imgUrl: AppImages.bibleIcon2Glory,
    name: 'Infancy Gospel of James',
  ),
  BibleBooksModel(
    imgUrl: AppImages.bibleIcon1Glory,
    name: 'New International Version (NIV)',
  ),
  BibleBooksModel(
    imgUrl: AppImages.bibleIcon9Glory,
    name: 'New American Standard Bible (NASB)',
  ),
  BibleBooksModel(
    imgUrl: AppImages.bibleIcon3Glory,
    name: 'English Standard Version (ESV)',
  ),
  BibleBooksModel(
    imgUrl: AppImages.bibleIcon4Glory,
    name: 'King James Version (KJV)',
  ),
  BibleBooksModel(
    imgUrl: AppImages.bibleIcon5Glory,
    name: 'New Living Translation (NLT)',
  ),
];
