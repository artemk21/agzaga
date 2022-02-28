SELECT "spree_products".*
FROM "spree_in_stock_available_products" AS "spree_products"
INNER JOIN "spree_labels_products" ON "spree_labels_products"."product_id" = "spree_products"."id"
INNER JOIN "spree_labels" ON "spree_labels"."id" = "spree_labels_products"."label_id"
WHERE "spree_labels"."tag" = 'Make easy'

# touched on 2025-07-09T18:16:26.583602Z
# touched on 2025-07-09T18:21:22.411730Z
# touched on 2025-07-09T19:39:23.969387Z