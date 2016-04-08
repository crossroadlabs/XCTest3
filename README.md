[<p align="center"><img height=256 alt="XCTest3" src="https://www.iconfinder.com/icons/103838/download/png/512"></p>](#XCTest3)

# XCTest3

![🐧 linux: ready](https://img.shields.io/badge/%F0%9F%90%A7%20linux-ready-red.svg)
![🐤 3.0: ready](https://img.shields.io/badge/🐤 3.0-ready-reallyed.svg)
[![Build Status](https://travis-ci.org/crossroadlabs/XCTest3.svg?branch=master)](https://travis-ci.org/crossroadlabs/XCTest3)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
![Platform OS X | iOS | tvOS | watchOS | Linux](https://img.shields.io/badge/platform-OS X | iOS | tvOS | watchOS | Linux-orange.svg)
![Swift version](https://img.shields.io/badge/Swift-2.2 | 3.0-blue.svg)
[![GitHub license](https://img.shields.io/badge/license-Apache 2.0-lightgrey.svg)](https://raw.githubusercontent.com/crossroadlabs/Regex/master/LICENSE)
[![GitHub release](https://img.shields.io/github/release/crossroadlabs/XCTest3.svg)](https://github.com/crossroadlabs/XCTest3/releases)

## Swift XCTest Shims that mimic Swift 3.0 APIs. For thous who wants to maintain Swift multiple versions compatibility

## Goals

[<img align="left" src="https://raw.githubusercontent.com/crossroadlabs/Express/master/logo-full.png" hspace="20" height=128>](https://github.com/crossroadlabs/Express) XCTest3 library was mainly introduced to fulfill the needs of [Swift Express](https://github.com/crossroadlabs/Express) - web application server side framework for Swift. Now it's a part of Crossroad Labs Foundation.

Still we hope it will be useful for everybody else.

[Bother less with #if swift(>=3.0) ;)](#examples)

## Getting started

### Installation

#### [Package Manager](https://swift.org/package-manager/)

Add the following dependency to your [Package.swift](https://github.com/apple/swift-package-manager/blob/master/Documentation/Package.swift.md):

```swift
.Package(url: "https://github.com/crossroadlabs/XCTest3.git", majorVersion: 0)
```

Run ```swift build``` and build your app. Package manager is supported on OS X, but it's still recommended to be used on Linux only.

#### [Carthage](https://github.com/Carthage/Carthage)
Add the following to your [Cartfile](https://github.com/Carthage/Carthage/blob/master/Documentation/Artifacts.md#cartfile):

```
github "crossroadlabs/XCTest3"
```

Run `carthage update` and follow the steps as described in Carthage's [README](https://github.com/Carthage/Carthage#adding-frameworks-to-an-application).

#### [CocoaPods](http://cocoapods.org/)
Add the following to your [Podfile](http://guides.cocoapods.org/using/the-podfile.html):

```rb
pod 'XCTest3'
```

Make sure that you are integrating your dependencies using frameworks: add `use_frameworks!` to your Podfile. Then run `pod install`.

### Examples

#### Introduction:

OK, XCTest has changed as well since introduction of Swift 3.0. APIs are different and you either have to use `#if swift(>=3.0)` excessively or use __XCTest3__. With XCTest3 you just use Swift 3.0 APIs. You can read more about it in [Boilerplate](https://github.com/crossroadlabs/Boilerplate) and [Foundation3](https://github.com/crossroadlabs/Foundation3).

Here is an example on how to use XCTest with Swift 3.0 APIs

```swift
let expectation = self.expectation(withDescription: "test expectation")
        expectation.fulfill()
        
self.waitForExpectations(withTimeout: 0)
```

#### Absent API?

OK, guys. We wrap XCTest APIs as we encounter them. Want more? We are glad to accept contributions. Let's make Swift 3.0 compatibility layer together.

### Keep your tests clean ;)

## Contributing

To get started, <a href="https://www.clahub.com/agreements/crossroadlabs/XCTest3">sign the Contributor License Agreement</a>.

## [![Crossroad Labs](http://i.imgur.com/iRlxgOL.png?1) by Crossroad Labs](http://www.crossroadlabs.xyz/)