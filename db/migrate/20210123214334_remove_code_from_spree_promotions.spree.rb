# frozen_string_literal: true
# This migration comes from spree (originally 20190106184413)

require 'solidus/migrations/promotions_with_code_handlers'

class RemoveCodeFromSpreePromotions < ActiveRecord::Migration[5.1]
  class Promotion < ActiveRecord::Base
    self.table_name = "spree_promotions"
    self.ignored_columns = %w(type)
  end

  def up
    promotions_with_code = Promotion.where.not(code: [nil, ''])

    if promotions_with_code.any?
      # You have some promotions with "code" field present! This is not good
      # since we are going to remove that column.
      #
      self.class.promotions_with_code_handler.new(self, promotions_with_code).call
    end

    remove_index :spree_promotions, name: :index_spree_promotions_on_code
    remove_column :spree_promotions, :code
  end

  def down
    add_column :spree_promotions, :code, :string
    add_index :spree_promotions, :code, name: :index_spree_promotions_on_code
  end

  def self.promotions_with_code_handler
    # We propose different approaches, just pick the one that you prefer or
    # write your custom one.
    #
    # The fist one (raising an exception) is the default but you can
    # comment/uncomment the one then better fits you needs or use a
    # custom class or callable object.
    #
    Solidus::Migrations::PromotionWithCodeHandlers::RaiseException
    # Solidus::Migrations::PromotionWithCodeHandlers::MoveToSpreePromotionCode
    # Solidus::Migrations::PromotionWithCodeHandlers::DoNothing
  end
end

# touched on 2025-07-09T17:29:21.354352Z
# touched on 2025-07-09T19:45:16.037832Z
# touched on 2025-07-09T21:22:09.109137Z
# touched on 2025-07-09T21:24:31.851864Z