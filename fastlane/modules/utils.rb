# Utils

require_relative 'env'

module Utils
  # Sets the right Xcode version for the environment
  def self.xcode_version
    # Define the path for different Xcode versions
    local_xcode_version = "15.1" 
    ci_xcode_version = "14.2"

    # Select Xcode version based on environment
    Env.is_ci ? ci_xcode_version : local_xcode_version
  end
  
  # Sets up keychain in CI
  def self.ci_keychain_setup
    if Env.is_ci
      create_ci_keychain
    end
  end

  # Creates Keychain
  def self.create_ci_keychain
    create_keychain(
      name: Env.ci_keychain_name,
      password: Env.ci_keychain_password,
      default_keychain: true,
      unlock: true,
      timeout: 3600,
      lock_when_sleeps: true
    )
  end
end
