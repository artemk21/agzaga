SELECT "spree_products".*
FROM "spree_avaliable_products" AS "spree_products"
INNER JOIN "spree_labels_products" ON "spree_labels_products"."product_id" = "spree_products"."id"
INNER JOIN "spree_labels" ON "spree_labels"."id" = "spree_labels_products"."label_id"
WHERE "spree_labels"."tag" = 'Chuckwagon Summer Deals'
ORDER BY "spree_labels_products"."position" ASC

# touched on 2025-07-09T17:33:17.978730Z
# touched on 2025-07-09T17:39:29.844067Z
# touched on 2025-07-09T18:28:18.582341Z
# touched on 2025-07-09T21:23:35.783722Z