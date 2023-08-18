import 'package:mavental/src/network/model/common/result.dart';
import 'package:mavental/src/network/blob/model/upload_model.dart';

abstract class UploadRepository {
  Future<MResult<MUpload?>> uploadImage(String path);
  Future<MResult<MUpload?>> uploadVideo(String path);
  Future<List<MResult<MUpload>>> uploadVideos(List<String> paths);
  Future<List<MResult<MUpload>>> uploadImages(List<String> paths);
}
