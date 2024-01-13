# XcodeSetup

require_relative 'Utils'

module XcodeSetup
  # Sets the right Xcode version for the environment
  def self.set_xcode_version
    # Define the path for different Xcode versions
    local_xcode_version = "15.1" 
    ci_xcode_version = "14.2"

    # Select Xcode version based on environment
    xcode_version = Utils.is_ci ? ci_xcode_version : local_xcode_version
    xcodes(version: xcode_version)
  end
end
