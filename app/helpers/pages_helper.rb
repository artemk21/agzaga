module PagesHelper
  def mill_page_categories
    {
      'Hay Containment': '#',
      'Hay Parts': '#',
      'Drivelines': '#',
      'Tractor Parts': '#',
      'Accessories': '#',
      'Apparel': '#',
    }
  end

  def wide_image? product
    product.gallery.images.present? && product.gallery.images.where(alt: "wide-image").present?
  end
end

# touched on 2025-07-09T17:36:22.285734Z
# touched on 2025-07-09T18:26:58.807761Z
# touched on 2025-07-09T18:27:32.357928Z