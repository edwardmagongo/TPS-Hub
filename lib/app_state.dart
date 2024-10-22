import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      if (prefs.containsKey('ff_SecondSecorityLayerConfig')) {
        try {
          final serializedData =
              prefs.getString('ff_SecondSecorityLayerConfig') ?? '{}';
          _SecondSecorityLayerConfig =
              SecondSecurityLayerStruct.fromSerializableMap(
                  jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _SearchHistory =
          prefs.getStringList('ff_SearchHistory') ?? _SearchHistory;
    });
    _safeInit(() {
      if (prefs.containsKey('ff_NotificationConfiguration')) {
        try {
          final serializedData =
              prefs.getString('ff_NotificationConfiguration') ?? '{}';
          _NotificationConfiguration =
              NotificationConfiguresStruct.fromSerializableMap(
                  jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  List<String> _Categories = [
    'All',
    'Sports',
    'Adventure',
    'Academic',
    'Charity',
    'Student Council',
    'Anti-Bullying',
    'E-Safety',
    'Round Square',
    'Gender Relations',
    'Mental Health',
    'Contraband',
    'Prefects',
    'Faith Factor',
    'Sustainability',
    'Library'
  ];
  List<String> get Categories => _Categories;
  set Categories(List<String> value) {
    _Categories = value;
  }

  void addToCategories(String value) {
    Categories.add(value);
  }

  void removeFromCategories(String value) {
    Categories.remove(value);
  }

  void removeAtIndexFromCategories(int index) {
    Categories.removeAt(index);
  }

  void updateCategoriesAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    Categories[index] = updateFn(_Categories[index]);
  }

  void insertAtIndexInCategories(int index, String value) {
    Categories.insert(index, value);
  }

  bool _toggle = false;
  bool get toggle => _toggle;
  set toggle(bool value) {
    _toggle = value;
  }

  DefaultsStruct _defaults = DefaultsStruct.fromSerializableMap(jsonDecode(
      '{\"brandName\":\"TPS Hub\",\"brandTagline\":\"Digital information hub\",\"logo\":\"https://www.google.com/url?sa=i&url=https%3A%2F%2Fappadvice.com%2Fapp%2Fst-andrews-school-turi%2F1571307326&psig=AOvVaw1O66dzzIRn7vgwCdZZ_sX_&ust=1720776984362000&source=images&cd=vfe&opi=89978449&ved=0CBEQjRxqFwoTCJDkzfjXnocDFQAAAAAdAAAAABAh\",\"avatarDefaultImage\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/netron-e-com-mobile-6rhojr/assets/l260dcr57pr2/user-default.png\",\"imagesDefaultImage\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/netron-e-com-mobile-6rhojr/assets/a105n0zo09d5/images.png\"}'));
  DefaultsStruct get defaults => _defaults;
  set defaults(DefaultsStruct value) {
    _defaults = value;
  }

  void updateDefaultsStruct(Function(DefaultsStruct) updateFn) {
    updateFn(_defaults);
  }

  SecondSecurityLayerStruct _SecondSecorityLayerConfig =
      SecondSecurityLayerStruct.fromSerializableMap(
          jsonDecode('{\"enable\":\"true\"}'));
  SecondSecurityLayerStruct get SecondSecorityLayerConfig =>
      _SecondSecorityLayerConfig;
  set SecondSecorityLayerConfig(SecondSecurityLayerStruct value) {
    _SecondSecorityLayerConfig = value;
    prefs.setString('ff_SecondSecorityLayerConfig', value.serialize());
  }

  void updateSecondSecorityLayerConfigStruct(
      Function(SecondSecurityLayerStruct) updateFn) {
    updateFn(_SecondSecorityLayerConfig);
    prefs.setString(
        'ff_SecondSecorityLayerConfig', _SecondSecorityLayerConfig.serialize());
  }

  bool _secondSecurityMesureIsGuranteed = false;
  bool get secondSecurityMesureIsGuranteed => _secondSecurityMesureIsGuranteed;
  set secondSecurityMesureIsGuranteed(bool value) {
    _secondSecurityMesureIsGuranteed = value;
  }

  List<String> _SearchHistory = ['Student Council', 'Charity'];
  List<String> get SearchHistory => _SearchHistory;
  set SearchHistory(List<String> value) {
    _SearchHistory = value;
    prefs.setStringList('ff_SearchHistory', value);
  }

  void addToSearchHistory(String value) {
    SearchHistory.add(value);
    prefs.setStringList('ff_SearchHistory', _SearchHistory);
  }

  void removeFromSearchHistory(String value) {
    SearchHistory.remove(value);
    prefs.setStringList('ff_SearchHistory', _SearchHistory);
  }

  void removeAtIndexFromSearchHistory(int index) {
    SearchHistory.removeAt(index);
    prefs.setStringList('ff_SearchHistory', _SearchHistory);
  }

  void updateSearchHistoryAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    SearchHistory[index] = updateFn(_SearchHistory[index]);
    prefs.setStringList('ff_SearchHistory', _SearchHistory);
  }

  void insertAtIndexInSearchHistory(int index, String value) {
    SearchHistory.insert(index, value);
    prefs.setStringList('ff_SearchHistory', _SearchHistory);
  }

  String _HomePagePath = '';
  String get HomePagePath => _HomePagePath;
  set HomePagePath(String value) {
    _HomePagePath = value;
  }

  NotificationConfiguresStruct _NotificationConfiguration =
      NotificationConfiguresStruct.fromSerializableMap(jsonDecode(
          '{\"EnableNotification\":\"true\",\"Sound\":\"true\",\"Vibrate\":\"false\",\"SpecialOffers\":\"true\",\"PromoDiscount\":\"true\",\"Cashback\":\"true\",\"NewServices\":\"true\"}'));
  NotificationConfiguresStruct get NotificationConfiguration =>
      _NotificationConfiguration;
  set NotificationConfiguration(NotificationConfiguresStruct value) {
    _NotificationConfiguration = value;
    prefs.setString('ff_NotificationConfiguration', value.serialize());
  }

  void updateNotificationConfigurationStruct(
      Function(NotificationConfiguresStruct) updateFn) {
    updateFn(_NotificationConfiguration);
    prefs.setString(
        'ff_NotificationConfiguration', _NotificationConfiguration.serialize());
  }

  List<String> _Folders = [
    'Initiatives',
    'Presentations',
    'Members',
    'Weekly Minutes'
  ];
  List<String> get Folders => _Folders;
  set Folders(List<String> value) {
    _Folders = value;
  }

  void addToFolders(String value) {
    Folders.add(value);
  }

  void removeFromFolders(String value) {
    Folders.remove(value);
  }

  void removeAtIndexFromFolders(int index) {
    Folders.removeAt(index);
  }

  void updateFoldersAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    Folders[index] = updateFn(_Folders[index]);
  }

  void insertAtIndexInFolders(int index, String value) {
    Folders.insert(index, value);
  }

  final _allProductsManager = FutureRequestManager<List<ProductRecord>>();
  Future<List<ProductRecord>> allProducts({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<ProductRecord>> Function() requestFn,
  }) =>
      _allProductsManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearAllProductsCache() => _allProductsManager.clear();
  void clearAllProductsCacheKey(String? uniqueKey) =>
      _allProductsManager.clearRequest(uniqueKey);

  final _specialOfferSingleProductRefManager =
      FutureRequestManager<SpecialOfferRecord>();
  Future<SpecialOfferRecord> specialOfferSingleProductRef({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<SpecialOfferRecord> Function() requestFn,
  }) =>
      _specialOfferSingleProductRefManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearSpecialOfferSingleProductRefCache() =>
      _specialOfferSingleProductRefManager.clear();
  void clearSpecialOfferSingleProductRefCacheKey(String? uniqueKey) =>
      _specialOfferSingleProductRefManager.clearRequest(uniqueKey);

  final _productHasSpecialOfferManager =
      FutureRequestManager<List<SpecialOfferRecord>>();
  Future<List<SpecialOfferRecord>> productHasSpecialOffer({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<SpecialOfferRecord>> Function() requestFn,
  }) =>
      _productHasSpecialOfferManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearProductHasSpecialOfferCache() =>
      _productHasSpecialOfferManager.clear();
  void clearProductHasSpecialOfferCacheKey(String? uniqueKey) =>
      _productHasSpecialOfferManager.clearRequest(uniqueKey);

  final _specialOffersAllManager =
      FutureRequestManager<List<SpecialOfferRecord>>();
  Future<List<SpecialOfferRecord>> specialOffersAll({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<SpecialOfferRecord>> Function() requestFn,
  }) =>
      _specialOffersAllManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearSpecialOffersAllCache() => _specialOffersAllManager.clear();
  void clearSpecialOffersAllCacheKey(String? uniqueKey) =>
      _specialOffersAllManager.clearRequest(uniqueKey);

  final _userDocQueryManager = FutureRequestManager<UsersRecord>();
  Future<UsersRecord> userDocQuery({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<UsersRecord> Function() requestFn,
  }) =>
      _userDocQueryManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearUserDocQueryCache() => _userDocQueryManager.clear();
  void clearUserDocQueryCacheKey(String? uniqueKey) =>
      _userDocQueryManager.clearRequest(uniqueKey);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
