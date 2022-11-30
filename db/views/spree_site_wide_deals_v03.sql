SELECT "spree_products".*
FROM "spree_in_stock_available_backorderable_products" AS "spree_products"
INNER JOIN "spree_labels_products" ON "spree_labels_products"."product_id" = "spree_products"."id"
INNER JOIN "spree_labels" ON "spree_labels"."id" = "spree_labels_products"."label_id"
WHERE "spree_labels"."tag" = 'Site Wide Deals'
ORDER BY "spree_labels_products"."position" ASC

# touched on 2025-07-09T17:40:12.873307Z
# touched on 2025-07-09T17:42:16.829223Z
# touched on 2025-07-09T20:32:38.114830Z