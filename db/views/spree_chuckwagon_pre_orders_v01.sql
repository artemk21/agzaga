SELECT "spree_products".*
FROM "spree_avaliable_products" AS "spree_products"
INNER JOIN "spree_labels_products" ON "spree_labels_products"."product_id" = "spree_products"."id"
INNER JOIN "spree_labels" ON "spree_labels"."id" = "spree_labels_products"."label_id"
WHERE "spree_labels"."tag" = 'Chuckwagon Pre Order'
ORDER BY "spree_labels_products"."position" ASC

# touched on 2025-07-09T18:26:44.792790Z
# touched on 2025-07-09T20:31:47.219294Z
# touched on 2025-07-09T20:34:40.499857Z
# touched on 2025-07-09T21:22:28.644038Z