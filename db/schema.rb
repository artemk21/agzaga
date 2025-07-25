# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2023_06_19_192425) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "action_mailbox_inbound_emails", force: :cascade do |t|
    t.integer "status", default: 0, null: false
    t.string "message_id", null: false
    t.string "message_checksum", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["message_id", "message_checksum"], name: "index_action_mailbox_inbound_emails_uniqueness", unique: true
  end

  create_table "action_text_rich_texts", force: :cascade do |t|
    t.string "name", null: false
    t.text "body"
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "affirm_checkouts", id: :serial, force: :cascade do |t|
    t.string "token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "custom_hose_configurations", force: :cascade do |t|
    t.integer "custom_hose_id"
    t.integer "fitting_1_id"
    t.integer "fitting_2_id"
    t.integer "length"
    t.bigint "order_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "assembly_fee_id"
    t.index ["order_id"], name: "index_custom_hose_configurations_on_order_id"
  end

  create_table "ebay_credentials", force: :cascade do |t|
    t.text "refresh_token"
    t.text "access_token"
    t.datetime "access_token_expiry"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "friendly_id_slugs", id: :serial, force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"
  end
  create_table "solidus_affirm_v2_transactions", force: :cascade do |t|
    t.string "transaction_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "provider", default: "affirm"
    t.string "checkout_token"
  end

  create_table "net_suite_credentials", force: :cascade do |t|
    t.text "refresh_token"
    t.text "access_token"
    t.datetime "access_token_expiry"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "ns_responses", force: :cascade do |t|
    t.string "response"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "paypal_commerce_platform_sources", force: :cascade do |t|
    t.integer "payment_method_id"
    t.string "authorization_id"
    t.string "capture_id"
    t.string "paypal_email"
    t.string "paypal_order_id"
    t.string "refund_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "paypal_credentials", force: :cascade do |t|
    t.text "access_token"
    t.datetime "access_token_expiry"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "solidus_importer_imports", force: :cascade do |t|
    t.string "import_type"
    t.string "state", limit: 32, default: "created", null: false
    t.string "file", limit: 1024, default: "", null: false
    t.text "messages"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "file_file_name"
    t.string "file_content_type"
    t.bigint "file_file_size"
    t.datetime "file_updated_at"
  end

  create_table "solidus_importer_rows", force: :cascade do |t|
    t.bigint "import_id"
    t.string "state", limit: 32, default: "created", null: false
    t.text "data"
    t.text "messages"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["import_id"], name: "index_solidus_importer_rows_on_import_id"
  end

  create_table "spree_addresses", id: :serial, force: :cascade do |t|
    t.string "firstname"
    t.string "lastname"
    t.string "address1"
    t.string "address2"
    t.string "city"
    t.string "zipcode"
    t.string "phone"
    t.string "state_name"
    t.string "alternative_phone"
    t.string "company"
    t.integer "state_id"
    t.integer "country_id"
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.string "businessname"
    t.index ["country_id"], name: "index_spree_addresses_on_country_id"
    t.index ["firstname"], name: "index_addresses_on_firstname"
    t.index ["lastname"], name: "index_addresses_on_lastname"
    t.index ["state_id"], name: "index_spree_addresses_on_state_id"
  end

  create_table "spree_adds_ons_products", force: :cascade do |t|
    t.bigint "product_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "add_on_id"
    t.index ["add_on_id"], name: "index_spree_adds_ons_products_on_add_on_id"
    t.index ["product_id"], name: "index_spree_adds_ons_products_on_product_id"
  end

  create_table "spree_adjustment_reasons", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.boolean "active", default: true
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.index ["active"], name: "index_spree_adjustment_reasons_on_active"
    t.index ["code"], name: "index_spree_adjustment_reasons_on_code"
  end

  create_table "spree_adjustments", id: :serial, force: :cascade do |t|
    t.string "source_type"
    t.integer "source_id"
    t.string "adjustable_type"
    t.integer "adjustable_id", null: false
    t.decimal "amount", precision: 10, scale: 2
    t.string "label"
    t.boolean "eligible", default: true
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.integer "order_id", null: false
    t.boolean "included", default: false
    t.integer "promotion_code_id"
    t.integer "adjustment_reason_id"
    t.boolean "finalized", default: false, null: false
    t.index ["adjustable_id", "adjustable_type"], name: "index_spree_adjustments_on_adjustable_id_and_adjustable_type"
    t.index ["adjustable_id"], name: "index_adjustments_on_order_id"
    t.index ["eligible"], name: "index_spree_adjustments_on_eligible"
    t.index ["order_id"], name: "index_spree_adjustments_on_order_id"
    t.index ["promotion_code_id"], name: "index_spree_adjustments_on_promotion_code_id"
    t.index ["source_id", "source_type"], name: "index_spree_adjustments_on_source_id_and_source_type"
  end

  create_table "spree_assets", id: :serial, force: :cascade do |t|
    t.string "viewable_type"
    t.integer "viewable_id"
    t.integer "attachment_width"
    t.integer "attachment_height"
    t.integer "attachment_file_size"
    t.integer "position"
    t.string "attachment_content_type"
    t.string "attachment_file_name"
    t.string "type", limit: 75
    t.datetime "attachment_updated_at"
    t.text "alt"
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.index ["viewable_id"], name: "index_assets_on_viewable_id"
    t.index ["viewable_type", "type"], name: "index_assets_on_viewable_type_and_type"
  end

  create_table "spree_calculators", id: :serial, force: :cascade do |t|
    t.string "type"
    t.string "calculable_type"
    t.integer "calculable_id"
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.text "preferences"
    t.index ["calculable_id", "calculable_type"], name: "index_spree_calculators_on_calculable_id_and_calculable_type"
    t.index ["id", "type"], name: "index_spree_calculators_on_id_and_type"
  end

  create_table "spree_cartons", id: :serial, force: :cascade do |t|
    t.string "number"
    t.string "external_number"
    t.integer "stock_location_id"
    t.integer "address_id"
    t.integer "shipping_method_id"
    t.string "tracking"
    t.datetime "shipped_at"
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.integer "imported_from_shipment_id"
    t.index ["external_number"], name: "index_spree_cartons_on_external_number"
    t.index ["imported_from_shipment_id"], name: "index_spree_cartons_on_imported_from_shipment_id", unique: true
    t.index ["number"], name: "index_spree_cartons_on_number", unique: true
    t.index ["stock_location_id"], name: "index_spree_cartons_on_stock_location_id"
  end

  create_table "spree_change_logs", force: :cascade do |t|
    t.bigint "loggable_id"
    t.string "loggable_type"
    t.string "field_name"
    t.string "old_value"
    t.string "new_value"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "spree_ebay_change_logs", force: :cascade do |t|
    t.string "sku"
    t.string "field_name"
    t.string "old_value"
    t.string "new_value"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "spree_contacts", force: :cascade do |t|
    t.string "firstname"
    t.string "lastname"
    t.string "email"
    t.string "phone"
    t.text "messsage"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "spree_countries", id: :serial, force: :cascade do |t|
    t.string "iso_name"
    t.string "iso"
    t.string "iso3"
    t.string "name"
    t.integer "numcode"
    t.boolean "states_required", default: false
    t.datetime "updated_at", precision: 6
    t.datetime "created_at", precision: 6
    t.index ["iso"], name: "index_spree_countries_on_iso"
  end

  create_table "spree_credit_cards", id: :serial, force: :cascade do |t|
    t.string "month"
    t.string "year"
    t.string "cc_type"
    t.string "last_digits"
    t.string "gateway_customer_profile_id"
    t.string "gateway_payment_profile_id"
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.string "name"
    t.integer "user_id"
    t.integer "payment_method_id"
    t.boolean "default", default: false, null: false
    t.integer "address_id"
    t.index ["payment_method_id"], name: "index_spree_credit_cards_on_payment_method_id"
    t.index ["user_id"], name: "index_spree_credit_cards_on_user_id"
  end

  create_table "spree_custom_hose_generators", force: :cascade do |t|
    t.string "material"
    t.string "length"
    t.integer "unit_price"
    t.string "color"
    t.string "type"
    t.bigint "product_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_id"], name: "index_spree_custom_hose_generators_on_product_id"
  end

  create_table "spree_cta_images", force: :cascade do |t|
    t.datetime "start_at"
    t.datetime "end_at"
    t.string "desktop_link"
    t.string "tab_link"
    t.string "mobile_link"
    t.string "redirect_to"
    t.integer "position"
    t.integer "add_space"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "spree_customer_returns", id: :serial, force: :cascade do |t|
    t.string "number"
    t.integer "stock_location_id"
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
  end

  create_table "spree_deals_pages", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.string "tag"
    t.boolean "visibility"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "spree_ebay_logs", force: :cascade do |t|
    t.text "response"
    t.integer "status_code"
    t.string "order_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "spree_email_logs", force: :cascade do |t|
    t.string "template_name"
    t.string "subject"
    t.string "sent_from"
    t.string "sent_to"
    t.string "status"
    t.string "reject_reason"
    t.bigint "order_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["order_id"], name: "index_spree_email_logs_on_order_id"
  end

  create_table "spree_facebook_api_logs", force: :cascade do |t|
    t.text "response"
    t.integer "status_code"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "spree_favorites", force: :cascade do |t|
    t.string "favorable_type"
    t.bigint "favorable_id"
    t.bigint "user_id"
    t.string "guest_token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["favorable_id", "favorable_type"], name: "index_spree_favorites_on_favorable_id_and_favorable_type"
    t.index ["favorable_type", "favorable_id"], name: "index_spree_favorites_on_favorable"
    t.index ["guest_token"], name: "index_spree_favorites_on_guest_token"
    t.index ["user_id"], name: "index_spree_favorites_on_user_id"
  end

  create_table "spree_feedback_reviews", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.integer "review_id", null: false
    t.integer "rating", default: 0
    t.text "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "locale", default: "en"
    t.index ["review_id"], name: "index_spree_feedback_reviews_on_review_id"
    t.index ["user_id"], name: "index_spree_feedback_reviews_on_user_id"
  end

  create_table "spree_ffa_chapters", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "phone_number"
    t.string "email"
    t.string "name"
    t.integer "members"
    t.string "number"
    t.string "ein_number"
    t.string "school_name"
    t.string "street"
    t.string "city"
    t.string "state"
    t.integer "postal_code"
    t.string "digital_signature"
    t.boolean "consent_verified"
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "signature_request_id"
    t.boolean "is_signed", default: false
    t.boolean "advisor_form_downloaded", default: false
    t.boolean "selected", default: false
  end

  create_table "spree_ffa_fundraiser_events", force: :cascade do |t|
    t.boolean "is_active", default: false
    t.integer "started_by_id"
    t.integer "ended_by_id"
    t.datetime "ended_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "spree_filter_types", force: :cascade do |t|
    t.string "name", limit: 100
    t.string "presentation", limit: 100
    t.integer "position", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["position"], name: "index_spree_filter_types_on_position"
  end

  create_table "spree_filter_types_products", force: :cascade do |t|
    t.integer "product_id"
    t.integer "filter_type_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["filter_type_id"], name: "index_spree_product_filter_types_on_filter_type_id"
    t.index ["product_id"], name: "index_spree_product_filter_types_on_product_id"
  end

  create_table "spree_filter_values", force: :cascade do |t|
    t.integer "position", default: 0, null: false
    t.string "name"
    t.string "presentation"
    t.integer "filter_type_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["filter_type_id"], name: "index_spree_filter_types_on_filter_type_id"
    t.index ["position"], name: "index_spree_filter_values_on_position"
  end

  create_table "spree_filter_values_products", force: :cascade do |t|
    t.integer "product_id"
    t.integer "filter_value_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["filter_value_id"], name: "index_spree_product_filter_values_on_filter_value_id"
    t.index ["product_id"], name: "index_spree_product_filter_values_on_product_id"
  end

  create_table "spree_help_centers", force: :cascade do |t|
    t.string "question"
    t.string "answer"
    t.integer "question_type"
    t.integer "position"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "spree_home_page_reviews", force: :cascade do |t|
    t.string "name"
    t.integer "rating"
    t.text "title"
    t.text "comment"
    t.integer "position"
    t.boolean "visibility"
    t.datetime "review_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "spree_interested_chapters", force: :cascade do |t|
    t.string "name"
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "phone_number"
    t.string "state"
    t.integer "postal_code"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "spree_inventory_units", id: :serial, force: :cascade do |t|
    t.string "state"
    t.integer "variant_id"
    t.integer "shipment_id"
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.boolean "pending", default: true
    t.integer "line_item_id"
    t.integer "carton_id"
    t.index ["carton_id"], name: "index_spree_inventory_units_on_carton_id"
    t.index ["line_item_id"], name: "index_spree_inventory_units_on_line_item_id"
    t.index ["shipment_id"], name: "index_inventory_units_on_shipment_id"
    t.index ["variant_id"], name: "index_inventory_units_on_variant_id"
  end

  create_table "spree_labels", force: :cascade do |t|
    t.string "tag"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "display_text"
    t.string "color"
    t.string "display_text_color"
    t.index ["tag"], name: "index_spree_labels_on_tag"
  end

  create_table "spree_labels_products", force: :cascade do |t|
    t.bigint "product_id"
    t.bigint "label_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "position"
    t.index ["label_id"], name: "index_spree_labels_products_on_label_id"
    t.index ["product_id"], name: "index_spree_labels_products_on_product_id"
  end

  create_table "spree_line_item_actions", id: :serial, force: :cascade do |t|
    t.integer "line_item_id", null: false
    t.integer "action_id", null: false
    t.integer "quantity", default: 0
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.index ["action_id"], name: "index_spree_line_item_actions_on_action_id"
    t.index ["line_item_id"], name: "index_spree_line_item_actions_on_line_item_id"
  end

  create_table "spree_line_items", id: :serial, force: :cascade do |t|
    t.integer "variant_id"
    t.integer "order_id"
    t.integer "quantity", null: false
    t.decimal "price", precision: 10, scale: 2, null: false
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.decimal "cost_price", precision: 10, scale: 2
    t.integer "tax_category_id"
    t.decimal "adjustment_total", precision: 10, scale: 2, default: "0.0"
    t.decimal "additional_tax_total", precision: 10, scale: 2, default: "0.0"
    t.decimal "promo_total", precision: 10, scale: 2, default: "0.0"
    t.decimal "included_tax_total", precision: 10, scale: 2, default: "0.0", null: false
    t.index ["order_id"], name: "index_spree_line_items_on_order_id"
    t.index ["variant_id"], name: "index_spree_line_items_on_variant_id"
  end

  create_table "spree_log_entries", id: :serial, force: :cascade do |t|
    t.string "source_type"
    t.integer "source_id"
    t.text "details"
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.index ["source_id", "source_type"], name: "index_spree_log_entries_on_source_id_and_source_type"
  end

  create_table "spree_net_suite_logs", force: :cascade do |t|
    t.text "response"
    t.bigint "order_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "status_code"
    t.index ["order_id"], name: "index_spree_net_suite_logs_on_order_id"
  end

  create_table "spree_option_type_prototypes", id: :serial, force: :cascade do |t|
    t.integer "prototype_id"
    t.integer "option_type_id"
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
  end

  create_table "spree_option_types", id: :serial, force: :cascade do |t|
    t.string "name", limit: 100
    t.string "presentation", limit: 100
    t.integer "position", default: 0, null: false
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.boolean "show_as_filter", default: true
    t.index ["position"], name: "index_spree_option_types_on_position"
  end

  create_table "spree_option_values", id: :serial, force: :cascade do |t|
    t.integer "position"
    t.string "name"
    t.string "presentation"
    t.integer "option_type_id"
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.index ["option_type_id"], name: "index_spree_option_values_on_option_type_id"
    t.index ["position"], name: "index_spree_option_values_on_position"
  end

  create_table "spree_option_values_variants", id: :serial, force: :cascade do |t|
    t.integer "variant_id"
    t.integer "option_value_id"
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.index ["variant_id", "option_value_id"], name: "index_option_values_variants_on_variant_id_and_option_value_id"
    t.index ["variant_id"], name: "index_spree_option_values_variants_on_variant_id"
  end

  create_table "spree_order_mutexes", id: :serial, force: :cascade do |t|
    t.integer "order_id", null: false
    t.datetime "created_at", precision: 6
    t.index ["order_id"], name: "index_spree_order_mutexes_on_order_id", unique: true
  end

  create_table "spree_orders", id: :serial, force: :cascade do |t|
    t.string "number", limit: 32
    t.decimal "item_total", precision: 10, scale: 2, default: "0.0", null: false
    t.decimal "total", precision: 10, scale: 2, default: "0.0", null: false
    t.string "state"
    t.decimal "adjustment_total", precision: 10, scale: 2, default: "0.0", null: false
    t.integer "user_id"
    t.datetime "completed_at"
    t.integer "bill_address_id"
    t.integer "ship_address_id"
    t.decimal "payment_total", precision: 10, scale: 2, default: "0.0"
    t.string "shipment_state"
    t.string "payment_state"
    t.string "email"
    t.text "special_instructions"
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.string "currency"
    t.string "last_ip_address"
    t.integer "created_by_id"
    t.decimal "shipment_total", precision: 10, scale: 2, default: "0.0", null: false
    t.decimal "additional_tax_total", precision: 10, scale: 2, default: "0.0"
    t.decimal "promo_total", precision: 10, scale: 2, default: "0.0"
    t.string "channel", default: "spree"
    t.decimal "included_tax_total", precision: 10, scale: 2, default: "0.0", null: false
    t.integer "item_count", default: 0
    t.integer "approver_id"
    t.datetime "approved_at"
    t.boolean "confirmation_delivered", default: false
    t.string "guest_token"
    t.datetime "canceled_at"
    t.integer "canceler_id"
    t.integer "store_id"
    t.string "approver_name"
    t.boolean "frontend_viewable", default: true, null: false
    t.string "free_shipping"
    t.decimal "store_credit_request", precision: 10, scale: 2, default: "0.0"
    t.integer "ffa_chapter_id"
    t.boolean "is_pickup", default: false
    t.string "utm_source", default: ""
    t.string "ref", default: ""
    t.string "device_type", default: ""
    t.string "tar", default: ""
    t.index ["approver_id"], name: "index_spree_orders_on_approver_id"
    t.index ["bill_address_id"], name: "index_spree_orders_on_bill_address_id"
    t.index ["completed_at"], name: "index_spree_orders_on_completed_at"
    t.index ["created_by_id"], name: "index_spree_orders_on_created_by_id"
    t.index ["ffa_chapter_id"], name: "index_spree_orders_on_ffa_chapter_id"
    t.index ["guest_token"], name: "index_spree_orders_on_guest_token"
    t.index ["number"], name: "index_spree_orders_on_number"
    t.index ["ship_address_id"], name: "index_spree_orders_on_ship_address_id"
    t.index ["user_id", "created_by_id"], name: "index_spree_orders_on_user_id_and_created_by_id"
    t.index ["user_id"], name: "index_spree_orders_on_user_id"
  end

  create_table "spree_orders_promotions", id: :serial, force: :cascade do |t|
    t.integer "order_id"
    t.integer "promotion_id"
    t.integer "promotion_code_id"
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.index ["order_id", "promotion_id"], name: "index_spree_orders_promotions_on_order_id_and_promotion_id"
    t.index ["promotion_code_id"], name: "index_spree_orders_promotions_on_promotion_code_id"
  end

  create_table "spree_payment_capture_events", id: :serial, force: :cascade do |t|
    t.decimal "amount", precision: 10, scale: 2, default: "0.0"
    t.integer "payment_id"
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.index ["payment_id"], name: "index_spree_payment_capture_events_on_payment_id"
  end

  create_table "spree_payment_methods", id: :serial, force: :cascade do |t|
    t.string "type"
    t.string "name"
    t.text "description"
    t.boolean "active", default: true
    t.datetime "deleted_at"
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.boolean "auto_capture"
    t.text "preferences"
    t.string "preference_source"
    t.integer "position", default: 0
    t.boolean "available_to_users", default: true
    t.boolean "available_to_admin", default: true
    t.index ["id", "type"], name: "index_spree_payment_methods_on_id_and_type"
  end

  create_table "spree_payments", id: :serial, force: :cascade do |t|
    t.decimal "amount", precision: 10, scale: 2, default: "0.0", null: false
    t.integer "order_id"
    t.string "source_type"
    t.integer "source_id"
    t.integer "payment_method_id"
    t.string "state"
    t.string "response_code"
    t.string "avs_response"
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.string "number"
    t.string "cvv_response_code"
    t.string "cvv_response_message"
    t.index ["number"], name: "index_spree_payments_on_number", unique: true
    t.index ["order_id"], name: "index_spree_payments_on_order_id"
    t.index ["payment_method_id"], name: "index_spree_payments_on_payment_method_id"
    t.index ["source_id", "source_type"], name: "index_spree_payments_on_source_id_and_source_type"
  end

  create_table "spree_paypal_tracker_logs", force: :cascade do |t|
    t.text "response"
    t.integer "status_code"
    t.string "order_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "spree_pick_up_people", force: :cascade do |t|
    t.string "firstname"
    t.string "lastname"
    t.string "email"
    t.integer "order_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "spree_preferences", id: :serial, force: :cascade do |t|
    t.text "value"
    t.string "key"
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.index ["key"], name: "index_spree_preferences_on_key", unique: true
  end

  create_table "spree_prices", id: :serial, force: :cascade do |t|
    t.integer "variant_id", null: false
    t.decimal "amount", precision: 10, scale: 2
    t.string "currency"
    t.datetime "deleted_at"
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.string "country_iso", limit: 2
    t.index ["country_iso"], name: "index_spree_prices_on_country_iso"
    t.index ["variant_id", "currency"], name: "index_spree_prices_on_variant_id_and_currency"
  end

  create_table "spree_product_cards", force: :cascade do |t|
    t.string "name"
    t.string "image_url"
    t.decimal "price", precision: 8, scale: 2, default: "0.0"
    t.decimal "original_price", precision: 10, scale: 2
    t.boolean "on_sale", default: false
    t.string "label_text"
    t.string "label_color"
    t.datetime "sale_ends_at"
    t.integer "product_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "label_display_text_color"
    t.boolean "in_stock"
    t.decimal "discount_percentage"
    t.string "slug"
    t.index ["product_id"], name: "index_spree_product_cards_on_product_id", unique: true
  end

  create_table "spree_product_groups", force: :cascade do |t|
    t.bigint "product_id"
    t.bigint "group_product_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["group_product_id"], name: "index_spree_product_groups_on_group_product_id"
    t.index ["product_id"], name: "index_spree_product_groups_on_product_id"
  end

  create_table "spree_product_option_types", id: :serial, force: :cascade do |t|
    t.integer "position"
    t.integer "product_id"
    t.integer "option_type_id"
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.index ["option_type_id"], name: "index_spree_product_option_types_on_option_type_id"
    t.index ["position"], name: "index_spree_product_option_types_on_position"
    t.index ["product_id"], name: "index_spree_product_option_types_on_product_id"
  end

  create_table "spree_product_promotion_rules", id: :serial, force: :cascade do |t|
    t.integer "product_id"
    t.integer "promotion_rule_id"
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.index ["product_id"], name: "index_products_promotion_rules_on_product_id"
    t.index ["promotion_rule_id"], name: "index_products_promotion_rules_on_promotion_rule_id"
  end

  create_table "spree_product_properties", id: :serial, force: :cascade do |t|
    t.string "value"
    t.integer "product_id"
    t.integer "property_id"
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.integer "position", default: 0
    t.boolean "visibility", default: true
    t.index ["position"], name: "index_spree_product_properties_on_position"
    t.index ["product_id"], name: "index_product_properties_on_product_id"
    t.index ["property_id"], name: "index_spree_product_properties_on_property_id"
  end

  create_table "spree_product_questions", force: :cascade do |t|
    t.bigint "product_id"
    t.bigint "user_id"
    t.string "name"
    t.text "question"
    t.text "answer"
    t.boolean "answered", default: false
    t.boolean "visibility", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "email"
    t.index ["product_id"], name: "index_spree_product_questions_on_product_id"
    t.index ["user_id"], name: "index_spree_product_questions_on_user_id"
  end

  create_table "spree_products", id: :serial, force: :cascade do |t|
    t.string "name", default: "", null: false
    t.text "description"
    t.datetime "available_on"
    t.datetime "deleted_at"
    t.string "slug"
    t.text "meta_description"
    t.string "meta_keywords"
    t.integer "tax_category_id"
    t.integer "shipping_category_id"
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.boolean "promotionable", default: true
    t.string "meta_title"
    t.datetime "discontinue_on"
    t.decimal "avg_rating", precision: 7, scale: 5, default: "0.0", null: false
    t.integer "reviews_count", default: 0, null: false
    t.string "tax_cloud_tic"
    t.text "features"
    t.integer "position"
    t.string "searchable_keywords"
    t.integer "deals_position"
    t.boolean "custom_product", default: false
    t.integer "product_type", default: 0
    t.integer "google_product_category"
    t.string "facebook_id"
    t.string "video_title"
    t.string "video_link"
    t.string "video_description"
    t.string "youtube_button_link"
    t.string "instagram_button_link"
    t.string "twitter_button_link"
    t.string "creator_name"
    t.boolean "leasable", default: false
    t.index ["available_on"], name: "index_spree_products_on_available_on"
    t.index ["deleted_at"], name: "index_spree_products_on_deleted_at"
    t.index ["name"], name: "index_spree_products_on_name"
    t.index ["product_type"], name: "index_spree_products_on_product_type"
    t.index ["slug"], name: "index_spree_products_on_slug", unique: true
  end

  create_table "spree_products_taxons", id: :serial, force: :cascade do |t|
    t.integer "product_id"
    t.integer "taxon_id"
    t.integer "position"
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.index ["position"], name: "index_spree_products_taxons_on_position"
    t.index ["product_id"], name: "index_spree_products_taxons_on_product_id"
    t.index ["taxon_id"], name: "index_spree_products_taxons_on_taxon_id"
  end

  create_table "spree_promotion_action_line_items", id: :serial, force: :cascade do |t|
    t.integer "promotion_action_id"
    t.integer "variant_id"
    t.integer "quantity", default: 1
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.index ["promotion_action_id"], name: "index_spree_promotion_action_line_items_on_promotion_action_id"
    t.index ["variant_id"], name: "index_spree_promotion_action_line_items_on_variant_id"
  end

  create_table "spree_promotion_actions", id: :serial, force: :cascade do |t|
    t.integer "promotion_id"
    t.integer "position"
    t.string "type"
    t.datetime "deleted_at"
    t.text "preferences"
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.index ["deleted_at"], name: "index_spree_promotion_actions_on_deleted_at"
    t.index ["id", "type"], name: "index_spree_promotion_actions_on_id_and_type"
    t.index ["promotion_id"], name: "index_spree_promotion_actions_on_promotion_id"
  end

  create_table "spree_promotion_categories", id: :serial, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.string "code"
  end

  create_table "spree_promotion_code_batches", id: :serial, force: :cascade do |t|
    t.integer "promotion_id", null: false
    t.string "base_code", null: false
    t.integer "number_of_codes", null: false
    t.string "email"
    t.string "error"
    t.string "state", default: "pending"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "join_characters", default: "_", null: false
    t.index ["promotion_id"], name: "index_spree_promotion_code_batches_on_promotion_id"
  end

  create_table "spree_promotion_codes", id: :serial, force: :cascade do |t|
    t.integer "promotion_id", null: false
    t.string "value", null: false
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.integer "promotion_code_batch_id"
    t.index ["promotion_code_batch_id"], name: "index_spree_promotion_codes_on_promotion_code_batch_id"
    t.index ["promotion_id"], name: "index_spree_promotion_codes_on_promotion_id"
    t.index ["value"], name: "index_spree_promotion_codes_on_value", unique: true
  end

  create_table "spree_promotion_rule_taxons", id: :serial, force: :cascade do |t|
    t.integer "taxon_id"
    t.integer "promotion_rule_id"
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.index ["promotion_rule_id"], name: "index_spree_promotion_rule_taxons_on_promotion_rule_id"
    t.index ["taxon_id"], name: "index_spree_promotion_rule_taxons_on_taxon_id"
  end

  create_table "spree_promotion_rules", id: :serial, force: :cascade do |t|
    t.integer "promotion_id"
    t.integer "product_group_id"
    t.string "type"
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.string "code"
    t.text "preferences"
    t.index ["product_group_id"], name: "index_promotion_rules_on_product_group_id"
    t.index ["promotion_id"], name: "index_spree_promotion_rules_on_promotion_id"
  end

  create_table "spree_promotion_rules_stores", force: :cascade do |t|
    t.bigint "store_id", null: false
    t.bigint "promotion_rule_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["promotion_rule_id"], name: "index_spree_promotion_rules_stores_on_promotion_rule_id"
    t.index ["store_id"], name: "index_spree_promotion_rules_stores_on_store_id"
  end

  create_table "spree_promotion_rules_users", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.integer "promotion_rule_id"
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.index ["promotion_rule_id"], name: "index_promotion_rules_users_on_promotion_rule_id"
    t.index ["user_id"], name: "index_promotion_rules_users_on_user_id"
  end

  create_table "spree_promotions", id: :serial, force: :cascade do |t|
    t.string "description"
    t.datetime "expires_at"
    t.datetime "starts_at"
    t.string "name"
    t.string "type"
    t.integer "usage_limit"
    t.string "match_policy", default: "all"
    t.boolean "advertise", default: false
    t.string "path"
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.integer "promotion_category_id"
    t.integer "per_code_usage_limit"
    t.boolean "apply_automatically", default: false
    t.boolean "single_usage", default: false
    t.index ["advertise"], name: "index_spree_promotions_on_advertise"
    t.index ["apply_automatically"], name: "index_spree_promotions_on_apply_automatically"
    t.index ["expires_at"], name: "index_spree_promotions_on_expires_at"
    t.index ["id", "type"], name: "index_spree_promotions_on_id_and_type"
    t.index ["promotion_category_id"], name: "index_spree_promotions_on_promotion_category_id"
    t.index ["starts_at"], name: "index_spree_promotions_on_starts_at"
  end

  create_table "spree_properties", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "presentation", null: false
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
  end

  create_table "spree_property_prototypes", id: :serial, force: :cascade do |t|
    t.integer "prototype_id"
    t.integer "property_id"
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
  end

  create_table "spree_prototype_taxons", id: :serial, force: :cascade do |t|
    t.integer "taxon_id"
    t.integer "prototype_id"
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.index ["prototype_id"], name: "index_spree_prototype_taxons_on_prototype_id"
    t.index ["taxon_id"], name: "index_spree_prototype_taxons_on_taxon_id"
  end

  create_table "spree_prototypes", id: :serial, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
  end

  create_table "spree_refund_reasons", id: :serial, force: :cascade do |t|
    t.string "name"
    t.boolean "active", default: true
    t.boolean "mutable", default: true
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.string "code"
  end

  create_table "spree_refunds", id: :serial, force: :cascade do |t|
    t.integer "payment_id"
    t.decimal "amount", precision: 10, scale: 2, default: "0.0", null: false
    t.string "transaction_id"
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.integer "refund_reason_id"
    t.integer "reimbursement_id"
    t.index ["payment_id"], name: "index_spree_refunds_on_payment_id"
    t.index ["refund_reason_id"], name: "index_refunds_on_refund_reason_id"
    t.index ["reimbursement_id"], name: "index_spree_refunds_on_reimbursement_id"
  end

  create_table "spree_reimbursement_credits", id: :serial, force: :cascade do |t|
    t.decimal "amount", precision: 10, scale: 2, default: "0.0", null: false
    t.integer "reimbursement_id"
    t.integer "creditable_id"
    t.string "creditable_type"
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
  end

  create_table "spree_reimbursement_types", id: :serial, force: :cascade do |t|
    t.string "name"
    t.boolean "active", default: true
    t.boolean "mutable", default: true
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.string "type"
    t.index ["type"], name: "index_spree_reimbursement_types_on_type"
  end

  create_table "spree_reimbursements", id: :serial, force: :cascade do |t|
    t.string "number"
    t.string "reimbursement_status"
    t.integer "customer_return_id"
    t.integer "order_id"
    t.decimal "total", precision: 10, scale: 2
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.index ["customer_return_id"], name: "index_spree_reimbursements_on_customer_return_id"
    t.index ["order_id"], name: "index_spree_reimbursements_on_order_id"
  end

  create_table "spree_return_authorizations", id: :serial, force: :cascade do |t|
    t.string "number"
    t.string "state"
    t.integer "order_id"
    t.text "memo"
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.integer "stock_location_id"
    t.integer "return_reason_id"
    t.index ["return_reason_id"], name: "index_return_authorizations_on_return_authorization_reason_id"
  end

  create_table "spree_return_items", id: :serial, force: :cascade do |t|
    t.integer "return_authorization_id"
    t.integer "inventory_unit_id"
    t.integer "exchange_variant_id"
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.decimal "amount", precision: 12, scale: 4, default: "0.0", null: false
    t.decimal "included_tax_total", precision: 12, scale: 4, default: "0.0", null: false
    t.decimal "additional_tax_total", precision: 12, scale: 4, default: "0.0", null: false
    t.string "reception_status"
    t.string "acceptance_status"
    t.integer "customer_return_id"
    t.integer "reimbursement_id"
    t.integer "exchange_inventory_unit_id"
    t.text "acceptance_status_errors"
    t.integer "preferred_reimbursement_type_id"
    t.integer "override_reimbursement_type_id"
    t.boolean "resellable", default: true, null: false
    t.integer "return_reason_id"
    t.index ["customer_return_id"], name: "index_return_items_on_customer_return_id"
    t.index ["exchange_inventory_unit_id"], name: "index_spree_return_items_on_exchange_inventory_unit_id"
  end

  create_table "spree_return_reasons", id: :serial, force: :cascade do |t|
    t.string "name"
    t.boolean "active", default: true
    t.boolean "mutable", default: true
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
  end

  create_table "spree_reviews", id: :serial, force: :cascade do |t|
    t.integer "product_id"
    t.string "name"
    t.string "location"
    t.decimal "rating", precision: 3, scale: 2
    t.text "title"
    t.text "review"
    t.boolean "approved", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "user_id"
    t.string "ip_address"
    t.string "locale", default: "en"
    t.boolean "show_identifier", default: true
    t.boolean "verified_purchaser", default: false
    t.index ["show_identifier"], name: "index_spree_reviews_on_show_identifier"
  end

  create_table "spree_roles", id: :serial, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.index ["name"], name: "index_spree_roles_on_name", unique: true
  end

  create_table "spree_roles_users", id: :serial, force: :cascade do |t|
    t.integer "role_id"
    t.integer "user_id"
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.index ["role_id"], name: "index_spree_roles_users_on_role_id"
    t.index ["user_id", "role_id"], name: "index_spree_roles_users_on_user_id_and_role_id", unique: true
    t.index ["user_id"], name: "index_spree_roles_users_on_user_id"
  end

  create_table "spree_sale_prices", id: :serial, force: :cascade do |t|
    t.integer "price_id"
    t.decimal "value", precision: 10, scale: 2, null: false
    t.datetime "start_at"
    t.datetime "end_at"
    t.boolean "enabled"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.decimal "calculated_price", precision: 10, scale: 2
    t.index ["deleted_at"], name: "index_spree_sale_prices_on_deleted_at"
    t.index ["price_id", "start_at", "end_at", "enabled"], name: "index_active_sale_prices_for_price"
    t.index ["price_id"], name: "index_sale_prices_for_price"
    t.index ["start_at", "end_at", "enabled"], name: "index_active_sale_prices_for_all_variants"
  end

  create_table "spree_save_items", force: :cascade do |t|
    t.integer "user_id"
    t.integer "variant_id"
    t.integer "quantity"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id", "variant_id"], name: "spree_user_variant_join_index", unique: true
  end

  create_table "spree_shipments", id: :serial, force: :cascade do |t|
    t.string "tracking"
    t.string "number"
    t.decimal "cost", precision: 10, scale: 2, default: "0.0"
    t.datetime "shipped_at"
    t.integer "order_id"
    t.integer "deprecated_address_id"
    t.string "state"
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.integer "stock_location_id"
    t.decimal "adjustment_total", precision: 10, scale: 2, default: "0.0"
    t.decimal "additional_tax_total", precision: 10, scale: 2, default: "0.0"
    t.decimal "promo_total", precision: 10, scale: 2, default: "0.0"
    t.decimal "included_tax_total", precision: 10, scale: 2, default: "0.0", null: false
    t.string "tracking_lookup"
    t.index ["deprecated_address_id"], name: "index_spree_shipments_on_deprecated_address_id"
    t.index ["number"], name: "index_shipments_on_number"
    t.index ["order_id"], name: "index_spree_shipments_on_order_id"
    t.index ["stock_location_id"], name: "index_spree_shipments_on_stock_location_id"
  end

  create_table "spree_shipping_categories", id: :serial, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
  end

  create_table "spree_shipping_method_categories", id: :serial, force: :cascade do |t|
    t.integer "shipping_method_id", null: false
    t.integer "shipping_category_id", null: false
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.index ["shipping_category_id", "shipping_method_id"], name: "unique_spree_shipping_method_categories", unique: true
    t.index ["shipping_method_id"], name: "index_spree_shipping_method_categories_on_shipping_method_id"
  end

  create_table "spree_shipping_method_stock_locations", id: :serial, force: :cascade do |t|
    t.integer "shipping_method_id"
    t.integer "stock_location_id"
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.index ["shipping_method_id"], name: "shipping_method_id_spree_sm_sl"
    t.index ["stock_location_id"], name: "sstock_location_id_spree_sm_sl"
  end

  create_table "spree_shipping_method_zones", id: :serial, force: :cascade do |t|
    t.integer "shipping_method_id"
    t.integer "zone_id"
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
  end

  create_table "spree_shipping_methods", id: :serial, force: :cascade do |t|
    t.string "name"
    t.datetime "deleted_at"
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.string "tracking_url"
    t.string "admin_name"
    t.integer "tax_category_id"
    t.string "code"
    t.boolean "available_to_all", default: true
    t.string "carrier"
    t.string "service_level"
    t.boolean "available_to_users", default: true
    t.index ["tax_category_id"], name: "index_spree_shipping_methods_on_tax_category_id"
  end

  create_table "spree_shipping_rate_taxes", id: :serial, force: :cascade do |t|
    t.decimal "amount", precision: 8, scale: 2, default: "0.0", null: false
    t.integer "tax_rate_id"
    t.integer "shipping_rate_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["shipping_rate_id"], name: "index_spree_shipping_rate_taxes_on_shipping_rate_id"
    t.index ["tax_rate_id"], name: "index_spree_shipping_rate_taxes_on_tax_rate_id"
  end

  create_table "spree_shipping_rates", id: :serial, force: :cascade do |t|
    t.integer "shipment_id"
    t.integer "shipping_method_id"
    t.boolean "selected", default: false
    t.decimal "cost", precision: 8, scale: 2, default: "0.0"
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.integer "tax_rate_id"
    t.index ["shipment_id", "shipping_method_id"], name: "spree_shipping_rates_join_index", unique: true
  end

  create_table "spree_state_changes", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "previous_state"
    t.integer "stateful_id"
    t.integer "user_id"
    t.string "stateful_type"
    t.string "next_state"
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.index ["stateful_id", "stateful_type"], name: "index_spree_state_changes_on_stateful_id_and_stateful_type"
    t.index ["user_id"], name: "index_spree_state_changes_on_user_id"
  end

  create_table "spree_states", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "abbr"
    t.integer "country_id"
    t.datetime "updated_at", precision: 6
    t.datetime "created_at", precision: 6
    t.index ["country_id"], name: "index_spree_states_on_country_id"
  end

  create_table "spree_stock_items", id: :serial, force: :cascade do |t|
    t.integer "stock_location_id"
    t.integer "variant_id"
    t.integer "count_on_hand", default: 0, null: false
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.boolean "backorderable", default: false
    t.datetime "deleted_at"
    t.integer "max_stock"
    t.index ["deleted_at"], name: "index_spree_stock_items_on_deleted_at"
    t.index ["stock_location_id", "variant_id"], name: "stock_item_by_loc_and_var_id"
    t.index ["stock_location_id"], name: "index_spree_stock_items_on_stock_location_id"
    t.index ["variant_id", "stock_location_id"], name: "index_spree_stock_items_on_variant_id_and_stock_location_id", unique: true, where: "(deleted_at IS NULL)"
  end

  create_table "spree_stock_locations", id: :serial, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.boolean "default", default: false, null: false
    t.string "address1"
    t.string "address2"
    t.string "city"
    t.integer "state_id"
    t.string "state_name"
    t.integer "country_id"
    t.string "zipcode"
    t.string "phone"
    t.boolean "active", default: true
    t.boolean "backorderable_default", default: false
    t.boolean "propagate_all_variants", default: true
    t.string "admin_name"
    t.integer "position", default: 0
    t.boolean "restock_inventory", default: true, null: false
    t.boolean "fulfillable", default: true, null: false
    t.string "code"
    t.boolean "check_stock_on_transfer", default: true
    t.index ["country_id"], name: "index_spree_stock_locations_on_country_id"
    t.index ["state_id"], name: "index_spree_stock_locations_on_state_id"
  end

  create_table "spree_stock_movements", id: :serial, force: :cascade do |t|
    t.integer "stock_item_id"
    t.integer "quantity", default: 0
    t.string "action"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "originator_type"
    t.integer "originator_id"
    t.index ["stock_item_id"], name: "index_spree_stock_movements_on_stock_item_id"
  end

  create_table "spree_stock_updates", force: :cascade do |t|
    t.string "email"
    t.boolean "process", default: false
    t.integer "variant_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "spree_store_credit_categories", id: :serial, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
  end

  create_table "spree_store_credit_events", id: :serial, force: :cascade do |t|
    t.integer "store_credit_id", null: false
    t.string "action", null: false
    t.decimal "amount", precision: 8, scale: 2
    t.decimal "user_total_amount", precision: 8, scale: 2, default: "0.0", null: false
    t.string "authorization_code", null: false
    t.datetime "deleted_at"
    t.string "originator_type"
    t.integer "originator_id"
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.decimal "amount_remaining", precision: 8, scale: 2
    t.integer "store_credit_reason_id"
    t.index ["deleted_at"], name: "index_spree_store_credit_events_on_deleted_at"
    t.index ["store_credit_id"], name: "index_spree_store_credit_events_on_store_credit_id"
  end

  create_table "spree_store_credit_reasons", force: :cascade do |t|
    t.string "name"
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "spree_store_credit_types", id: :serial, force: :cascade do |t|
    t.string "name"
    t.integer "priority"
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.index ["priority"], name: "index_spree_store_credit_types_on_priority"
  end

  create_table "spree_store_credit_winners", force: :cascade do |t|
    t.string "name"
    t.string "phone_number"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "spree_store_credits", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.integer "category_id"
    t.integer "created_by_id"
    t.decimal "amount", precision: 8, scale: 2, default: "0.0", null: false
    t.decimal "amount_used", precision: 8, scale: 2, default: "0.0", null: false
    t.decimal "amount_authorized", precision: 8, scale: 2, default: "0.0", null: false
    t.string "currency"
    t.text "memo"
    t.datetime "deleted_at"
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.integer "type_id"
    t.datetime "invalidated_at"
    t.index ["deleted_at"], name: "index_spree_store_credits_on_deleted_at"
    t.index ["type_id"], name: "index_spree_store_credits_on_type_id"
    t.index ["user_id"], name: "index_spree_store_credits_on_user_id"
  end

  create_table "spree_store_payment_methods", id: :serial, force: :cascade do |t|
    t.integer "store_id", null: false
    t.integer "payment_method_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["payment_method_id"], name: "index_spree_store_payment_methods_on_payment_method_id"
    t.index ["store_id"], name: "index_spree_store_payment_methods_on_store_id"
  end

  create_table "spree_store_shipping_methods", force: :cascade do |t|
    t.bigint "store_id", null: false
    t.bigint "shipping_method_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["shipping_method_id"], name: "index_spree_store_shipping_methods_on_shipping_method_id"
    t.index ["store_id"], name: "index_spree_store_shipping_methods_on_store_id"
  end

  create_table "spree_stores", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "url"
    t.text "meta_description"
    t.text "meta_keywords"
    t.string "seo_title"
    t.string "mail_from_address"
    t.string "default_currency"
    t.string "code"
    t.boolean "default", default: false, null: false
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.string "cart_tax_country_iso"
    t.string "available_locales"
    t.string "bcc_email"
    t.index ["code"], name: "index_spree_stores_on_code"
    t.index ["default"], name: "index_spree_stores_on_default"
  end

  create_table "spree_tax_categories", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.boolean "is_default", default: false
    t.datetime "deleted_at"
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.string "tax_code"
  end

  create_table "spree_tax_cloud_cart_items", id: :serial, force: :cascade do |t|
    t.integer "index"
    t.integer "tic"
    t.string "sku"
    t.integer "quantity"
    t.decimal "price", precision: 8, scale: 2, default: "0.0"
    t.decimal "amount", precision: 13, scale: 5, default: "0.0"
    t.decimal "ship_total", precision: 10, scale: 2, default: "0.0"
    t.integer "line_item_id"
    t.integer "tax_cloud_transaction_id"
    t.string "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["line_item_id"], name: "index_spree_tax_cloud_cart_items_on_line_item_id"
    t.index ["tax_cloud_transaction_id"], name: "index_spree_tax_cloud_cart_items_on_tax_cloud_transaction_id"
  end

  create_table "spree_tax_cloud_transactions", id: :serial, force: :cascade do |t|
    t.integer "order_id"
    t.string "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_spree_tax_cloud_transactions_on_order_id"
  end

  create_table "spree_tax_rate_tax_categories", id: :serial, force: :cascade do |t|
    t.integer "tax_category_id", null: false
    t.integer "tax_rate_id", null: false
    t.index ["tax_category_id"], name: "index_spree_tax_rate_tax_categories_on_tax_category_id"
    t.index ["tax_rate_id"], name: "index_spree_tax_rate_tax_categories_on_tax_rate_id"
  end

  create_table "spree_tax_rates", id: :serial, force: :cascade do |t|
    t.decimal "amount", precision: 8, scale: 5
    t.integer "zone_id"
    t.boolean "included_in_price", default: false
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.string "name"
    t.boolean "show_rate_in_label", default: true
    t.datetime "deleted_at"
    t.datetime "starts_at"
    t.datetime "expires_at"
    t.index ["deleted_at"], name: "index_spree_tax_rates_on_deleted_at"
    t.index ["zone_id"], name: "index_spree_tax_rates_on_zone_id"
  end

  create_table "spree_taxonomies", id: :serial, force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.integer "position", default: 0
    t.boolean "visibility", default: true
    t.index ["position"], name: "index_spree_taxonomies_on_position"
  end

  create_table "spree_taxons", id: :serial, force: :cascade do |t|
    t.integer "parent_id"
    t.integer "position", default: 0
    t.string "name", null: false
    t.string "permalink"
    t.integer "taxonomy_id"
    t.integer "lft"
    t.integer "rgt"
    t.string "icon_file_name"
    t.string "icon_content_type"
    t.integer "icon_file_size"
    t.datetime "icon_updated_at"
    t.text "description"
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.string "meta_title"
    t.string "meta_description"
    t.string "meta_keywords"
    t.integer "depth"
    t.boolean "visibility", default: true
    t.string "large_ads_file_name"
    t.string "large_ads_content_type"
    t.bigint "large_ads_file_size"
    t.datetime "large_ads_updated_at"
    t.string "small_ads_file_name"
    t.string "small_ads_content_type"
    t.bigint "small_ads_file_size"
    t.datetime "small_ads_updated_at"
    t.string "video_link"
    t.datetime "small_ads_end_at"
    t.datetime "large_ads_end_at"
    t.string "annotation"
    t.string "small_ad_link"
    t.string "large_ad_link"
    t.string "small_ad_for_mobile_file_name"
    t.string "small_ad_for_mobile_content_type"
    t.bigint "small_ad_for_mobile_file_size"
    t.datetime "small_ad_for_mobile_updated_at"
    t.string "large_ad_for_mobile_file_name"
    t.string "large_ad_for_mobile_content_type"
    t.bigint "large_ad_for_mobile_file_size"
    t.datetime "large_ad_for_mobile_updated_at"
    t.index ["lft"], name: "index_spree_taxons_on_lft"
    t.index ["parent_id"], name: "index_taxons_on_parent_id"
    t.index ["permalink"], name: "index_taxons_on_permalink"
    t.index ["position"], name: "index_spree_taxons_on_position"
    t.index ["rgt"], name: "index_spree_taxons_on_rgt"
    t.index ["taxonomy_id"], name: "index_taxons_on_taxonomy_id"
  end

  create_table "spree_tracking_lookups", force: :cascade do |t|
    t.string "url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "spree_unit_cancels", id: :serial, force: :cascade do |t|
    t.integer "inventory_unit_id", null: false
    t.string "reason"
    t.string "created_by"
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.index ["inventory_unit_id"], name: "index_spree_unit_cancels_on_inventory_unit_id"
  end

  create_table "spree_user_addresses", id: :serial, force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "address_id", null: false
    t.boolean "default", default: false
    t.boolean "archived", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "default_billing", default: false
    t.index ["address_id"], name: "index_spree_user_addresses_on_address_id"
    t.index ["user_id", "address_id"], name: "index_spree_user_addresses_on_user_id_and_address_id", unique: true
    t.index ["user_id"], name: "index_spree_user_addresses_on_user_id"
  end

  create_table "spree_user_stock_locations", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.integer "stock_location_id"
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.index ["user_id"], name: "index_spree_user_stock_locations_on_user_id"
  end

  create_table "spree_users", id: :serial, force: :cascade do |t|
    t.string "encrypted_password", limit: 128
    t.string "password_salt", limit: 128
    t.string "email"
    t.string "remember_token"
    t.string "persistence_token"
    t.string "reset_password_token"
    t.string "perishable_token"
    t.integer "sign_in_count", default: 0, null: false
    t.integer "failed_attempts", default: 0, null: false
    t.datetime "last_request_at"
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "login"
    t.integer "ship_address_id"
    t.integer "bill_address_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "spree_api_key", limit: 48
    t.string "authentication_token"
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "remember_created_at"
    t.datetime "reset_password_sent_at"
    t.datetime "deleted_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "uid"
    t.string "provider", default: "email"
    t.index ["deleted_at"], name: "index_spree_users_on_deleted_at"
    t.index ["email"], name: "email_idx_unique", unique: true
    t.index ["reset_password_token"], name: "index_spree_users_on_reset_password_token_solidus_auth_devise", unique: true
    t.index ["spree_api_key"], name: "index_spree_users_on_spree_api_key"
  end

  create_table "spree_variant_property_rule_conditions", id: :serial, force: :cascade do |t|
    t.integer "option_value_id"
    t.integer "variant_property_rule_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["variant_property_rule_id", "option_value_id"], name: "index_spree_variant_prop_rule_conditions_on_rule_and_optval"
  end

  create_table "spree_variant_property_rule_values", id: :serial, force: :cascade do |t|
    t.text "value"
    t.integer "position", default: 0
    t.integer "property_id"
    t.integer "variant_property_rule_id"
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.index ["property_id"], name: "index_spree_variant_property_rule_values_on_property_id"
    t.index ["variant_property_rule_id"], name: "index_spree_variant_property_rule_values_on_rule"
  end

  create_table "spree_variant_property_rules", id: :serial, force: :cascade do |t|
    t.integer "product_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "apply_to_all", default: true, null: false
    t.index ["product_id"], name: "index_spree_variant_property_rules_on_product_id"
  end

  create_table "spree_variants", id: :serial, force: :cascade do |t|
    t.string "sku", default: "", null: false
    t.decimal "weight", precision: 8, scale: 2, default: "0.0"
    t.decimal "height", precision: 8, scale: 2
    t.decimal "width", precision: 8, scale: 2
    t.decimal "depth", precision: 8, scale: 2
    t.datetime "deleted_at"
    t.boolean "is_master", default: false
    t.integer "product_id"
    t.decimal "cost_price", precision: 10, scale: 2
    t.integer "position"
    t.string "cost_currency"
    t.boolean "track_inventory", default: true
    t.integer "tax_category_id"
    t.datetime "updated_at", precision: 6
    t.datetime "created_at", precision: 6
    t.boolean "is_dropship", default: false
    t.index ["position"], name: "index_spree_variants_on_position"
    t.index ["product_id"], name: "index_spree_variants_on_product_id"
    t.index ["sku"], name: "index_spree_variants_on_sku"
    t.index ["tax_category_id"], name: "index_spree_variants_on_tax_category_id"
    t.index ["track_inventory"], name: "index_spree_variants_on_track_inventory"
  end

  create_table "spree_variants_volume_price_models", id: :serial, force: :cascade do |t|
    t.integer "volume_price_model_id"
    t.integer "variant_id"
    t.index ["variant_id"], name: "variant_id"
    t.index ["volume_price_model_id"], name: "volume_price_model_id"
  end

  create_table "spree_volume_price_models", id: :serial, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "spree_volume_prices", id: :serial, force: :cascade do |t|
    t.integer "variant_id"
    t.string "name"
    t.string "range"
    t.decimal "amount", precision: 8, scale: 2
    t.integer "position"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "discount_type"
    t.integer "role_id"
    t.integer "volume_price_model_id"
  end

  create_table "spree_wallet_payment_sources", id: :serial, force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "payment_source_type", null: false
    t.integer "payment_source_id", null: false
    t.boolean "default", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id", "payment_source_id", "payment_source_type"], name: "index_spree_wallet_payment_sources_on_source_and_user", unique: true
    t.index ["user_id"], name: "index_spree_wallet_payment_sources_on_user_id"
  end

  create_table "spree_zone_members", id: :serial, force: :cascade do |t|
    t.string "zoneable_type"
    t.integer "zoneable_id"
    t.integer "zone_id"
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.index ["zone_id"], name: "index_spree_zone_members_on_zone_id"
    t.index ["zoneable_id", "zoneable_type"], name: "index_spree_zone_members_on_zoneable_id_and_zoneable_type"
  end

  create_table "spree_zones", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "zone_members_count", default: 0
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "spree_adds_ons_products", "spree_products", column: "add_on_id"
  add_foreign_key "spree_product_groups", "spree_products", column: "group_product_id"
  add_foreign_key "spree_product_groups", "spree_products", column: "product_id"
  add_foreign_key "spree_promotion_code_batches", "spree_promotions", column: "promotion_id"
  add_foreign_key "spree_promotion_codes", "spree_promotion_code_batches", column: "promotion_code_batch_id"
  add_foreign_key "spree_tax_rate_tax_categories", "spree_tax_categories", column: "tax_category_id"
  add_foreign_key "spree_tax_rate_tax_categories", "spree_tax_rates", column: "tax_rate_id"
  add_foreign_key "spree_wallet_payment_sources", "spree_users", column: "user_id"

  create_view "spree_in_stock_available_products", sql_definition: <<-SQL
      SELECT DISTINCT spree_products.id,
      spree_products.name,
      spree_products.description,
      spree_products.available_on,
      spree_products.deleted_at,
      spree_products.slug,
      spree_products.meta_description,
      spree_products.meta_keywords,
      spree_products.tax_category_id,
      spree_products.shipping_category_id,
      spree_products.created_at,
      spree_products.updated_at,
      spree_products.promotionable,
      spree_products.meta_title,
      spree_products.discontinue_on,
      spree_products.avg_rating,
      spree_products.reviews_count,
      spree_products.tax_cloud_tic,
      spree_products.features,
      spree_products."position",
      spree_products.searchable_keywords,
      spree_products.deals_position,
      spree_products.product_type,
      spree_products.google_product_category,
      spree_products.facebook_id,
      spree_products.vendor_id,
      spree_products.is_add_on,
      spree_products.video_title,
      spree_products.video_link,
      spree_products.video_description,
      spree_products.youtube_button_link,
      spree_products.instagram_button_link,
      spree_products.twitter_button_link,
      spree_products.creator_name
     FROM (((spree_products
       JOIN spree_variants ON (((spree_variants.is_master = true) AND (spree_variants.product_id = spree_products.id))))
       JOIN spree_variants variants_including_masters_spree_products_join ON (((variants_including_masters_spree_products_join.deleted_at IS NULL) AND (variants_including_masters_spree_products_join.product_id = spree_products.id))))
       JOIN spree_stock_items ON (((spree_stock_items.deleted_at IS NULL) AND (spree_stock_items.variant_id = variants_including_masters_spree_products_join.id))))
    WHERE ((spree_products.deleted_at IS NULL) AND (spree_products.available_on <= timezone('UTC'::text, now())) AND ((spree_products.discontinue_on IS NULL) OR (spree_products.discontinue_on >= timezone('UTC'::text, now()))) AND (spree_products.product_type <> ALL (ARRAY[1, 2, 3])) AND (spree_stock_items.count_on_hand > 0));
  SQL
  create_view "spree_make_easy_products", sql_definition: <<-SQL
      SELECT spree_products.id,
      spree_products.name,
      spree_products.description,
      spree_products.available_on,
      spree_products.deleted_at,
      spree_products.slug,
      spree_products.meta_description,
      spree_products.meta_keywords,
      spree_products.tax_category_id,
      spree_products.shipping_category_id,
      spree_products.created_at,
      spree_products.updated_at,
      spree_products.promotionable,
      spree_products.meta_title,
      spree_products.discontinue_on,
      spree_products.avg_rating,
      spree_products.reviews_count,
      spree_products.tax_cloud_tic,
      spree_products.features,
      spree_products."position",
      spree_products.searchable_keywords,
      spree_products.deals_position,
      spree_products.product_type,
      spree_products.google_product_category,
      spree_products.facebook_id,
      spree_products.vendor_id,
      spree_products.is_add_on,
      spree_products.video_title,
      spree_products.video_link,
      spree_products.video_description,
      spree_products.youtube_button_link,
      spree_products.instagram_button_link,
      spree_products.twitter_button_link,
      spree_products.creator_name
     FROM ((spree_in_stock_available_backorderable_products spree_products
       JOIN spree_labels_products ON ((spree_labels_products.product_id = spree_products.id)))
       JOIN spree_labels ON ((spree_labels.id = spree_labels_products.label_id)))
    WHERE ((spree_labels.tag)::text = 'Make easy'::text);
  SQL
  create_view "spree_avaliable_products", sql_definition: <<-SQL
      SELECT DISTINCT spree_products.id,
      spree_products.name,
      spree_products.description,
      spree_products.available_on,
      spree_products.deleted_at,
      spree_products.slug,
      spree_products.meta_description,
      spree_products.meta_keywords,
      spree_products.tax_category_id,
      spree_products.shipping_category_id,
      spree_products.created_at,
      spree_products.updated_at,
      spree_products.promotionable,
      spree_products.meta_title,
      spree_products.discontinue_on,
      spree_products.avg_rating,
      spree_products.reviews_count,
      spree_products.tax_cloud_tic,
      spree_products.features,
      spree_products."position",
      spree_products.searchable_keywords,
      spree_products.deals_position,
      spree_products.product_type,
      spree_products.google_product_category,
      spree_products.facebook_id,
      spree_products.vendor_id,
      spree_products.is_add_on,
      spree_products.video_title,
      spree_products.video_link,
      spree_products.video_description,
      spree_products.youtube_button_link,
      spree_products.instagram_button_link,
      spree_products.twitter_button_link,
      spree_products.creator_name
     FROM (((spree_products
       JOIN spree_variants ON (((spree_variants.is_master = true) AND (spree_variants.product_id = spree_products.id))))
       JOIN spree_variants variants_including_masters_spree_products_join ON (((variants_including_masters_spree_products_join.deleted_at IS NULL) AND (variants_including_masters_spree_products_join.product_id = spree_products.id))))
       JOIN spree_stock_items ON (((spree_stock_items.deleted_at IS NULL) AND (spree_stock_items.variant_id = variants_including_masters_spree_products_join.id))))
       WHERE ((spree_products.deleted_at IS NULL) AND (spree_products.available_on <= (now() AT TIME ZONE 'UTC'::text)) AND ((spree_products.discontinue_on IS NULL) OR (spree_products.discontinue_on >= (now() AT TIME ZONE 'UTC'::text))) AND (spree_products.product_type <> ALL (ARRAY[1, 2, 3])));
  SQL
  create_view "spree_chuckwagon_races_products", sql_definition: <<-SQL
      SELECT spree_products.id,
      spree_products.name,
      spree_products.description,
      spree_products.available_on,
      spree_products.deleted_at,
      spree_products.slug,
      spree_products.meta_description,
      spree_products.meta_keywords,
      spree_products.tax_category_id,
      spree_products.shipping_category_id,
      spree_products.created_at,
      spree_products.updated_at,
      spree_products.promotionable,
      spree_products.meta_title,
      spree_products.discontinue_on,
      spree_products.avg_rating,
      spree_products.reviews_count,
      spree_products.tax_cloud_tic,
      spree_products.features,
      spree_products."position",
      spree_products.searchable_keywords,
      spree_products.deals_position,
      spree_products.product_type,
      spree_products.google_product_category,
      spree_products.facebook_id,
      spree_products.vendor_id,
      spree_products.is_add_on,
      spree_products.video_title,
      spree_products.video_link,
      spree_products.video_description,
      spree_products.youtube_button_link,
      spree_products.instagram_button_link,
      spree_products.twitter_button_link,
      spree_products.creator_name
     FROM ((spree_avaliable_products spree_products
       JOIN spree_labels_products ON ((spree_labels_products.product_id = spree_products.id)))
       JOIN spree_labels ON ((spree_labels.id = spree_labels_products.label_id)))
    WHERE ((spree_labels.tag)::text = 'Chuckwagon Races Products'::text)
    ORDER BY spree_labels_products."position";
  SQL
  create_view "spree_chuckwagon_horse_accessories", sql_definition: <<-SQL
      SELECT spree_products.id,
      spree_products.name,
      spree_products.description,
      spree_products.available_on,
      spree_products.deleted_at,
      spree_products.slug,
      spree_products.meta_description,
      spree_products.meta_keywords,
      spree_products.tax_category_id,
      spree_products.shipping_category_id,
      spree_products.created_at,
      spree_products.updated_at,
      spree_products.promotionable,
      spree_products.meta_title,
      spree_products.discontinue_on,
      spree_products.avg_rating,
      spree_products.reviews_count,
      spree_products.tax_cloud_tic,
      spree_products.features,
      spree_products."position",
      spree_products.searchable_keywords,
      spree_products.deals_position,
      spree_products.product_type,
      spree_products.google_product_category,
      spree_products.facebook_id,
      spree_products.vendor_id,
      spree_products.is_add_on,
      spree_products.video_title,
      spree_products.video_link,
      spree_products.video_description,
      spree_products.youtube_button_link,
      spree_products.instagram_button_link,
      spree_products.twitter_button_link,
      spree_products.creator_name
     FROM ((spree_avaliable_products spree_products
       JOIN spree_labels_products ON ((spree_labels_products.product_id = spree_products.id)))
       JOIN spree_labels ON ((spree_labels.id = spree_labels_products.label_id)))
    WHERE ((spree_labels.tag)::text = 'Chuckwagon Horse Accessories'::text)
    ORDER BY spree_labels_products."position";
  SQL
  create_view "spree_upsell_products", sql_definition: <<-SQL
      SELECT spree_products.id,
      spree_products.name,
      spree_products.description,
      spree_products.available_on,
      spree_products.deleted_at,
      spree_products.slug,
      spree_products.meta_description,
      spree_products.meta_keywords,
      spree_products.tax_category_id,
      spree_products.shipping_category_id,
      spree_products.created_at,
      spree_products.updated_at,
      spree_products.promotionable,
      spree_products.meta_title,
      spree_products.discontinue_on,
      spree_products.avg_rating,
      spree_products.reviews_count,
      spree_products.tax_cloud_tic,
      spree_products.features,
      spree_products."position",
      spree_products.searchable_keywords,
      spree_products.deals_position,
      spree_products.product_type,
      spree_products.google_product_category,
      spree_products.facebook_id,
      spree_products.vendor_id,
      spree_products.is_add_on,
      spree_products.video_title,
      spree_products.video_link,
      spree_products.video_description,
      spree_products.youtube_button_link,
      spree_products.instagram_button_link,
      spree_products.twitter_button_link,
      spree_products.creator_name
     FROM ((spree_avaliable_products spree_products
       JOIN spree_labels_products ON ((spree_labels_products.product_id = spree_products.id)))
       JOIN spree_labels ON ((spree_labels.id = spree_labels_products.label_id)))
    WHERE ((spree_labels.tag)::text = 'Upsell Products'::text)
    ORDER BY spree_labels_products."position";
  SQL
  create_view "spree_chuckwagon_outdoor_boards", sql_definition: <<-SQL
      SELECT spree_products.id,
      spree_products.name,
      spree_products.description,
      spree_products.available_on,
      spree_products.deleted_at,
      spree_products.slug,
      spree_products.meta_description,
      spree_products.meta_keywords,
      spree_products.tax_category_id,
      spree_products.shipping_category_id,
      spree_products.created_at,
      spree_products.updated_at,
      spree_products.promotionable,
      spree_products.meta_title,
      spree_products.discontinue_on,
      spree_products.avg_rating,
      spree_products.reviews_count,
      spree_products.tax_cloud_tic,
      spree_products.features,
      spree_products."position",
      spree_products.searchable_keywords,
      spree_products.deals_position,
      spree_products.product_type,
      spree_products.google_product_category,
      spree_products.facebook_id,
      spree_products.vendor_id,
      spree_products.is_add_on,
      spree_products.video_title,
      spree_products.video_link,
      spree_products.video_description,
      spree_products.youtube_button_link,
      spree_products.instagram_button_link,
      spree_products.twitter_button_link,
      spree_products.creator_name
     FROM ((spree_avaliable_products spree_products
       JOIN spree_labels_products ON ((spree_labels_products.product_id = spree_products.id)))
       JOIN spree_labels ON ((spree_labels.id = spree_labels_products.label_id)))
    WHERE ((spree_labels.tag)::text = 'Chuckwagon Outdoor Boards'::text)
    ORDER BY spree_labels_products."position";
  SQL
  create_view "spree_chuckwagon_outdoor_accessories", sql_definition: <<-SQL
      SELECT spree_products.id,
      spree_products.name,
      spree_products.description,
      spree_products.available_on,
      spree_products.deleted_at,
      spree_products.slug,
      spree_products.meta_description,
      spree_products.meta_keywords,
      spree_products.tax_category_id,
      spree_products.shipping_category_id,
      spree_products.created_at,
      spree_products.updated_at,
      spree_products.promotionable,
      spree_products.meta_title,
      spree_products.discontinue_on,
      spree_products.avg_rating,
      spree_products.reviews_count,
      spree_products.tax_cloud_tic,
      spree_products.features,
      spree_products."position",
      spree_products.searchable_keywords,
      spree_products.deals_position,
      spree_products.product_type,
      spree_products.google_product_category,
      spree_products.facebook_id,
      spree_products.vendor_id,
      spree_products.is_add_on,
      spree_products.video_title,
      spree_products.video_link,
      spree_products.video_description,
      spree_products.youtube_button_link,
      spree_products.instagram_button_link,
      spree_products.twitter_button_link,
      spree_products.creator_name
     FROM ((spree_avaliable_products spree_products
       JOIN spree_labels_products ON ((spree_labels_products.product_id = spree_products.id)))
       JOIN spree_labels ON ((spree_labels.id = spree_labels_products.label_id)))
    WHERE ((spree_labels.tag)::text = 'Chuckwagon Outdoor Accessories'::text)
    ORDER BY spree_labels_products."position";
  SQL
  create_view "spree_chuckwagon_summer_deals", sql_definition: <<-SQL
      SELECT spree_products.id,
      spree_products.name,
      spree_products.description,
      spree_products.available_on,
      spree_products.deleted_at,
      spree_products.slug,
      spree_products.meta_description,
      spree_products.meta_keywords,
      spree_products.tax_category_id,
      spree_products.shipping_category_id,
      spree_products.created_at,
      spree_products.updated_at,
      spree_products.promotionable,
      spree_products.meta_title,
      spree_products.discontinue_on,
      spree_products.avg_rating,
      spree_products.reviews_count,
      spree_products.tax_cloud_tic,
      spree_products.features,
      spree_products."position",
      spree_products.searchable_keywords,
      spree_products.deals_position,
      spree_products.product_type,
      spree_products.google_product_category,
      spree_products.facebook_id,
      spree_products.vendor_id,
      spree_products.is_add_on,
      spree_products.video_title,
      spree_products.video_link,
      spree_products.video_description,
      spree_products.youtube_button_link,
      spree_products.instagram_button_link,
      spree_products.twitter_button_link,
      spree_products.creator_name
     FROM ((spree_avaliable_products spree_products
       JOIN spree_labels_products ON ((spree_labels_products.product_id = spree_products.id)))
       JOIN spree_labels ON ((spree_labels.id = spree_labels_products.label_id)))
    WHERE ((spree_labels.tag)::text = 'Chuckwagon Summer Deals'::text)
    ORDER BY spree_labels_products."position";
  SQL
  create_view "spree_chuckwagon_pre_orders", sql_definition: <<-SQL
      SELECT spree_products.id,
      spree_products.name,
      spree_products.description,
      spree_products.available_on,
      spree_products.deleted_at,
      spree_products.slug,
      spree_products.meta_description,
      spree_products.meta_keywords,
      spree_products.tax_category_id,
      spree_products.shipping_category_id,
      spree_products.created_at,
      spree_products.updated_at,
      spree_products.promotionable,
      spree_products.meta_title,
      spree_products.discontinue_on,
      spree_products.avg_rating,
      spree_products.reviews_count,
      spree_products.tax_cloud_tic,
      spree_products.features,
      spree_products."position",
      spree_products.searchable_keywords,
      spree_products.deals_position,
      spree_products.product_type,
      spree_products.google_product_category,
      spree_products.facebook_id,
      spree_products.vendor_id,
      spree_products.is_add_on,
      spree_products.video_title,
      spree_products.video_link,
      spree_products.video_description,
      spree_products.youtube_button_link,
      spree_products.instagram_button_link,
      spree_products.twitter_button_link,
      spree_products.creator_name
     FROM ((spree_avaliable_products spree_products
       JOIN spree_labels_products ON ((spree_labels_products.product_id = spree_products.id)))
       JOIN spree_labels ON ((spree_labels.id = spree_labels_products.label_id)))
    WHERE ((spree_labels.tag)::text = 'Chuckwagon Pre Order'::text)
    ORDER BY spree_labels_products."position";
  SQL
  create_view "spree_taxon_with_on_sale_products", sql_definition: <<-SQL
      SELECT DISTINCT spree_taxons.id,
      spree_taxons.parent_id,
      spree_taxons."position",
      spree_taxons.name,
      spree_taxons.permalink,
      spree_taxons.taxonomy_id,
      spree_taxons.lft,
      spree_taxons.rgt,
      spree_taxons.icon_file_name,
      spree_taxons.icon_content_type,
      spree_taxons.icon_file_size,
      spree_taxons.icon_updated_at,
      spree_taxons.description,
      spree_taxons.created_at,
      spree_taxons.updated_at,
      spree_taxons.meta_title,
      spree_taxons.meta_description,
      spree_taxons.meta_keywords,
      spree_taxons.depth,
      spree_taxons.visibility,
      spree_taxons.small_ads_file_name,
      spree_taxons.small_ads_content_type,
      spree_taxons.small_ads_file_size,
      spree_taxons.small_ads_updated_at,
      spree_taxons.large_ads_file_name,
      spree_taxons.large_ads_content_type,
      spree_taxons.large_ads_file_size,
      spree_taxons.large_ads_updated_at,
      spree_taxons.video_link,
      spree_taxons.small_ads_end_at,
      spree_taxons.large_ads_end_at,
      spree_taxons.annotation,
      spree_taxons.small_ad_link,
      spree_taxons.large_ad_link,
      spree_taxons.small_ad_for_mobile_file_name,
      spree_taxons.small_ad_for_mobile_content_type,
      spree_taxons.small_ad_for_mobile_file_size,
      spree_taxons.small_ad_for_mobile_updated_at,
      spree_taxons.large_ad_for_mobile_file_name,
      spree_taxons.large_ad_for_mobile_content_type,
      spree_taxons.large_ad_for_mobile_file_size,
      spree_taxons.large_ad_for_mobile_updated_at
     FROM ((((((spree_taxons
       JOIN spree_products_taxons ON ((spree_taxons.id = spree_products_taxons.taxon_id)))
       JOIN spree_products ON ((spree_products_taxons.product_id = spree_products.id)))
       JOIN spree_variants ON (((spree_variants.is_master = true) AND (spree_variants.product_id = spree_products.id))))
       JOIN spree_variants variants_including_masters_spree_products_join ON (((variants_including_masters_spree_products_join.deleted_at IS NULL) AND (variants_including_masters_spree_products_join.product_id = spree_products.id))))
       JOIN spree_prices ON (((spree_prices.deleted_at IS NULL) AND (spree_prices.variant_id = variants_including_masters_spree_products_join.id))))
       JOIN spree_sale_prices ON (((spree_sale_prices.deleted_at IS NULL) AND (spree_sale_prices.price_id = spree_prices.id))))
    WHERE ((spree_products.deleted_at IS NULL) AND (EXISTS ( SELECT spree_prices_1.id,
              spree_prices_1.variant_id,
              spree_prices_1.amount,
              spree_prices_1.currency,
              spree_prices_1.deleted_at,
              spree_prices_1.created_at,
              spree_prices_1.updated_at,
              spree_prices_1.country_iso
             FROM spree_prices spree_prices_1
            WHERE ((spree_prices_1.deleted_at IS NULL) AND (spree_variants.id = spree_prices_1.variant_id)))) AND (spree_products.available_on <= timezone('utc'::text, now())) AND ((spree_products.discontinue_on IS NULL) OR (spree_products.discontinue_on >= timezone('utc'::text, now()))) AND (spree_sale_prices.enabled = true) AND (((spree_sale_prices.start_at <= timezone('utc'::text, now())) OR (spree_sale_prices.start_at IS NULL)) AND ((spree_sale_prices.end_at >= timezone('utc'::text, now())) OR (spree_sale_prices.end_at IS NULL))))
    ORDER BY spree_taxons.taxonomy_id, spree_taxons.parent_id, spree_taxons.lft;
  SQL
  create_view "spree_on_sale_products", sql_definition: <<-SQL
      SELECT DISTINCT spree_products.id,
      spree_products.name,
      spree_products.description,
      spree_products.available_on,
      spree_products.deleted_at,
      spree_products.slug,
      spree_products.meta_description,
      spree_products.meta_keywords,
      spree_products.tax_category_id,
      spree_products.shipping_category_id,
      spree_products.created_at,
      spree_products.updated_at,
      spree_products.promotionable,
      spree_products.meta_title,
      spree_products.discontinue_on,
      spree_products.avg_rating,
      spree_products.reviews_count,
      spree_products.tax_cloud_tic,
      spree_products.features,
      spree_products."position",
      spree_products.searchable_keywords,
      spree_products.deals_position,
      spree_products.product_type,
      spree_products.google_product_category,
      spree_products.facebook_id,
      spree_products.vendor_id,
      spree_products.is_add_on,
      spree_products.video_title,
      spree_products.video_link,
      spree_products.video_description,
      spree_products.youtube_button_link,
      spree_products.instagram_button_link,
      spree_products.twitter_button_link,
      spree_products.creator_name,
      spree_sale_prices.calculated_price
     FROM ((((spree_products
       JOIN spree_variants ON (((spree_variants.is_master = true) AND (spree_variants.product_id = spree_products.id))))
       JOIN spree_variants variants_including_masters_spree_products_join ON (((variants_including_masters_spree_products_join.deleted_at IS NULL) AND (variants_including_masters_spree_products_join.product_id = spree_products.id))))
       JOIN spree_prices ON (((spree_prices.deleted_at IS NULL) AND (spree_prices.variant_id = variants_including_masters_spree_products_join.id))))
       JOIN spree_sale_prices ON (((spree_sale_prices.deleted_at IS NULL) AND (spree_sale_prices.price_id = spree_prices.id))))
    WHERE ((spree_products.deleted_at IS NULL) AND (EXISTS ( SELECT spree_prices_1.id,
              spree_prices_1.variant_id,
              spree_prices_1.amount,
              spree_prices_1.currency,
              spree_prices_1.deleted_at,
              spree_prices_1.created_at,
              spree_prices_1.updated_at,
              spree_prices_1.country_iso
             FROM spree_prices spree_prices_1
            WHERE ((spree_prices_1.deleted_at IS NULL) AND (spree_variants.id = spree_prices_1.variant_id)))) AND (spree_products.available_on <= timezone('utc'::text, now())) AND ((spree_products.discontinue_on IS NULL) OR (spree_products.discontinue_on >= timezone('utc'::text, now()))) AND (spree_sale_prices.enabled = true) AND (((spree_sale_prices.start_at <= timezone('utc'::text, now())) OR (spree_sale_prices.start_at IS NULL)) AND ((spree_sale_prices.end_at >= timezone('utc'::text, now())) OR (spree_sale_prices.end_at IS NULL))));
  SQL
  create_view "spree_on_sale_products_order_by_best_sellers", sql_definition: <<-SQL
      SELECT spree_on_sale_products.id
     FROM (spree_on_sale_products
       LEFT JOIN ( SELECT spree_on_sale_products_1.id AS p_id,
              sum(spree_line_items.quantity) AS total_qty
             FROM (((spree_on_sale_products spree_on_sale_products_1
               JOIN spree_variants ON ((spree_variants.product_id = spree_on_sale_products_1.id)))
               JOIN spree_line_items ON ((spree_line_items.variant_id = spree_variants.id)))
               JOIN spree_orders ON ((spree_orders.id = spree_line_items.order_id)))
            WHERE ((spree_orders.completed_at IS NOT NULL) AND (spree_on_sale_products_1.product_type <> ALL (ARRAY[1, 2, 3])))
            GROUP BY spree_on_sale_products_1.id) p ON ((spree_on_sale_products.id = p.p_id)))
    ORDER BY p.total_qty;
  SQL
  create_view "spree_on_sale_products_order_by_staff_picks", sql_definition: <<-SQL
      SELECT spree_on_sale_products.id,
      spree_on_sale_products.name,
      spree_on_sale_products.description,
      spree_on_sale_products.available_on,
      spree_on_sale_products.deleted_at,
      spree_on_sale_products.slug,
      spree_on_sale_products.meta_description,
      spree_on_sale_products.meta_keywords,
      spree_on_sale_products.tax_category_id,
      spree_on_sale_products.shipping_category_id,
      spree_on_sale_products.created_at,
      spree_on_sale_products.updated_at,
      spree_on_sale_products.promotionable,
      spree_on_sale_products.meta_title,
      spree_on_sale_products.discontinue_on,
      spree_on_sale_products.avg_rating,
      spree_on_sale_products.reviews_count,
      spree_on_sale_products.tax_cloud_tic,
      spree_on_sale_products.features,
      spree_on_sale_products."position",
      spree_on_sale_products.searchable_keywords,
      spree_on_sale_products.deals_position,
      spree_on_sale_products.product_type,
      spree_on_sale_products.google_product_category,
      spree_on_sale_products.facebook_id,
      spree_on_sale_products.video_title,
      spree_on_sale_products.video_link,
      spree_on_sale_products.video_description,
      spree_on_sale_products.youtube_button_link,
      spree_on_sale_products.instagram_button_link,
      spree_on_sale_products.twitter_button_link,
      spree_on_sale_products.creator_name,
      spree_on_sale_products.vendor_id,
      spree_on_sale_products.is_add_on,
      spree_on_sale_products.leasable,
      spree_on_sale_products.calculated_price
     FROM (( SELECT DISTINCT spree_products.id,
              spree_products.name,
              spree_products.description,
              spree_products.available_on,
              spree_products.deleted_at,
              spree_products.slug,
              spree_products.meta_description,
              spree_products.meta_keywords,
              spree_products.tax_category_id,
              spree_products.shipping_category_id,
              spree_products.created_at,
              spree_products.updated_at,
              spree_products.promotionable,
              spree_products.meta_title,
              spree_products.discontinue_on,
              spree_products.avg_rating,
              spree_products.reviews_count,
              spree_products.tax_cloud_tic,
              spree_products.features,
              spree_products."position",
              spree_products.searchable_keywords,
              spree_products.deals_position,
              spree_products.product_type,
              spree_products.google_product_category,
              spree_products.facebook_id,
              spree_products.video_title,
              spree_products.video_link,
              spree_products.video_description,
              spree_products.youtube_button_link,
              spree_products.instagram_button_link,
              spree_products.twitter_button_link,
              spree_products.creator_name,
              spree_products.vendor_id,
              spree_products.is_add_on,
              spree_products.leasable,
              spree_sale_prices.calculated_price
             FROM ((((spree_products
               JOIN spree_variants ON (((spree_variants.is_master = true) AND (spree_variants.product_id = spree_products.id))))
               JOIN spree_variants variants_including_masters_spree_products_join ON (((variants_including_masters_spree_products_join.deleted_at IS NULL) AND (variants_including_masters_spree_products_join.product_id = spree_products.id))))
               JOIN spree_prices ON (((spree_prices.deleted_at IS NULL) AND (spree_prices.variant_id = variants_including_masters_spree_products_join.id))))
               JOIN spree_sale_prices ON (((spree_sale_prices.deleted_at IS NULL) AND (spree_sale_prices.price_id = spree_prices.id))))
            WHERE ((spree_products.deleted_at IS NULL) AND (EXISTS ( SELECT spree_prices_1.id,
                      spree_prices_1.variant_id,
                      spree_prices_1.amount,
                      spree_prices_1.currency,
                      spree_prices_1.deleted_at,
                      spree_prices_1.created_at,
                      spree_prices_1.updated_at,
                      spree_prices_1.country_iso
                     FROM spree_prices spree_prices_1
                    WHERE ((spree_prices_1.deleted_at IS NULL) AND (spree_variants.id = spree_prices_1.variant_id)))) AND (spree_products.available_on <= (now() AT TIME ZONE 'utc'::text)) AND ((spree_products.discontinue_on IS NULL) OR (spree_products.discontinue_on >= (now() AT TIME ZONE 'utc'::text))) AND (spree_sale_prices.enabled = true) AND (((spree_sale_prices.start_at <= (now() AT TIME ZONE 'utc'::text)) OR (spree_sale_prices.start_at IS NULL)) AND ((spree_sale_prices.end_at >= (now() AT TIME ZONE 'utc'::text)) OR (spree_sale_prices.end_at IS NULL))))) spree_on_sale_products
       LEFT JOIN ( SELECT spree_on_sale_products_1.id,
              spree_labels_products."position" AS staff_pick_position
             FROM ((spree_on_sale_products spree_on_sale_products_1
               LEFT JOIN spree_labels_products ON ((spree_labels_products.product_id = spree_on_sale_products_1.id)))
               LEFT JOIN spree_labels ON ((spree_labels.id = spree_labels_products.label_id)))
            WHERE ((spree_labels.tag)::text = 'Staff Pick'::text)
            ORDER BY spree_labels_products."position") p ON ((spree_on_sale_products.id = p.id)))
    ORDER BY p.staff_pick_position, p.id;
  SQL
  create_view "spree_available_gift_products", sql_definition: <<-SQL
      SELECT spree_avaliable_products.id,
      spree_avaliable_products.name,
      spree_avaliable_products.description,
      spree_avaliable_products.available_on,
      spree_avaliable_products.deleted_at,
      spree_avaliable_products.slug,
      spree_avaliable_products.meta_description,
      spree_avaliable_products.meta_keywords,
      spree_avaliable_products.tax_category_id,
      spree_avaliable_products.shipping_category_id,
      spree_avaliable_products.created_at,
      spree_avaliable_products.updated_at,
      spree_avaliable_products.promotionable,
      spree_avaliable_products.meta_title,
      spree_avaliable_products.discontinue_on,
      spree_avaliable_products.avg_rating,
      spree_avaliable_products.reviews_count,
      spree_avaliable_products.tax_cloud_tic,
      spree_avaliable_products.features,
      spree_avaliable_products."position",
      spree_avaliable_products.searchable_keywords,
      spree_avaliable_products.deals_position,
      spree_avaliable_products.product_type,
      spree_avaliable_products.google_product_category,
      spree_avaliable_products.facebook_id,
      spree_avaliable_products.video_title,
      spree_avaliable_products.video_link,
      spree_avaliable_products.video_description,
      spree_avaliable_products.youtube_button_link,
      spree_avaliable_products.instagram_button_link,
      spree_avaliable_products.twitter_button_link,
      spree_avaliable_products.creator_name
     FROM ((spree_avaliable_products
       LEFT JOIN spree_labels_products ON ((spree_labels_products.product_id = spree_avaliable_products.id)))
       LEFT JOIN spree_labels ON ((spree_labels.id = spree_labels_products.label_id)))
    WHERE ((spree_labels.tag)::text = 'Gift Products'::text)
    ORDER BY spree_labels_products."position";
  SQL
  create_view "spree_products_sort_by_staff_picks", sql_definition: <<-SQL
      SELECT spree_products.id
     FROM (spree_products
       LEFT JOIN ( SELECT spree_products_1.id,
              spree_labels_products."position" AS staff_pick_position
             FROM ((spree_products spree_products_1
               LEFT JOIN spree_labels_products ON ((spree_labels_products.product_id = spree_products_1.id)))
               LEFT JOIN spree_labels ON ((spree_labels.id = spree_labels_products.label_id)))
            WHERE ((spree_labels.tag)::text = 'Staff Pick'::text)
            ORDER BY spree_labels_products."position") p ON ((spree_products.id = p.id)))
    ORDER BY p.staff_pick_position, p.id;
  SQL
  create_view "spree_in_stock_available_backorderable_products", sql_definition: <<-SQL
      SELECT DISTINCT spree_products.id,
      spree_products.name,
      spree_products.description,
      spree_products.available_on,
      spree_products.deleted_at,
      spree_products.slug,
      spree_products.meta_description,
      spree_products.meta_keywords,
      spree_products.tax_category_id,
      spree_products.shipping_category_id,
      spree_products.created_at,
      spree_products.updated_at,
      spree_products.promotionable,
      spree_products.meta_title,
      spree_products.discontinue_on,
      spree_products.avg_rating,
      spree_products.reviews_count,
      spree_products.tax_cloud_tic,
      spree_products.features,
      spree_products."position",
      spree_products.searchable_keywords,
      spree_products.deals_position,
      spree_products.product_type,
      spree_products.google_product_category,
      spree_products.facebook_id,
      spree_products.vendor_id,
      spree_products.is_add_on,
      spree_products.video_title,
      spree_products.video_link,
      spree_products.video_description,
      spree_products.youtube_button_link,
      spree_products.instagram_button_link,
      spree_products.twitter_button_link,
      spree_products.creator_name,
      spree_products.leasable
     FROM (((spree_products
       JOIN spree_variants ON (((spree_variants.is_master = true) AND (spree_variants.product_id = spree_products.id))))
       JOIN spree_variants variants_including_masters_spree_products_join ON (((variants_including_masters_spree_products_join.deleted_at IS NULL) AND (variants_including_masters_spree_products_join.product_id = spree_products.id))))
       JOIN spree_stock_items ON (((spree_stock_items.deleted_at IS NULL) AND (spree_stock_items.variant_id = variants_including_masters_spree_products_join.id))))
    WHERE ((spree_products.deleted_at IS NULL) AND (spree_products.available_on <= timezone('UTC'::text, now())) AND ((spree_products.discontinue_on IS NULL) OR (spree_products.discontinue_on >= timezone('UTC'::text, now()))) AND (spree_products.product_type <> ALL (ARRAY[1, 2, 3])) AND ((spree_stock_items.backorderable = true) OR (spree_stock_items.count_on_hand > 0)));
  SQL
  create_view "spree_featured_products", sql_definition: <<-SQL
      SELECT spree_products.id,
      spree_products.name,
      spree_products.description,
      spree_products.available_on,
      spree_products.deleted_at,
      spree_products.slug,
      spree_products.meta_description,
      spree_products.meta_keywords,
      spree_products.tax_category_id,
      spree_products.shipping_category_id,
      spree_products.created_at,
      spree_products.updated_at,
      spree_products.promotionable,
      spree_products.meta_title,
      spree_products.discontinue_on,
      spree_products.avg_rating,
      spree_products.reviews_count,
      spree_products.tax_cloud_tic,
      spree_products.features,
      spree_products."position",
      spree_products.searchable_keywords,
      spree_products.deals_position,
      spree_products.product_type,
      spree_products.google_product_category,
      spree_products.facebook_id,
      spree_products.vendor_id,
      spree_products.is_add_on,
      spree_products.video_title,
      spree_products.video_link,
      spree_products.video_description,
      spree_products.youtube_button_link,
      spree_products.instagram_button_link,
      spree_products.twitter_button_link,
      spree_products.creator_name
     FROM ((spree_in_stock_available_backorderable_products spree_products
       JOIN spree_labels_products ON ((spree_labels_products.product_id = spree_products.id)))
       JOIN spree_labels ON ((spree_labels.id = spree_labels_products.label_id)))
    WHERE ((spree_labels.tag)::text = 'Featured Products'::text)
    ORDER BY spree_labels_products."position";
  SQL
  create_view "spree_site_wide_deals", sql_definition: <<-SQL
      SELECT spree_products.id,
      spree_products.name,
      spree_products.description,
      spree_products.available_on,
      spree_products.deleted_at,
      spree_products.slug,
      spree_products.meta_description,
      spree_products.meta_keywords,
      spree_products.tax_category_id,
      spree_products.shipping_category_id,
      spree_products.created_at,
      spree_products.updated_at,
      spree_products.promotionable,
      spree_products.meta_title,
      spree_products.discontinue_on,
      spree_products.avg_rating,
      spree_products.reviews_count,
      spree_products.tax_cloud_tic,
      spree_products.features,
      spree_products."position",
      spree_products.searchable_keywords,
      spree_products.deals_position,
      spree_products.product_type,
      spree_products.google_product_category,
      spree_products.facebook_id,
      spree_products.vendor_id,
      spree_products.is_add_on,
      spree_products.video_title,
      spree_products.video_link,
      spree_products.video_description,
      spree_products.youtube_button_link,
      spree_products.instagram_button_link,
      spree_products.twitter_button_link,
      spree_products.creator_name
     FROM ((spree_in_stock_available_backorderable_products spree_products
       JOIN spree_labels_products ON ((spree_labels_products.product_id = spree_products.id)))
       JOIN spree_labels ON ((spree_labels.id = spree_labels_products.label_id)))
    WHERE ((spree_labels.tag)::text = 'Site Wide Deals'::text)
    ORDER BY spree_labels_products."position";
  SQL
  create_view "spree_start_young_products", sql_definition: <<-SQL
      SELECT spree_products.id,
      spree_products.name,
      spree_products.description,
      spree_products.available_on,
      spree_products.deleted_at,
      spree_products.slug,
      spree_products.meta_description,
      spree_products.meta_keywords,
      spree_products.tax_category_id,
      spree_products.shipping_category_id,
      spree_products.created_at,
      spree_products.updated_at,
      spree_products.promotionable,
      spree_products.meta_title,
      spree_products.discontinue_on,
      spree_products.avg_rating,
      spree_products.reviews_count,
      spree_products.tax_cloud_tic,
      spree_products.features,
      spree_products."position",
      spree_products.searchable_keywords,
      spree_products.deals_position,
      spree_products.product_type,
      spree_products.google_product_category,
      spree_products.facebook_id,
      spree_products.vendor_id,
      spree_products.is_add_on,
      spree_products.video_title,
      spree_products.video_link,
      spree_products.video_description,
      spree_products.youtube_button_link,
      spree_products.instagram_button_link,
      spree_products.twitter_button_link,
      spree_products.creator_name
     FROM ((spree_in_stock_available_backorderable_products spree_products
       JOIN spree_labels_products ON ((spree_labels_products.product_id = spree_products.id)))
       JOIN spree_labels ON ((spree_labels.id = spree_labels_products.label_id)))
    WHERE ((spree_labels.tag)::text = 'Start young'::text)
    ORDER BY spree_labels_products."position";
  SQL
  create_view "spree_best_sellers_frequencies", sql_definition: <<-SQL
      WITH ranked_products AS (
           SELECT spree_products.id,
              spree_taxons.id AS taxon_id,
              count(spree_orders.id) AS orders_count,
              rank() OVER (PARTITION BY spree_taxons.taxonomy_id ORDER BY (count(spree_orders.id)) DESC) AS rank
             FROM (((((spree_products
               JOIN spree_variants ON (((spree_variants.deleted_at IS NULL) AND (spree_variants.product_id = spree_products.id))))
               JOIN spree_line_items ON ((spree_line_items.variant_id = spree_variants.id)))
               JOIN spree_orders ON ((spree_orders.id = spree_line_items.order_id)))
               JOIN spree_products_taxons ON ((spree_products_taxons.product_id = spree_products.id)))
               JOIN spree_taxons ON ((spree_taxons.id = spree_products_taxons.taxon_id)))
            WHERE ((spree_products.deleted_at IS NULL) AND ((spree_orders.completed_at IS NOT NULL) AND (spree_products.product_type <> ALL (ARRAY[1, 2, 3]))))
            GROUP BY spree_products.id, spree_taxons.id
          )
   SELECT ranked_products.id,
      ranked_products.taxon_id,
      ranked_products.orders_count
     FROM ranked_products
    WHERE (ranked_products.rank <= 5)
    ORDER BY ranked_products.orders_count DESC
   LIMIT 50;
  SQL
  create_view "spree_ffa_products", sql_definition: <<-SQL
      SELECT spree_products.id,
      spree_products.name,
      spree_products.description,
      spree_products.available_on,
      spree_products.deleted_at,
      spree_products.slug,
      spree_products.meta_description,
      spree_products.meta_keywords,
      spree_products.tax_category_id,
      spree_products.shipping_category_id,
      spree_products.created_at,
      spree_products.updated_at,
      spree_products.promotionable,
      spree_products.meta_title,
      spree_products.discontinue_on,
      spree_products.avg_rating,
      spree_products.reviews_count,
      spree_products.tax_cloud_tic,
      spree_products.features,
      spree_products."position",
      spree_products.searchable_keywords,
      spree_products.deals_position,
      spree_products.product_type,
      spree_products.google_product_category,
      spree_products.facebook_id,
      spree_products.video_title,
      spree_products.video_link,
      spree_products.video_description,
      spree_products.youtube_button_link,
      spree_products.instagram_button_link,
      spree_products.twitter_button_link,
      spree_products.creator_name
     FROM ((spree_in_stock_available_backorderable_products spree_products
       JOIN spree_labels_products ON ((spree_labels_products.product_id = spree_products.id)))
       JOIN spree_labels ON ((spree_labels.id = spree_labels_products.label_id)))
    WHERE ((spree_labels.tag)::text = 'FFA'::text)
    ORDER BY spree_labels_products."position";
  SQL
  create_view "spree_net_wrap_products", sql_definition: <<-SQL
      SELECT spree_products.id,
      spree_products.name,
      spree_products.description,
      spree_products.available_on,
      spree_products.deleted_at,
      spree_products.slug,
      spree_products.meta_description,
      spree_products.meta_keywords,
      spree_products.tax_category_id,
      spree_products.shipping_category_id,
      spree_products.created_at,
      spree_products.updated_at,
      spree_products.promotionable,
      spree_products.meta_title,
      spree_products.discontinue_on,
      spree_products.avg_rating,
      spree_products.reviews_count,
      spree_products.tax_cloud_tic,
      spree_products.features,
      spree_products."position",
      spree_products.searchable_keywords,
      spree_products.deals_position,
      spree_products.product_type,
      spree_products.google_product_category,
      spree_products.facebook_id,
      spree_products.video_title,
      spree_products.video_link,
      spree_products.video_description,
      spree_products.youtube_button_link,
      spree_products.instagram_button_link,
      spree_products.twitter_button_link,
      spree_products.creator_name
     FROM ((spree_in_stock_available_products spree_products
       JOIN spree_labels_products ON ((spree_labels_products.product_id = spree_products.id)))
       JOIN spree_labels ON ((spree_labels.id = spree_labels_products.label_id)))
    WHERE ((spree_labels.tag)::text = 'Net Wraps'::text)
    ORDER BY spree_products."position";
  SQL
  create_view "spree_flag_products", sql_definition: <<-SQL
      SELECT spree_products.id,
      spree_products.name,
      spree_products.description,
      spree_products.available_on,
      spree_products.deleted_at,
      spree_products.slug,
      spree_products.meta_description,
      spree_products.meta_keywords,
      spree_products.tax_category_id,
      spree_products.shipping_category_id,
      spree_products.created_at,
      spree_products.updated_at,
      spree_products.promotionable,
      spree_products.meta_title,
      spree_products.discontinue_on,
      spree_products.avg_rating,
      spree_products.reviews_count,
      spree_products.tax_cloud_tic,
      spree_products.features,
      spree_products."position",
      spree_products.searchable_keywords,
      spree_products.deals_position,
      spree_products.product_type,
      spree_products.google_product_category,
      spree_products.facebook_id,
      spree_products.video_title,
      spree_products.video_link,
      spree_products.video_description,
      spree_products.youtube_button_link,
      spree_products.instagram_button_link,
      spree_products.twitter_button_link,
      spree_products.creator_name,
      spree_labels.tag
     FROM ((spree_in_stock_available_backorderable_products spree_products
       JOIN spree_labels_products ON ((spree_labels_products.product_id = spree_products.id)))
       JOIN spree_labels ON ((spree_labels.id = spree_labels_products.label_id)))
    WHERE ((spree_labels.tag)::text = ANY ((ARRAY['Briddon USA Flag Products'::character varying, 'Ariat Flag Products'::character varying, 'Allied Flag Products'::character varying, 'Accessories Flag Products'::character varying])::text[]))
    ORDER BY
          CASE spree_labels.tag
              WHEN 'Briddon USA Flag Products'::text THEN 1
              WHEN 'Ariat Flag Products'::text THEN 2
              WHEN 'Allied Flag Products'::text THEN 3
              WHEN 'Accessories Flag Products'::text THEN 4
              ELSE NULL::integer
          END, spree_labels_products."position";
  SQL
  create_view "spree_best_seller_products", sql_definition: <<-SQL
      SELECT spree_products.id,
      spree_products.name,
      spree_products.description,
      spree_products.available_on,
      spree_products.deleted_at,
      spree_products.slug,
      spree_products.meta_description,
      spree_products.meta_keywords,
      spree_products.tax_category_id,
      spree_products.shipping_category_id,
      spree_products.created_at,
      spree_products.updated_at,
      spree_products.promotionable,
      spree_products.meta_title,
      spree_products.discontinue_on,
      spree_products.avg_rating,
      spree_products.reviews_count,
      spree_products.tax_cloud_tic,
      spree_products.features,
      spree_products."position",
      spree_products.searchable_keywords,
      spree_products.deals_position,
      spree_products.product_type,
      spree_products.google_product_category,
      spree_products.facebook_id,
      spree_products.video_title,
      spree_products.video_link,
      spree_products.video_description,
      spree_products.youtube_button_link,
      spree_products.instagram_button_link,
      spree_products.twitter_button_link,
      spree_products.creator_name
     FROM ((spree_in_stock_available_backorderable_products spree_products
       JOIN spree_labels_products ON ((spree_labels_products.product_id = spree_products.id)))
       JOIN spree_labels ON ((spree_labels.id = spree_labels_products.label_id)))
    WHERE ((spree_labels.tag)::text = 'Best Seller Products'::text)
    ORDER BY spree_labels_products."position";
  SQL
end

# touched on 2025-07-09T18:20:59.578136Z
# touched on 2025-07-09T20:31:47.221701Z
# touched on 2025-07-09T20:33:33.009578Z
# touched on 2025-07-09T20:55:49.458646Z