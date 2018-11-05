FlashMessagesHelper.configure do |config|
  config.css_class = lambda { |key| "#{key} dismissible" }
end