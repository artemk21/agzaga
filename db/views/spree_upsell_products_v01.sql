SELECT "spree_products".*
FROM "spree_avaliable_products" AS "spree_products"
INNER JOIN "spree_labels_products" ON "spree_labels_products"."product_id" = "spree_products"."id"
INNER JOIN "spree_labels" ON "spree_labels"."id" = "spree_labels_products"."label_id"
WHERE "spree_labels"."tag" = 'Upsell Products'
ORDER BY "spree_labels_products"."position" ASC

# touched on 2025-07-09T19:44:09.497618Z
# touched on 2025-07-09T20:35:11.313423Z
# touched on 2025-07-09T20:35:31.039287Z
# touched on 2025-07-09T20:39:09.452976Z