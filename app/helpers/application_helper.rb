module ApplicationHelper
  def image_cdn_link(url)
    return url if url.blank?
    return url unless Rails.env.production?

    assets_sub_domain = ENV['ASSETS_SUB_DOMAIN']

    root = ENV['SPACES_ROOT_URL']
    root = "#{ENV['SPACES_BUCKET_NAME']}.#{root}" if assets_sub_domain.present?

    cdn_root = assets_sub_domain.present? ? assets_sub_domain : ENV['SPACES_CDN_ROOT_URL']

    url&.gsub(root, cdn_root) if root.present? && cdn_root.present?
  end
end

# touched on 2025-07-09T17:32:26.896907Z
# touched on 2025-07-09T17:40:32.146817Z
# touched on 2025-07-09T18:20:17.276618Z
# touched on 2025-07-09T19:39:23.965926Z
# touched on 2025-07-09T20:57:56.125788Z