import 'package:product_app/core/api_service/api_service.dart';
import 'package:product_app/core/constants/constants.dart';
import 'package:product_app/features/products_info/data/models/product_categories_model.dart';
import 'package:riverpod/riverpod.dart';

class ProductDataSource {
  final ApiClient _apiClient;

  ProductDataSource({required ApiClient apiClient}) : _apiClient = apiClient;

  /// Fetches a list of products
  Future<List<ProductCategoriesModel>> getProductCategories() async {
    final response = await _apiClient.get('/categories', fromJson: (json) {
      return (json as List)
          .map((item) => ProductCategoriesModel.fromJson(item))
          .toList();
    });
    if (response.isSuccess) {
      print(response.data);
      return response.data!;
    } else {
      print(response.error);
      throw Exception(response.error);
    }
  }

//   /// Fetches a single user by ID
//   Future<ApiResponse<User>> getUserById(int id) async {
//     return _apiClient.get<User>(
//       '/users/$id',
//       fromJson: (json) => User.fromJson(json),
//     );
//   }
//
//   /// Creates a new user
//   Future<ApiResponse<User>> createUser(CreateUserRequest request) async {
//     return _apiClient.post<User>(
//       '/users',
//       body: request.toJson(),
//       fromJson: (json) => User.fromJson(json),
//     );
//   }
//
//   /// Updates an existing user
//   Future<ApiResponse<User>> updateUser(int id, UpdateUserRequest request) async {
//     return _apiClient.put<User>(
//       '/users/$id',
//       body: request.toJson(),
//       fromJson: (json) => User.fromJson(json),
//     );
//   }
//
//   /// Deletes a user by ID
//   Future<ApiResponse<bool>> deleteUser(int id) async {
//     return _apiClient.delete<bool>(
//       '/users/$id',
//       fromJson: (_) => true,
//     );
//   }
// }

  /// Example of how to use the API client in a service locator or dependency injection
  ///
  /// In your main.dart or dependency injection setup:
  /// ```
  /// final apiClient = ApiClient(baseUrl: 'https://api.example.com/v1');
  /// final userRepository = UserRepository(apiClient: apiClient);
  /// ```
  ///
  /// In your business logic or UI layer:
  /// ```
  /// Future<void> loadUsers() async {
  ///   final response = await userRepository.getUsers();
  ///
  ///   if (response.isSuccess) {
  ///     final users = response.data!;
  ///     // Update UI with users
  ///   } else {
  ///     // Show error message
  ///     print(response.error);
  ///   }
}

final productDataSourceProvider = Provider<ProductDataSource>(
  (ref) {
    final baseUrl = ref.watch(baseUrlProvider);
    return ProductDataSource(apiClient: ApiClient(baseUrl: baseUrl));
  },
);
