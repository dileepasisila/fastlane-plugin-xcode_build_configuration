# xcode_build_configuration plugin

[![fastlane Plugin Badge](https://rawcdn.githack.com/fastlane/fastlane/master/fastlane/assets/plugin-badge.svg)](https://rubygems.org/gems/fastlane-plugin-xcode_build_configuration)

## Getting Started

This project is a [_fastlane_](https://github.com/fastlane/fastlane) plugin. To get started with `fastlane-plugin-xcode_build_configuration`, add it to your project by running:

```bash
fastlane add_plugin xcode_build_configuration
```

## About xcode_build_configuration

Getting build settings information for relevant build configuration and schemas.
Set and Get Version information without using agvtool.
For applying this actions, schemes should be shared state.

## Actions

##### get_build_number_by_scheme_and_build_configuration
Get the build number from a xcodeproj for a particular scheme and build configuration.

```ruby 
build_number = get_build_number_by_scheme_and_build_configuration(
                        scheme: 'Scheme Name', 
                        build_configuration_name: 'Build Configuration name')
```

##### get_marketing_version_by_scheme_and_build_configuration
Get the marketing version from a xcodeproj for a particular scheme and build configuration.

```ruby 
marketing_version = get_marketing_version_by_scheme_and_build_configuration(
                        scheme: 'Scheme Name', 
                        build_configuration_name: 'Build Configuration name')
```

##### set_build_number_by_scheme_and_build_configuration
Set the build number to the xcodeproj for a particular scheme and build configuration.

```ruby 
marketing_version = set_build_number_by_scheme_and_build_configuration(
                        build_number: 'Build Number',                        
                        scheme: 'Scheme Name', 
                        build_configuration_name: 'Build Configuration name')
```
##### set_marketing_version_by_scheme_and_build_configuration
Set the marketing version to the xcodeproj for a particular scheme and build configuration.

```ruby 
marketing_version = set_marketing_version_by_scheme_and_build_configuration(
                        marketing_version: 'Marketing Version'                        
                        scheme: 'Scheme Name', 
                        build_configuration_name: 'Build Configuration name')
```

##### set_app_version_by_scheme_and_build_configuration
Set the marketing version to the xcodeproj for a particular scheme and build configuration.

```ruby 
marketing_version = set_app_version_by_scheme_and_build_configuration(
                        build_number: 'Build Number',
                        marketing_version: 'Marketing Version',                        
                        scheme: 'Scheme Name', 
                        build_configuration_name: 'Build Configuration name')
```

## Issues and Feedback

For any other issues and feedback about this plugin, please submit it to this repository.

## Troubleshooting

If you have trouble using plugins, check out the [Plugins Troubleshooting](https://docs.fastlane.tools/plugins/plugins-troubleshooting/) guide.

## Using _fastlane_ Plugins

For more information about how the `fastlane` plugin system works, check out the [Plugins documentation](https://docs.fastlane.tools/plugins/create-plugin/).

## About _fastlane_

_fastlane_ is the easiest way to automate beta deployments and releases for your iOS and Android apps. To learn more, check out [fastlane.tools](https://fastlane.tools).
