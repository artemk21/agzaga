SELECT "spree_products".*, "spree_labels"."tag"
FROM "spree_in_stock_available_backorderable_products" AS "spree_products"
INNER JOIN "spree_labels_products" ON "spree_labels_products"."product_id" = "spree_products"."id"
INNER JOIN "spree_labels" ON "spree_labels"."id" = "spree_labels_products"."label_id"
WHERE "spree_labels"."tag" IN ('Briddon USA Flag Products', 'Ariat Flag Products', 'Allied Flag Products', 'Accessories Flag Products')
ORDER BY
  CASE "spree_labels"."tag"
    WHEN 'Briddon USA Flag Products' THEN 1
    WHEN 'Ariat Flag Products' THEN 2
    WHEN 'Allied Flag Products' THEN 3
    WHEN 'Accessories Flag Products' THEN 4
  END,
  "spree_labels_products"."position" ASC

# touched on 2025-07-09T17:28:36.666231Z
# touched on 2025-07-09T20:58:30.648140Z