SELECT spree_avaliable_products.*
  FROM "spree_avaliable_products"
LEFT OUTER JOIN "spree_labels_products"
  ON "spree_labels_products"."product_id" = "spree_avaliable_products"."id"
LEFT OUTER JOIN "spree_labels"
  ON "spree_labels"."id" = "spree_labels_products"."label_id"
WHERE "spree_labels"."tag" = 'Gift Products' ORDER BY spree_labels_products.position;

# touched on 2025-07-09T20:31:57.731672Z
# touched on 2025-07-09T20:40:44.510794Z
# touched on 2025-07-09T20:58:59.610598Z