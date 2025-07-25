SELECT "spree_products".*
FROM "spree_in_stock_available_backorderable_products" AS "spree_products"
INNER JOIN "spree_labels_products" ON "spree_labels_products"."product_id" = "spree_products"."id"
INNER JOIN "spree_labels" ON "spree_labels"."id" = "spree_labels_products"."label_id"
WHERE "spree_labels"."tag" = 'Featured Products'
ORDER BY "spree_labels_products"."position" ASC

# touched on 2025-07-09T18:25:53.810381Z
# touched on 2025-07-09T19:46:12.451620Z
# touched on 2025-07-09T20:31:31.924393Z
# touched on 2025-07-09T20:39:04.709346Z
# touched on 2025-07-09T20:52:20.821589Z