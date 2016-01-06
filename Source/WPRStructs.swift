//
// WPRStructs.swift
//
// Copyright (c) 2016 Jiri Trecak (http://jiritrecak.com/)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.
//


// --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
//MARK: - Imports

import UIKit
import Foundation


// --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
//MARK: - Structures

struct WPRProperty {
    
    // All remote names that can be used as source of property content
    var remoteNames : [String]
    
    // Remote name that will be used for rebuilding of the value
    var masterRemoteName : String
    
    // Local property name
    var localName : String
    
    // Data type of the property
    var elementDataType : VariableDataType
    var optional : Bool = true
    var format : String?
    
    init(remoteName : String, localName : String, elementDataType : VariableDataType) {
        
        self.remoteNames = [remoteName]
        self.masterRemoteName = remoteName
        self.localName = localName
        self.elementDataType = elementDataType
    }
    
    init(remoteName : String, elementDataType : VariableDataType) {
        
        self.remoteNames = [remoteName]
        self.masterRemoteName = remoteName
        self.localName = remoteName
        self.elementDataType = elementDataType
    }
    
    
    init(remoteName : String, elementDataType : VariableDataType, optional : Bool) {
        
        self.optional = optional
        self.remoteNames = [remoteName]
        self.masterRemoteName = remoteName
        self.localName = remoteName
        self.elementDataType = elementDataType
    }
    
    
    init(remoteName : String, localName : String, elementDataType : VariableDataType, optional : Bool) {
        
        self.remoteNames = [remoteName]
        self.masterRemoteName = remoteName
        self.localName = localName
        self.elementDataType = elementDataType
        self.optional = optional
        self.format = nil
    }
    
    
    init(remoteName : String, localName : String, elementDataType : VariableDataType, optional : Bool, format : String?) {
        
        self.remoteNames = [remoteName]
        self.masterRemoteName = remoteName
        self.localName = localName
        self.elementDataType = elementDataType
        self.optional = optional
        self.format = format
    }
    
    
    init(remoteNames : [String], masterRemoteName : String, localName : String, elementDataType : VariableDataType) {
        
        self.remoteNames = remoteNames
        self.masterRemoteName = masterRemoteName
        self.localName = localName
        self.elementDataType = elementDataType
        self.optional = false
        
        // Remote names cannot be null - if there is such case, just force masterRemoteName to be remote name
        if self.remoteNames.count == 0 {
            self.remoteNames.append(self.masterRemoteName)
        }
    }
    
    
    init(remoteNames : [String], masterRemoteName : String, localName : String, elementDataType : VariableDataType, format : String?) {
        
        self.remoteNames = remoteNames
        self.masterRemoteName = masterRemoteName
        self.localName = localName
        self.elementDataType = elementDataType
        self.optional = false
        self.format = format
        
        // Remote names cannot be null - if there is such case, just force masterRemoteName to be remote name
        if self.remoteNames.count == 0 {
            self.remoteNames.append(self.masterRemoteName)
        }
    }
}


struct WPRRelation {
    
    var remoteName : String
    var localName : String
    var className : WPRObject.Type
    var inverseName : String
    var relationshipType : RelationshipType
    var inverseRelationshipType : RelationshipType
    var optional : Bool = true
    
    init(remoteName : String, localName : String, inverseName : String, className : WPRObject.Type, optional : Bool, relationshipType : RelationshipType, inverseRelationshipType : RelationshipType) {
        
        self.remoteName = remoteName
        self.localName = localName
        self.className = className
        self.inverseName = inverseName
        self.relationshipType = relationshipType
        self.inverseRelationshipType = inverseRelationshipType
        self.optional = optional
    }
}


struct AnyKey: Hashable {
    private let underlying: Any
    private let hashValueFunc: () -> Int
    private let equalityFunc: (Any) -> Bool
    
    init<T: Hashable>(_ key: T) {
        underlying = key
        // Capture the key's hashability and equatability using closures.
        // The Key shares the hash of the underlying value.
        hashValueFunc = { key.hashValue }
        
        // The Key is equal to a Key of the same underlying type,
        // whose underlying value is "==" to ours.
        equalityFunc = {
            if let other = $0 as? T {
                return key == other
            }
            return false
        }
    }
    
    var hashValue: Int { return hashValueFunc() }
}


func ==(x: AnyKey, y: AnyKey) -> Bool {
    return x.equalityFunc(y.underlying)
}



