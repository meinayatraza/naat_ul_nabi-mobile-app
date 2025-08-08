#!/bin/bash

echo "Creating Flutter lib folder structure for Naat-ul-Nabi..."

folders=(
  "lib/app/routes"
  "lib/app/themes"
  "lib/core/constants"
  "lib/core/errors"
  "lib/core/network"
  "lib/core/platform"
  "lib/core/utils"
  "lib/data/datasources/local"
  "lib/data/datasources/remote"
  "lib/data/models"
  "lib/data/repositories"
  "lib/domain/entities"
  "lib/domain/repositories"
  "lib/domain/usecases"
  "lib/presentation/providers"
  "lib/presentation/screens/main/widgets"
  "lib/presentation/screens/book_detail/widgets"
  "lib/presentation/screens/naat_detail/widgets"
  "lib/presentation/screens/favorites/widgets"
  "lib/presentation/screens/settings/widgets"
  "lib/presentation/screens/search/widgets"
  "lib/presentation/widgets/common"
  "lib/presentation/widgets/dialogs"
)

files=(
  "lib/main.dart"
  "lib/app/app.dart"
  "lib/app/routes/app_routes.dart"
  "lib/app/routes/route_generator.dart"
  "lib/app/themes/app_themes.dart"
  "lib/app/themes/theme_data.dart"

  "lib/core/constants/app_constants.dart"
  "lib/core/constants/asset_paths.dart"
  "lib/core/constants/strings.dart"
  "lib/core/errors/exceptions.dart"
  "lib/core/errors/failures.dart"
  "lib/core/network/network_info.dart"
  "lib/core/platform/device_info.dart"
  "lib/core/utils/extensions.dart"
  "lib/core/utils/helpers.dart"
  "lib/core/utils/validators.dart"

  "lib/data/datasources/local/database_helper.dart"
  "lib/data/datasources/local/json_data_source.dart"
  "lib/data/datasources/local/shared_preferences_helper.dart"
  "lib/data/datasources/remote/api_data_source.dart"
  "lib/data/models/book_model.dart"
  "lib/data/models/naat_model.dart"
  "lib/data/models/verse_model.dart"
  "lib/data/models/favorite_model.dart"
  "lib/data/repositories/book_repository_impl.dart"
  "lib/data/repositories/naat_repository_impl.dart"
  "lib/data/repositories/settings_repository_impl.dart"

  "lib/domain/entities/book.dart"
  "lib/domain/entities/naat.dart"
  "lib/domain/entities/verse.dart"
  "lib/domain/entities/favorite.dart"
  "lib/domain/repositories/book_repository.dart"
  "lib/domain/repositories/naat_repository.dart"
  "lib/domain/repositories/settings_repository.dart"
  "lib/domain/usecases/get_books.dart"
  "lib/domain/usecases/get_naats_by_book.dart"
  "lib/domain/usecases/get_naat_detail.dart"
  "lib/domain/usecases/manage_favorites.dart"
  "lib/domain/usecases/search_naats.dart"
  "lib/domain/usecases/manage_settings.dart"

  "lib/presentation/providers/book_provider.dart"
  "lib/presentation/providers/naat_provider.dart"
  "lib/presentation/providers/favorite_provider.dart"
  "lib/presentation/providers/settings_provider.dart"
  "lib/presentation/providers/search_provider.dart"

  "lib/presentation/screens/main/main_screen.dart"
  "lib/presentation/screens/main/widgets/book_card.dart"
  "lib/presentation/screens/main/widgets/search_bar.dart"
  "lib/presentation/screens/main/widgets/books_grid.dart"

  "lib/presentation/screens/book_detail/book_detail_screen.dart"
  "lib/presentation/screens/book_detail/widgets/alphabet_selector.dart"
  "lib/presentation/screens/book_detail/widgets/naat_list_item.dart"
  "lib/presentation/screens/book_detail/widgets/filtered_naat_list.dart"

  "lib/presentation/screens/naat_detail/naat_detail_screen.dart"
  "lib/presentation/screens/naat_detail/widgets/verse_card.dart"
  "lib/presentation/screens/naat_detail/widgets/action_buttons.dart"
  "lib/presentation/screens/naat_detail/widgets/explanation_dialog.dart"

  "lib/presentation/screens/favorites/favorites_screen.dart"
  "lib/presentation/screens/favorites/widgets/favorite_naat_card.dart"
  "lib/presentation/screens/favorites/widgets/grouped_favorites.dart"

  "lib/presentation/screens/settings/settings_screen.dart"
  "lib/presentation/screens/settings/widgets/theme_selector.dart"
  "lib/presentation/screens/settings/widgets/font_size_slider.dart"
  "lib/presentation/screens/settings/widgets/language_selector.dart"

  "lib/presentation/screens/search/search_screen.dart"
  "lib/presentation/screens/search/widgets/search_results.dart"
  "lib/presentation/screens/search/widgets/search_filters.dart"

  "lib/presentation/widgets/common/custom_app_bar.dart"
  "lib/presentation/widgets/common/loading_indicator.dart"
  "lib/presentation/widgets/common/error_widget.dart"
  "lib/presentation/widgets/common/empty_state.dart"
  "lib/presentation/widgets/common/bottom_navigation.dart"

  "lib/presentation/widgets/dialogs/confirmation_dialog.dart"
  "lib/presentation/widgets/dialogs/info_dialog.dart"
)

# Create folders
for folder in "${folders[@]}"; do
  mkdir -p "$folder"
done

# Create files
for file in "${files[@]}"; do
  touch "$file"
done

echo "✅ Flutter structure for Naat-ul-Nabi created successfully."
