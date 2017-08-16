Mime::Type.register "application/pdf", :pdf
Mime::Type.register "application/xls", :xls
Rack::Mime::MIME_TYPES.merge!({
    ".xls"     => "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",  
    ".xlsx"     => "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
    ".ppt"     => "application/vnd.openxmlformats-officedocument.presentationml.presentation",
    ".pptx"     => "application/vnd.openxmlformats-officedocument.presentationml.presentation",
    ".doc"     => "application/vnd.openxmlformats-officedocument.wordprocessingml.document",
    ".docx"     => "application/vnd.openxmlformats-officedocument.wordprocessingml.document",
})