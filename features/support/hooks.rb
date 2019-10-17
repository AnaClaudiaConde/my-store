Before do
  @home_page = HomePage.new
  @flow_purchease = FlowPurchease.new
  @helper = Helper.new
end

After do |scenario|
  screenshot = page.save_screenshot("log/screenshots/#{scenario.__id__}.png")
  embed(screenshot, "image/png", "Evidência")
end