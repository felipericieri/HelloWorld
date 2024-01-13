# Utils

module Utils
  # Define whether fastlane is running locally or in CI
  def self.is_ci
    ENV['CI'] == "true"
  end

  # Sets up keychain in CI
  def self.ci_keychain_setup
    if is_ci
      create_ci_keychain
    end
  end

  # Creates Keychain
  def self.create_ci_keychain
    create_keychain(
      name: "CI_Keychain",
      password: ENV["KEYCHAIN_PASSWORD"], # Set this in your CI environment variables
      default_keychain: true,
      unlock: true,
      timeout: 3600,
      lock_when_sleeps: true
    )
  end
end
