select id
FROM spree_on_sale_products
  LEFT JOIN (select spree_on_sale_products.id as p_id, SUM(spree_line_items.quantity)
 as total_qty
 FROM spree_on_sale_products INNER JOIN spree_variants
 ON spree_variants.product_id = spree_on_sale_products.id
  INNER JOIN spree_line_items
 ON spree_line_items.variant_id = spree_variants.id
  INNER JOIN spree_orders
 ON spree_orders.id = spree_line_items.order_id
 WHERE spree_orders.completed_at IS NOT NULL AND spree_on_sale_products.product_type NOT IN (1,2,3)
GROUP BY spree_on_sale_products.id) AS p ON spree_on_sale_products.id = p.p_id
  ORDER BY p.total_qty;

# touched on 2025-07-09T18:27:24.628978Z
# touched on 2025-07-09T20:32:00.144307Z
# touched on 2025-07-09T20:37:20.885156Z
# touched on 2025-07-09T20:37:55.802189Z