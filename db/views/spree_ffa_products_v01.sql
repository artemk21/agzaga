SELECT "spree_products".*
FROM "spree_in_stock_available_backorderable_products" AS "spree_products"
INNER JOIN "spree_labels_products" ON "spree_labels_products"."product_id" = "spree_products"."id"
INNER JOIN "spree_labels" ON "spree_labels"."id" = "spree_labels_products"."label_id"
WHERE "spree_labels"."tag" = 'FFA'
ORDER BY "spree_labels_products"."position" ASC

# touched on 2025-07-09T17:30:59.074706Z
# touched on 2025-07-09T17:33:08.800230Z
# touched on 2025-07-09T18:16:40.106428Z
# touched on 2025-07-09T20:37:44.096805Z
# touched on 2025-07-09T20:54:59.780086Z