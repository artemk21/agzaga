SELECT spree_products.id
  FROM spree_products
LEFT JOIN (SELECT spree_products.id, spree_labels_products.position
  AS staff_pick_position
  FROM spree_products
LEFT OUTER JOIN spree_labels_products
  ON spree_labels_products.product_id = spree_products.id
LEFT OUTER JOIN spree_labels
  ON spree_labels.id = spree_labels_products.label_id
WHERE spree_labels.tag = 'Staff Pick'
  ORDER BY spree_labels_products.position)
    AS p ON spree_products.id = p.id
  ORDER BY staff_pick_position, p.id;

# touched on 2025-07-09T20:35:38.987059Z