WITH ranked_products AS (
    SELECT "spree_products".id, "spree_taxons".id as taxon_id, count(spree_orders.id) as orders_count,
        RANK() OVER (PARTITION BY "spree_taxons".id ORDER BY count(spree_orders.id) DESC) as rank
    FROM "spree_products"
    INNER JOIN "spree_variants" ON "spree_variants"."deleted_at" IS NULL AND "spree_variants"."product_id" = "spree_products"."id"
    INNER JOIN "spree_line_items" ON "spree_line_items"."variant_id" = "spree_variants"."id"
    INNER JOIN "spree_orders" ON "spree_orders"."id" = "spree_line_items"."order_id"
    INNER JOIN "spree_products_taxons" ON "spree_products_taxons"."product_id" = "spree_products"."id"
    INNER JOIN "spree_taxons" ON "spree_taxons"."id" = "spree_products_taxons"."taxon_id"
    WHERE "spree_products"."deleted_at" IS NULL AND (spree_orders.completed_at IS NOT NULL AND spree_taxons.parent_id IS NULL AND spree_products.product_type NOT IN (1,2,3))
    GROUP BY "spree_products".id, "spree_taxons".id
)
SELECT id, taxon_id, orders_count
FROM ranked_products
WHERE rank <= 5
ORDER BY orders_count DESC limit 50;

# touched on 2025-07-09T18:16:52.254785Z
# touched on 2025-07-09T18:20:14.831426Z
# touched on 2025-07-09T18:21:32.261296Z
# touched on 2025-07-09T18:26:11.236073Z
# touched on 2025-07-09T20:36:55.667331Z