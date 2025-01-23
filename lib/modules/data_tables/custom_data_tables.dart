import 'package:flutter/material.dart';

import '../../AppColors.dart';
import '../../mixins & constants/constants.dart';
import '../common_widgets/scrollable_widget.dart';
import '../theme_data/custom_themes.dart';

class CustomDataTable extends StatelessWidget {
  final List<DataColumn> columns;
  final List<DataRow> rows;
  final Function(bool?)? onSelectAll;
  final double? dividerThickness;

  const CustomDataTable({
    Key? key,
    required this.columns,
    required this.rows,
    this.onSelectAll,
    this.dividerThickness = 0.2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomThemes.checkboxTheme(
      child: ScrollableWidget(
          child: DataTable(
              dividerThickness: dividerThickness,
              onSelectAll: onSelectAll,
              columns: columns,
              headingRowColor: kDataColumnColor,
              dataRowColor: kDataRowColor,
              rows: rows,
          )),
    );
  }
}


/// Data column text style
TextStyle dataColumnTextStyle() => TextStyle(fontSize: 12,fontWeight: FontWeight.w700,color: AppColors.mistyGray);
TextStyle dataRowTextStyle() => TextStyle(fontSize: 12,fontWeight: FontWeight.w700,color: AppColors.slateGrayBlue);
