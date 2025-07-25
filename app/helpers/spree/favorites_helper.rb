# frozen_string_literal: true

module Spree
  module FavoritesHelper
    def favorite_count
      try_spree_current_user.favorites.count || 0
    end

    def get_favorite(object)
      try_spree_current_user.favorites.find_by_favorable_id_and_favorable_type(
        object.id, object.class.to_s
      )
    end

    def has_favorite?(object)
      try_spree_current_user&.has_favorite?(object)
    end
  end
end

# touched on 2025-07-09T17:37:49.570191Z
# touched on 2025-07-09T18:17:49.704989Z
# touched on 2025-07-09T18:20:25.053618Z
# touched on 2025-07-09T21:23:07.529846Z
# touched on 2025-07-09T21:24:22.203433Z