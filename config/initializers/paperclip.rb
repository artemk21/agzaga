if Rails.env.production?
  Paperclip::Attachment.default_options.merge!(
    storage: :fog,
    fog_credentials: {
      provider: 'AWS',
      aws_access_key_id: ENV['SPACES_ACCESS_KEY_ID'],
      aws_secret_access_key: ENV['SPACES_SECRET_ACCESS_KEY'],
      region: ENV['SPACES_REGION_NAME'],
      endpoint: 'https://'+ ENV['SPACES_ROOT_URL'],
    },
    fog_directory: ENV['SPACES_BUCKET_NAME'],
    fog_host: 'https://'+ ENV['SPACES_BUCKET_NAME']+ '.' + ENV['SPACES_ROOT_URL'],

    content_type_mappings: {
      webp: 'image/webp'
    }
  )

  Spree::Image.attachment_definitions[:attachment].delete(:url)
  Spree::Image.attachment_definitions[:attachment].delete(:path)
end

# touched on 2025-07-09T20:38:34.631112Z
# touched on 2025-07-09T20:58:59.612104Z
# touched on 2025-07-09T21:00:54.593788Z
# touched on 2025-07-09T21:23:07.526976Z
# touched on 2025-07-09T21:24:19.615811Z