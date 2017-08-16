Paperclip::Attachment.default_options[:url] = ":rails_root/public/uploads/:class/:id/:basename.:extension"
Paperclip::Attachment.default_options[:path] = ":rails_root/public/uploads/:class/:id/:basename.:extension"

# Paperclip::Attachment.default_options[:url] = ':s3_domain_url'
# Paperclip::Attachment.default_options[:path] = '/:class/:attachment/:id_partition/:style/:filename'