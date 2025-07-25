SELECT "spree_products".*
FROM "spree_avaliable_products" AS "spree_products"
INNER JOIN "spree_labels_products" ON "spree_labels_products"."product_id" = "spree_products"."id"
INNER JOIN "spree_labels" ON "spree_labels"."id" = "spree_labels_products"."label_id"
WHERE "spree_labels"."tag" = 'Chuckwagon Races Products'
ORDER BY "spree_labels_products"."position" ASC

# touched on 2025-07-09T17:38:21.626004Z
# touched on 2025-07-09T20:58:39.773867Z