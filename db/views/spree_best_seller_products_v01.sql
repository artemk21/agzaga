SELECT "spree_products".*
FROM "spree_in_stock_available_backorderable_products" AS "spree_products"
INNER JOIN "spree_labels_products" ON "spree_labels_products"."product_id" = "spree_products"."id"
INNER JOIN "spree_labels" ON "spree_labels"."id" = "spree_labels_products"."label_id"
WHERE "spree_labels"."tag" = 'Best Seller Products'
ORDER BY "spree_labels_products"."position" ASC

# touched on 2025-07-09T17:44:01.774293Z
# touched on 2025-07-09T19:45:29.203437Z
# touched on 2025-07-09T19:46:04.802237Z
# touched on 2025-07-09T19:46:16.313283Z