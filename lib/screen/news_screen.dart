import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive/hive.dart';
import 'package:iconsax/iconsax.dart';
import 'package:monews/constants/constants.dart';
import 'package:monews/models/news.dart';

class NewsScreen extends StatefulWidget {
  News news;
  NewsScreen(this.news, {super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  late News news;
  bool _isMarked = false;

  @override
  void initState() {
    super.initState();
    this.news = widget.news;
    _checkIsNewsMarked();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              _getAppBar(context),
            ];
          },
          body: _getContent(),
        ),
      ),
    );
  }

  Widget _getContent() {
    return Column(
      children: [
        SizedBox(
          height: 6,
        ),
        _getNewsDetail(),
        SizedBox(
          height: 14,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 14),
          child: Column(
            children: [
              Text(
                widget.news.title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Wrap(
                children: [
                  _getCategoryList(),
                ],
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                widget.news.text,
                style: TextStyle(
                  fontSize: 12,
                  height: 1.8,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                " طـارمـی در لـیـگ قـهـرمـانـان دو فــصـل پــیــش اروپـا و در دیـدار مـقـابـلچلسی عملکرد بی نظیری داشت و با یک گل قیچی برگردان، پورتو رابه پیروزی رساند. هرچند که نماینده پرتـغال به خاطر مجموع نـتـایـج بازی رفت و برگشت حـذف شد. با ایـن حـال گـل طـارمـی حتـی تـا یک قـدمی انـتخـاب بهـترین گـل سـال فیـفا و دریـافـت جـایزه «پوشکاش» هم پیش رفت.بحث پیشنهاد باشگاه چلسـی انـگـلیس به پـورتـو بـرای جـذب مـهدی طــارمـی در آخـریــن ســاعــات نــقـل و انـتـقـالـات فــوتـبـال اروپـا یــکـی از سوژه‌های اصلی هواداران دو تیم بود. این خبر در حالی رسانه‌ای شد که گفته می‌شد چلسی برای جذب طارمی مبلغ ۲۵ میلیون یورو را به پورتو پیشنهاد داده است. روزنـامه «ابولا» پرتغال هم روز چهارشنـبـه ایــن خـبر را اعلـام کرد و به دنبال آن بعضی از مطبوعات انگلیس و کشورهای دیگر هم پیشنهاد چلسی به طارمی را دنبال کردند.",
                style: TextStyle(
                  fontSize: 12,
                  height: 1.8,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _getCategoryList() {
    return Container(
      height: 32,
      child: Center(
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: widget.news.tags.length,
          itemBuilder: (context, index) {
            return _getCategoryItem(index);
          },
        ),
      ),
    );
  }

  Widget _getCategoryItem(int index) {
    List<String> itemList = ["ورزشی", "لژیونر ها", "فوتبال اروپا"];
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 14),
      margin: EdgeInsets.symmetric(horizontal: 6),
      decoration: BoxDecoration(
        color: primaryLightColor,
        borderRadius: BorderRadius.circular(28),
      ),
      child: Text(
        itemList[index],
        style: TextStyle(
          fontSize: 12,
          color: primaryColor,
        ),
      ),
    );
  }

  Widget _getNewsDetail() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Row(
          children: [
            Icon(
              Iconsax.flash_circle5,
              color: primaryColor,
              size: 18,
            ),
            SizedBox(
              width: 4,
            ),
            Text(
              "پیشنهاد مونیوز",
              style: TextStyle(
                fontSize: 12,
                color: greyColor,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Image(
              image: AssetImage("images/${widget.news.agency.image_url}"),
              width: 18,
            ),
            SizedBox(
              width: 4,
            ),
            Text(
              "خبرگزاری ${widget.news.agency.name}",
              style: TextStyle(
                fontSize: 12,
              ),
            ),
          ],
        ),
        Text(
          widget.news.date,
          style: TextStyle(
            fontSize: 12,
            color: greyColor,
          ),
        ),
      ],
    );
  }

  Widget _getAppBar(BuildContext context) {
    return SliverAppBar(
      backgroundColor: whiteColor,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: SvgPicture.asset(
              "assets/icons/arrow-right.svg",
              color: whiteColor,
            ),
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  _storeNews();
                },
                child: SvgPicture.asset(
                  _isMarked
                      ? "assets/icons/frame-fill.svg"
                      : "assets/icons/frame.svg",
                  color: whiteColor,
                ),
              ),
              SizedBox(
                width: 28,
              ),
              SvgPicture.asset(
                "assets/icons/menu.svg",
                color: whiteColor,
              ),
              SizedBox(
                width: 8,
              ),
            ],
          ),
        ],
      ),
      centerTitle: true,
      automaticallyImplyLeading: false,
      expandedHeight: 284,
      flexibleSpace: FlexibleSpaceBar(
        background: Image.asset(
          "images/${widget.news.image_url}",
          fit: BoxFit.cover,
        ),
      ),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(24),
        child: Container(
          height: 24,
          width: double.infinity,
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(28),
              topRight: Radius.circular(28),
            ),
          ),
          child: Center(
            child: Container(
              height: 6,
              width: 48,
              decoration: BoxDecoration(
                color: greyColor,
                borderRadius: BorderRadius.circular(98),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _storeNews() {
    var marked_news = Hive.box<News>("marked_news");

    if (!_isMarked) {
      marked_news.put(news.id, news);
    } else {
      marked_news.delete(news.id);
    }

    setState(() {
      _isMarked = !_isMarked;
    });
  }

  void _checkIsNewsMarked() {
    var marked_news = Hive.box<News>("marked_news");
    var this_news = marked_news.get(news.id);
    if (this_news != null) {
      setState(() {
        _isMarked = true;
      });
    }
  }
}
