[![Swift 2.1](https://img.shields.io/badge/Swift-2.1-orange.svg?style=flat)](https://developer.apple.com/swift/)
[![Platforms OS X | iOS | tvos](https://img.shields.io/badge/Platforms-OS%20X%20%7C%20iOS-lightgray.svg?style=flat)](https://developer.apple.com/swift/)
[![License](http://img.shields.io/:license-mit-blue.svg)](http://doge.mit-license.org)


# Warp

Insanely easy-to-use, extremely powerful swift object, that will make creation of your data models breeze. 

> Too tired to read? That is understandable. That is why I made this example. You will find it little bit different from what you usually see - [check it out](https://github.com/JiriTrecak/Warp/tree/master/Example). Just download and run in XCode.



## Do I need it? (most probably)

There is one thing that most applications have in common - they are in **dire need of downloading raw data, and creating objects out of them**. What is NOT that common is that you need whole database to store them - simply having them as objects in memory would be sufficient.

If you are like 95% people who just want to download and present data, and use them from memory, please continue, and enjoy. 

If you need whole databases with search, fetch control and more, then this is not for you (use Realm, or CD - though facade support for them is also coming). But you can check my [other library](https://github.com/JiriTrecak/Laurine "Laurine Generator") - you will use that for sure. 

*Oh and drop me a message within the time that you will save by using this library.*


## Show me the good stuff

Enough talking, lets make our model. You start by extending any class to be child of `WRPObject`:


```swift
class User : WRPObject
```

And.. that is it. Your User just gained supowerpowers - it can serialize, deserialize, has support of remote properties and relationships and more sweetness, that you will find below.

Lets imagine you have following object definition:

```swift
class User : WRPObject {

	// Properties
   var name : String!
   var email : String?
   var userId : Int = 0
   var active : Bool = true
   var createdAt : NSDate!
   var latitude : Double = 0
   var longitude : Double = 0
   
   // Relationships
   var messages : [Message] = []
}
```

In order for Warp to know how to get your data, you provide only two methods:

**Map Properties**

Warp can serialize almost any property you throw at it. You provide description, Warp handles the rest. What Warp does differently than any other mapping system is that the description covers all common scenarios that you can encounter. 

```swift

func propertyMap() -> [WRPProperty] {
     return [
        // Bind remote string "name" to the same local "name", must exist
        WPRProperty(remote: "name", type: .String, optional: false),
        
        // Bind remote string "email_address" to local "email", optional
        WPRProperty(remote: "email_address", bindTo: "email", type: .String),
        
        // Bind remote Bool "active" to local "active"
        WPRProperty(remote: "active", type: .Bool),
        
        // Bind remote NSDate "created_at" to local "createdAt", must exist, specific date format
        WPRProperty(remote: "created_at", bindTo: "createdAt", type: .Date, optional: false, format: "yyyy-MM-dd")
     ]
}

```

This way, you can map all the properties - just combine initializer properies together. Now there are two **specific cases, that are very often needed**:

```swift

func propertyMap() -> [WRPProperty] {
     return [
         ...
         // When the data for objects are deeper than on first level,
         // you can use dot notation to flatten it:
         // { "_geoloc" : { "lat" : 50, "lon" : 50 }} can be mapped as
         WPRProperty(remote: "_geoloc.lat", bindTo: "latitude", type: .Double),
         WPRProperty(remote: "_geoloc.lon", bindTo: "longitude", type: .Double),
         
         // Warp can also bind one property from multiple sources,
         // which is excellent when you have, for example, multiple
         // databases, each with different key. Specify primary key
         // if there is chance and more of them can show at once and 
         // one has priority:
         WPRProperty(remotes: ["id", "objectId", "object_id"], bindTo: "userId", type: .Int),
     ]
}

``` 

**Map Relationships**

WIP

## Installation

TODO

## Supported Features

TODO


## Contribute
I will gladly accept Pull Requests (and I encourage you to do so). If you encounter any bug or you have enhancement that you would like to see, please open an issue. Please make sure you target your PR against Development branch.

## Contact me


- [@JiriTrecak](https://twitter.com/@JiriTrecak "My twitter account")
- [jiritrecak@gmail.com](mailto:jiritrecak@gmail.com "My email") 

Or, if you would like to know me better, check out my portfolio.

- [jiritrecak.com](http://jiritrecak.com/ "My personal website") 

##Licence

The MIT License (MIT)

Copyright (c) 2015 Jiří Třečák

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.