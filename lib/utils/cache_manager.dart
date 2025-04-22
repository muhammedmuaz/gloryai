import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class NoCacheManager extends CacheManager {
  static const key = 'noCache';

  NoCacheManager()
      : super(Config(
          key,
          stalePeriod: const Duration(seconds: 0), // No caching duration
          maxNrOfCacheObjects: 0, // No objects will be cached
          repo: JsonCacheInfoRepository(databaseName: key),
          fileSystem: IOFileSystem(key),
          fileService: HttpFileService(),
        ));
}
