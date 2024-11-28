# config/initializers/letter_opener.rb

LetterOpener.configure do |config|
  # Set the location where emails will be opened
  config.location = Rails.root.join('tmp', 'letter_opener')

  # Use a lighter message template (optional)
  config.message_template = :light

  # Set the URI scheme for WSL file paths
  config.file_uri_scheme = 'file://wsl.localhost/Ubuntu'
end
