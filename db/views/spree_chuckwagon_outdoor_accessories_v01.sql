SELECT "spree_products".*
FROM "spree_avaliable_products" AS "spree_products"
INNER JOIN "spree_labels_products" ON "spree_labels_products"."product_id" = "spree_products"."id"
INNER JOIN "spree_labels" ON "spree_labels"."id" = "spree_labels_products"."label_id"
WHERE "spree_labels"."tag" = 'Chuckwagon Outdoor Accessories'
ORDER BY "spree_labels_products"."position" ASC

# touched on 2025-07-09T17:38:11.078600Z
# touched on 2025-07-09T18:15:23.804352Z
# touched on 2025-07-09T20:33:36.354567Z
# touched on 2025-07-09T20:59:53.353376Z
# touched on 2025-07-09T21:23:48.598517Z