import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:get/get.dart';
import 'package:quran/generated/l10n.dart';

import '../controllers/info_controller.dart';

class InfoView extends GetView<InfoController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).information),
      ),
      body: SingleChildScrollView(
        child: HtmlWidget('''
     <p dir="rtl" align="center"><span style="font-family: 'Arial Unicode MS';"><span lang="hi-IN"><u><span style="font-family: 'Traditional Arabic';"><span style="font-size: medium;"><strong>مسجد الجوزاء &ndash; لؤلؤة كورنيش الخبر</strong></span></span></u></span></span></p>
<p dir="rtl" align="right">&nbsp;</p>
<p dir="rtl" align="right"><span style="font-family: 'Arial Unicode MS';"><span lang="hi-IN"><span style="color: #7030a0;"><u><span style="font-family: 'Traditional Arabic';"><span style="font-size: large;"><strong>تمهيد </strong></span></span></u></span></span></span></p>
<p dir="rtl" align="right"><span style="font-family: 'Arial Unicode MS';"><span lang="hi-IN"><span style="font-family: 'Traditional Arabic';"><span style="font-size: medium;">أفتتح المسجد في رمضان عام </span></span></span></span><span style="font-family: 'Traditional Arabic', serif;"><span style="font-size: medium;">1440</span></span><span style="font-family: 'Arial Unicode MS';"><span lang="hi-IN"><span style="font-family: 'Traditional Arabic';"><span style="font-size: medium;">هـ الموافق </span></span></span></span><span style="font-family: 'Traditional Arabic', serif;"><span style="font-size: medium;">2018</span></span><span style="font-family: 'Arial Unicode MS';"><span lang="hi-IN"><span style="font-family: 'Traditional Arabic';"><span style="font-size: medium;">م حيث ببني على نفقة الشيخ عايض بن فرحان القحطاني وأسماه الجوزاء براً بوالدته جوزاء القحطاني رحمها الله</span></span></span></span><span style="font-family: 'Traditional Arabic', serif;"><span style="font-size: medium;">. </span></span></p>
<p dir="rtl" align="right"><span style="font-family: 'Arial Unicode MS';"><span lang="hi-IN"><span style="font-family: 'Traditional Arabic';"><span style="font-size: medium;">يقع المسجد على الكورنيش الشمالي بمدينة الخبر بالمنطقة الشرقية، ويتسع الى ما يقارب </span></span></span></span><span style="font-family: 'Traditional Arabic', serif;"><span style="font-size: medium;">450 </span></span><span style="font-family: 'Arial Unicode MS';"><span lang="hi-IN"><span style="font-family: 'Traditional Arabic';"><span style="font-size: medium;">مصلي ومصلية ويتميز بموقع استراتيجي وإطلالة على الخليج العربي ومرفد للمتنزهين وعابرين الطريق</span></span></span></span><span style="font-family: 'Traditional Arabic', serif;"><span style="font-size: medium;">.</span></span></p>
<p dir="rtl" align="right">&nbsp;</p>
<p dir="rtl" align="right"><span style="font-family: 'Arial Unicode MS';"><span lang="hi-IN"><span style="color: #7030a0;"><u><span style="font-family: 'Traditional Arabic';"><span style="font-size: large;"><strong>التصميم المعماري</strong></span></span></u></span></span></span><span style="font-family: 'Traditional Arabic', serif;"><span style="font-size: large;"><strong>:</strong></span></span></p>
<p dir="rtl" align="right"><span style="font-family: 'Arial Unicode MS';"><span lang="hi-IN"><span style="font-family: 'Traditional Arabic';"><span style="font-size: medium;">استُلهم التصميم المعماري من عمارة المساجد الاموية و يتميز بلونه الابيض النقي ، محاطا بشريط من حجر البازلت الطبيعي فأطلق عليه سكان المنطقة الشرقية لؤلؤة كورنيش الخبر</span></span></span></span><span style="font-family: 'Traditional Arabic', serif;"><span style="font-size: medium;">.</span></span></p>
<p dir="rtl" align="right">&nbsp;</p>
<p dir="rtl" align="right"><span style="font-family: 'Arial Unicode MS';"><span lang="hi-IN"><span style="color: #7030a0;"><u><span style="font-family: 'Traditional Arabic';"><span style="font-size: large;"><strong>المنارة والقباب</strong></span></span></u></span></span></span><span style="font-family: 'Traditional Arabic', serif;"><span style="font-size: large;"><strong>:</strong></span></span></p>
<p dir="rtl" align="right"><span style="font-family: 'Arial Unicode MS';"><span lang="hi-IN"><span style="font-family: 'Traditional Arabic';"><span style="font-size: medium;">يتوسط المسجد قبة رئيسية يصل أقصى ارتفاع لها الى </span></span></span></span><span style="font-family: 'Traditional Arabic', serif;"><span style="font-size: medium;">20 </span></span><span style="font-family: 'Arial Unicode MS';"><span lang="hi-IN"><span style="font-family: 'Traditional Arabic';"><span style="font-size: medium;">مترا من سطح الارض وبعرض يصل الى </span></span></span></span><span style="font-family: 'Traditional Arabic', serif;"><span style="font-size: medium;">12</span></span><span style="font-family: 'Arial Unicode MS';"><span lang="hi-IN"><span style="font-family: 'Traditional Arabic';"><span style="font-size: medium;">م ومحاطة ب</span></span></span></span><span style="font-family: 'Traditional Arabic', serif;"><span style="font-size: medium;">13 </span></span><span style="font-family: 'Arial Unicode MS';"><span lang="hi-IN"><span style="font-family: 'Traditional Arabic';"><span style="font-size: medium;">قبة موزعه على محيط القبة الرئيسة </span></span></span></span><span style="font-family: 'Traditional Arabic', serif;"><span style="font-size: medium;">. </span></span><span style="font-family: 'Arial Unicode MS';"><span lang="hi-IN"><span style="font-family: 'Traditional Arabic';"><span style="font-size: medium;">كما يصل ارتفاع المنارة الى </span></span></span></span><span style="font-family: 'Traditional Arabic', serif;"><span style="font-size: medium;">25</span></span><span style="font-family: 'Arial Unicode MS';"><span lang="hi-IN"><span style="font-family: 'Traditional Arabic';"><span style="font-size: medium;">مترا من سطح الارض مزخرفة بالمقرنصات وعناصر جمالية من العمارة الاسلامية</span></span></span></span></p>
<p dir="rtl" align="right">&nbsp;</p>
<p dir="rtl" align="right"><span style="font-family: 'Arial Unicode MS';"><span lang="hi-IN"><span style="color: #7030a0;"><u><span style="font-family: 'Traditional Arabic';"><span style="font-size: large;"><strong>النافورة</strong></span></span></u></span></span></span><span style="font-family: 'Traditional Arabic', serif;"><span style="font-size: large;"><strong>:</strong></span></span></p>
<p dir="rtl" align="right"><span style="font-family: 'Arial Unicode MS';"><span lang="hi-IN"><span style="font-family: 'Traditional Arabic';"><span style="font-size: medium;">تحيط النوافير بالمسجد من </span></span></span></span><span style="font-family: 'Traditional Arabic', serif;"><span style="font-size: medium;">3 </span></span><span style="font-family: 'Arial Unicode MS';"><span lang="hi-IN"><span style="font-family: 'Traditional Arabic';"><span style="font-size: medium;">جهات بمجمل </span></span></span></span><span style="font-family: 'Traditional Arabic', serif;"><span style="font-size: medium;">30 </span></span><span style="font-family: 'Arial Unicode MS';"><span lang="hi-IN"><span style="font-family: 'Traditional Arabic';"><span style="font-size: medium;">نافورة بالاضافة الى شلالات جداريه مزخرفه في الساحة الخارجية الخلفية عند المدخل الرئيس</span></span></span></span><span style="font-family: 'Traditional Arabic', serif;"><span style="font-size: medium;">.</span></span></p>
<p dir="rtl" align="right">&nbsp;</p>
<p dir="rtl" align="right"><span style="font-family: 'Arial Unicode MS';"><span lang="hi-IN"><span style="color: #7030a0;"><u><span style="font-family: 'Traditional Arabic';"><span style="font-size: large;"><strong>الزراعة</strong></span></span></u></span></span></span><span style="font-family: 'Traditional Arabic', serif;"><span style="font-size: large;"><strong>:</strong></span></span></p>
<p dir="rtl" align="right"><span style="font-family: 'Arial Unicode MS';"><span lang="hi-IN"><span style="font-family: 'Traditional Arabic';"><span style="font-size: medium;">يحيط المسجد عدد </span></span></span></span><span style="font-family: 'Traditional Arabic', serif;"><span style="font-size: medium;">42 </span></span><span style="font-family: 'Arial Unicode MS';"><span lang="hi-IN"><span style="font-family: 'Traditional Arabic';"><span style="font-size: medium;">من أشجار النخيل من نوع </span></span></span></span><span style="font-family: 'Traditional Arabic', serif;"><span style="font-size: medium;">( </span></span><span style="font-family: 'Arial Unicode MS';"><span lang="hi-IN"><span style="font-family: 'Traditional Arabic';"><span style="font-size: medium;">واشنطونيا</span></span></span></span><span style="font-family: 'Traditional Arabic', serif;"><span style="font-size: medium;">) </span></span><span style="font-family: 'Arial Unicode MS';"><span lang="hi-IN"><span style="font-family: 'Traditional Arabic';"><span style="font-size: medium;">من جميع الجهات وبإرتفاع يصل الى </span></span></span></span><span style="font-family: 'Traditional Arabic', serif;"><span style="font-size: medium;">20 </span></span><span style="font-family: 'Arial Unicode MS';"><span lang="hi-IN"><span style="font-family: 'Traditional Arabic';"><span style="font-size: medium;">مترا بالاضافة الىى شريط نباتي يسور المسجد بالاضافة الى مسطحات خضراء وورود ونباتات عطرية كالريحان والياسمين</span></span></span></span><span style="font-family: 'Traditional Arabic', serif;"><span style="font-size: medium;">.</span></span></p>
<p dir="rtl" align="right">&nbsp;</p>
<p dir="rtl" align="right"><span style="font-family: 'Arial Unicode MS';"><span lang="hi-IN"><span style="color: #7030a0;"><u><span style="font-family: 'Traditional Arabic';"><span style="font-size: large;"><strong>السجاد</strong></span></span></u></span></span></span><span style="font-family: 'Traditional Arabic', serif;"><span style="font-size: large;"><strong>:</strong></span></span></p>
<p dir="rtl" align="right"><span style="font-family: 'Arial Unicode MS';"><span lang="hi-IN"><span style="font-family: 'Traditional Arabic';"><span style="font-size: medium;">ييرجع اختيار لون السجاد الازرق الى لون البحر الذي يطل عليه المسجد واستلهمت خطوط صفوف المصلين من تجريد التصاميم الهندسية للحصير التقليدي ليندمج الحاضر بالماضي</span></span></span></span><span style="font-family: 'Traditional Arabic', serif;"><span style="font-size: medium;">.</span></span></p>
<p dir="rtl" align="right">&nbsp;</p>
<p dir="rtl" align="right"><span style="font-family: 'Arial Unicode MS';"><span lang="hi-IN"><span style="color: #7030a0;"><u><span style="font-family: 'Traditional Arabic';"><span style="font-size: large;"><strong>الصوتيات</strong></span></span></u></span></span></span><span style="font-family: 'Traditional Arabic', serif;"><span style="font-size: large;"><strong>:</strong></span></span></p>
<p dir="rtl" align="right"><span style="font-family: 'Arial Unicode MS';"><span lang="hi-IN"><span style="font-family: 'Traditional Arabic';"><span style="font-size: medium;">جهز المسجد بنظام صوتي رقمي وبمعالجات صوت وسماعات عالية التقنية موزعه داخل وخارج المسجد لضمان صفاوة ونقاء ووضوح الصوت ليتناسب مع المؤذن والامام والمصلي</span></span></span></span><span style="font-family: 'Traditional Arabic', serif;"><span style="font-size: medium;">. </span></span></p>
<p dir="rtl" align="right"><span style="font-family: 'Arial Unicode MS';"><span lang="hi-IN"><span style="color: #7030a0;"><u><span style="font-family: 'Traditional Arabic';"><span style="font-size: large;"><strong>النوافذ</strong></span></span></u></span></span></span><span style="font-family: 'Traditional Arabic', serif;"><span style="font-size: large;"><strong>:</strong></span></span></p>
<p dir="rtl" align="right"><span style="font-family: 'Arial Unicode MS';"><span lang="hi-IN"><span style="font-family: 'Traditional Arabic';"><span style="font-size: medium;">تساعد النوافذ الكبيرة المحاطة بالمسجد من جميع الجهات بالاضافة الى النوافذ بالقبة الرئيسية الى توفير الاضائة والتهوية الطبيعية للمسجد كما تحتوي على الزخارف التي ترسم بظلالها خلال فترات النهار تبعا لحركة الشمس</span></span></span></span><span style="font-family: 'Traditional Arabic', serif;"><span style="font-size: medium;">.</span></span></p>
<p dir="rtl" align="right">&nbsp;</p>
<p dir="rtl" align="right"><span style="font-family: 'Arial Unicode MS';"><span lang="hi-IN"><span style="color: #7030a0;"><u><span style="font-family: 'Traditional Arabic';"><span style="font-size: large;"><strong>الانارة</strong></span></span></u></span></span></span><span style="font-family: 'Traditional Arabic', serif;"><span style="font-size: large;"><strong>:</strong></span></span></p>
<p dir="rtl" align="right"><span style="font-family: 'Arial Unicode MS';"><span lang="hi-IN"><span style="font-family: 'Traditional Arabic';"><span style="font-size: medium;">يزين المسجد </span></span></span></span><span style="font-family: 'Traditional Arabic', serif;"><span style="font-size: medium;">22 </span></span><span style="font-family: 'Arial Unicode MS';"><span lang="hi-IN"><span style="font-family: 'Traditional Arabic';"><span style="font-size: medium;">ثرية صنعت من النحاس خصيصا للمسجد بأشكال واحجام مختلفة يتوسطها الثريا المركزية في وسط القبة الرئيسية و بأربع حلقات متالية تحتوي على قناديل زجاجية بزخارف اسلامية وأسماء محفورة </span></span></span></span><span style="font-family: 'Traditional Arabic', serif;"><span style="font-size: medium;">( </span></span><span style="font-family: 'Arial Unicode MS';"><span lang="hi-IN"><span style="font-family: 'Traditional Arabic';"><span style="font-size: medium;">الله &ndash; محمد</span></span></span></span><span style="font-family: 'Traditional Arabic', serif;"><span style="font-size: medium;">) </span></span><span style="font-family: 'Arial Unicode MS';"><span lang="hi-IN"><span style="font-family: 'Traditional Arabic';"><span style="font-size: medium;">بالاضافة الى شعلات إنارة في كل زاوية من المسجد</span></span></span></span><span style="font-family: 'Traditional Arabic', serif;"><span style="font-size: medium;">.</span></span></p>
<p dir="rtl" align="right"><span style="font-family: 'Arial Unicode MS';"><span lang="hi-IN"><span style="font-family: 'Traditional Arabic';"><span style="font-size: medium;">كما يحيط المسجد من الخارج إنارات ليلية مختلفة تضيء النافورة والقباب والأشجار مما يعطي روحا جمالية وألقاً للمسجد ليلاً</span></span></span></span><span style="font-family: 'Traditional Arabic', serif;"><span style="font-size: medium;">.</span></span></p>
      '''),
      ),
    );
  }
}
