import 'package:health_care/core/utils/constants.dart';
import 'package:health_care/core/utils/extension.dart';
import 'package:health_care/doctor/data/response/time_block_response.dart';
import 'package:health_care/doctor/domain/model/time_block_model.dart';

extension TimeBlockResponseMapper on TimeBlockResponse? {
  TimeBlock toDomain() {
    return TimeBlock(
      this?.period?.orZero() ?? Constants.zero,
      this?.startTime?.orEmpty() ?? Constants.empty,
      this?.type?.orEmpty() ?? Constants.empty,
      this?.timeBlockId?.orEmpty() ?? Constants.empty,
      this?.doctorId?.orEmpty() ?? Constants.empty,
      this?.v?.orZero() ?? Constants.zero,
    );
  }
}
