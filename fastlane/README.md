fastlane documentation
================
# Installation

Make sure you have the latest version of the Xcode command line tools installed:

```
xcode-select --install
```

Install _fastlane_ using
```
[sudo] gem install fastlane -NV
```
or alternatively using `brew install fastlane`

# Available Actions
## iOS
### ios create_app
```
fastlane ios create_app
```
Create app on Apple Developer and App Store Connect sites
### ios screenshot
```
fastlane ios screenshot
```
Take screenshots
### ios build
```
fastlane ios build
```
Update versioning and create .ipa file
### ios scan_app
```
fastlane ios scan_app
```
Run all Unit and UI tests
### ios upload
```
fastlane ios upload
```
Upload to App Store
### ios beta
```
fastlane ios beta
```
Upload to TestFlight
### ios build_and_deliver_internally
```
fastlane ios build_and_deliver_internally
```
Take screenshots, build and upload to TestFlight
### ios deliver_to_app_store
```
fastlane ios deliver_to_app_store
```
Upload to App Store

----

This README.md is auto-generated and will be re-generated every time [fastlane](https://fastlane.tools) is run.
More information about fastlane can be found on [fastlane.tools](https://fastlane.tools).
The documentation of fastlane can be found on [docs.fastlane.tools](https://docs.fastlane.tools).
