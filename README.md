NooldesStu-iOS
===============

This project is a prototype and is an iOS application built for [591mian][591mian-home].

Coding style
-------------

All code of the project should follow the style of [NYTimes Objective-C Style][NYTimes-OC-sytle].


Library & Aacknowledgements 
---------------------------
1. [cocopods][cocopods]
2. [RestKit][restkit]
3. [Speckta][speckta]
4. [Expecta][expecta]
5. [OHHTTPStubs][OHHTTPStubs]



Building
--------
The building process below using `xctool`. You also can build with `xcodebuild`.

### Testing 

```
xctool -scheme NoodlesStu-iOS -sdk iphonesimulator -workspace NoodlesStu-iOS.xcworkspace/  -destination "name=iPhone 6" test
```

*Note: This might not work with xcode7*

### Archive

```
xctool -scheme NoodlesStu-iOS -sdk iphoneos -workspace NoodlesStu-iOS.xcworkspace/  archive
```
















[NYTimes-OC-sytle]: https://github.com/NYTimes/objective-c-style-guide
[591mian-home]: http://www.591mian.com/
[restkit]: https://github.com/RestKit/RestKit
[cocopods]: https://cocoapods.org/
[speckta]: https://github.com/specta/specta
[expecta]: https://github.com/specta/expecta
[OHHTTPStubs]: https://github.com/AliSoftware/OHHTTPStubs