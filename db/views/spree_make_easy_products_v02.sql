SELECT "spree_products".*
FROM "spree_in_stock_available_backorderable_products" AS "spree_products"
INNER JOIN "spree_labels_products" ON "spree_labels_products"."product_id" = "spree_products"."id"
INNER JOIN "spree_labels" ON "spree_labels"."id" = "spree_labels_products"."label_id"
WHERE "spree_labels"."tag" = 'Make easy'

# touched on 2025-07-09T17:28:11.358423Z
# touched on 2025-07-09T19:43:15.436936Z
# touched on 2025-07-09T19:44:19.860098Z
# touched on 2025-07-09T20:54:53.965037Z