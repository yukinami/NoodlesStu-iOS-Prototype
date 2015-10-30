NooldesStu-iOS
===============

This project is an iOS prototype app for demonstration.

Coding Style
-------------

All code of the project should follow the style of [NYTimes Objective-C Style][NYTimes-OC-sytle].

Project Anatomy
---------------

### MVVM

The architecture follows the MVVM(Model-View-ViewModel) pattern. The relationships between the three components of the MVVM pattern are simpler than the MVC equivalents, following these strict rules:

1. The View has a reference to the ViewModel, but not vice-versa.
2. The ViewModel has a reference to the Model, but not vice-versa.

The MVVM pattern relies on data-binding, which is implemented by utilizing ReactiveCocoa.  
The main advantage of view model is that it decoupling the business from UI level and can be test easily. 

### StoryBoard

StoryBoards should be splited into individual files according to the module and reference each  other for collaboration purpose.

StoryBoards is mainly used to designate the worflow and relationship between each scenes. Some unuseable screen chould directly be drawed by storyboard and other screen should still be drawed by code.


### Localization

Localization Strings File is `/Storyboards & Localizations/Localizable.strings` and all definitions are manipulated through macros defined in header file `NOSLocalized{ModuleName}.h` which are include in header file `NOSLocalizedMacros.h`.

NOTE: The header file `NOSLocalizedCommon.h` is used to define macro used accross multiple modules.

### Fonts & Colors

The font definitions and color defitions are defined in the header file `NOSConstants.h` which  also include the header file `NOSLocalizedMacros.h` mentioned above.

### Images

Image Recesources are defined in `/Resources/Images.xcassets` and they are grouped by module.

They should be named as one camel case string with a description of their purpose, followed by the un-prefixed name of the class or property they are customizing (if there is one), followed by a further description of color and/or placement, and finally their state, which is expounded in the [NYTimes Objective-C Style][NYTimes-OC-sytle].

### Network (Offline Mode)

Using [RestKit][restkit] as RESTful web services clients. And take SQLite as persistent store so that the app could still present data even if the network failed.

### Environment Configuration

Environment configuration files are NOSEnvironment-{stage}.plist which located in `/Supporting Files` Directory. They are manipulated throught the `NOSEnvironment` utility class.

### Testing

All test case described with BDD style using [Speckta][speckta]. And assertions are asserted with [Expecta][expecta].

#### Unit Test
Objects are mocked with [OCMockito][OCMockito] and networking operations are mocked with [OHHTTPStubs][OHHTTPStubs].

NOTE: Data fixtures are defined in path `/Fixtures` of test bundle.

#### UI Testing

// TODO

Run
----

### Requirement

1. Xcode 7.0+
2. iOS 9

### Run the dummy server

```
ruby Dummy\ Server/server.rb
```


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

Library & Aacknowledgements 
---------------------------
1. [cocopods][cocopods]
2. [RestKit][restkit]
3. [Speckta][speckta]
4. [Expecta][expecta]
5. [OHHTTPStubs][OHHTTPStubs]
6. [OCMockito][OCMockito]
7. [Masonry][Masonry]
8. [ReactiveCocoa][ReactiveCocoa]
9. [LinqToObjectiveC][LinqToObjectiveC]

TODO
----
1. UI Test
2. ViewModel Test





License
--------
This project is licensed under the terms of the [Apache License, version 2.0](http://www.apache.org/licenses/LICENSE-2.0.html). Please see the LICENSE file for full details.




[NYTimes-OC-sytle]: https://github.com/NYTimes/objective-c-style-guide
[591mian-home]: http://www.591mian.com/
[restkit]: https://github.com/RestKit/RestKit
[cocopods]: https://cocoapods.org/
[speckta]: https://github.com/specta/specta
[expecta]: https://github.com/specta/expecta
[OCMockito]: https://github.com/jonreid/OCMockito
[OHHTTPStubs]: https://github.com/AliSoftware/OHHTTPStubs
[Masonry]: https://github.com/SnapKit/Masonry
[ReactiveCocoa]: https://github.com/ReactiveCocoa/ReactiveCocoa
[LinqToObjectiveC]: https://github.com/ColinEberhardt/LinqToObjectiveC