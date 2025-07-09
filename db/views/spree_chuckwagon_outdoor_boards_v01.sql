SELECT "spree_products".*
FROM "spree_avaliable_products" AS "spree_products"
INNER JOIN "spree_labels_products" ON "spree_labels_products"."product_id" = "spree_products"."id"
INNER JOIN "spree_labels" ON "spree_labels"."id" = "spree_labels_products"."label_id"
WHERE "spree_labels"."tag" = 'Chuckwagon Outdoor Boards'
ORDER BY "spree_labels_products"."position" ASC

# touched on 2025-07-09T17:35:42.122723Z
# touched on 2025-07-09T18:20:03.734871Z
# touched on 2025-07-09T19:40:07.129875Z
# touched on 2025-07-09T20:34:47.609064Z