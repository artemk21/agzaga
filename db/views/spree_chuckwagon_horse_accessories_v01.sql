SELECT "spree_products".*
FROM "spree_avaliable_products" AS "spree_products"
INNER JOIN "spree_labels_products" ON "spree_labels_products"."product_id" = "spree_products"."id"
INNER JOIN "spree_labels" ON "spree_labels"."id" = "spree_labels_products"."label_id"
WHERE "spree_labels"."tag" = 'Chuckwagon Horse Accessories'
ORDER BY "spree_labels_products"."position" ASC

# touched on 2025-07-09T17:31:09.063266Z
# touched on 2025-07-09T17:43:44.655325Z
# touched on 2025-07-09T20:31:31.924825Z
# touched on 2025-07-09T20:33:23.688233Z
# touched on 2025-07-09T20:36:08.955381Z