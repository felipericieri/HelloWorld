# Env

module Env
  # Checks whether fastlane is running locally or in CI
  def self.is_ci
    ENV['CI'] == "true"
  end

  # Returns the pre-defined scheme to run tests
  def self.test_scheme
    ENV['SCAN_SCHEME']
  end

  # Returns the pre-defined device to run tests
  def self.test_devices
    # Retrieve the string
    devices_string = ENV['SCAN_DEVICES'] || ''
    # Convert string to array and remove quotes
    devices_array = devices_string.split(/,\s*/).map { |item| item.gsub(/\"/, '') }
    devices_array
  end

  # Returns the CI keychain name
  def self.ci_keychain_name
    "ci_keychain"
  end

  # Returns the CI keychain password
  def self.ci_keychain_password
    ENV['KEYCHAIN_PASSWORD']
  end
end
