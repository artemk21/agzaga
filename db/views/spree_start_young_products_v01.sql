SELECT "spree_products".*
FROM "spree_in_stock_available_products" AS "spree_products"
INNER JOIN "spree_labels_products" ON "spree_labels_products"."product_id" = "spree_products"."id"
INNER JOIN "spree_labels" ON "spree_labels"."id" = "spree_labels_products"."label_id"
WHERE "spree_labels"."tag" = 'Start young'

# touched on 2025-07-09T17:32:16.138088Z
# touched on 2025-07-09T18:23:47.401446Z
# touched on 2025-07-09T20:40:46.834219Z