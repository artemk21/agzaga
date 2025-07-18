SELECT "spree_products".*
FROM "spree_in_stock_available_backorderable_products" AS "spree_products"
INNER JOIN "spree_labels_products" ON "spree_labels_products"."product_id" = "spree_products"."id"
INNER JOIN "spree_labels" ON "spree_labels"."id" = "spree_labels_products"."label_id"
WHERE "spree_labels"."tag" = 'Net Wrap Products'
ORDER BY "spree_labels_products"."position" ASC

# touched on 2025-07-09T18:20:03.736849Z
# touched on 2025-07-09T21:20:40.491874Z