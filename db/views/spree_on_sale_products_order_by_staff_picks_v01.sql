SELECT spree_on_sale_products.id
  FROM spree_on_sale_products
    LEFT JOIN (SELECT spree_on_sale_products.id
      FROM spree_on_sale_products
    LEFT OUTER JOIN spree_labels_products
      ON spree_labels_products.product_id = spree_on_sale_products.id
    LEFT OUTER JOIN spree_labels
      ON spree_labels.id = spree_labels_products.label_id
  WHERE spree_labels.tag = 'Staff Pick') AS p
ON spree_on_sale_products.id = p.id ORDER BY P.id;

# touched on 2025-07-09T18:24:49.797814Z
# touched on 2025-07-09T18:27:05.192675Z
# touched on 2025-07-09T20:39:36.853538Z