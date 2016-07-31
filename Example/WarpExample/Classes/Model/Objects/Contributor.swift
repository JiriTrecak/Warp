//
//  Contributor.swift
//  Warp Example Project
//
//  Created by Jiří Třečák
//  Copyright © 2016 Jiri Trecak. All rights reserved.
//

// --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
// MARK: - Imports

import Foundation


// --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
// MARK: - Enums

enum Gender: String {
    
    case Male
    case Female
    case Other
    func serialized() -> String {
        return self.rawValue
    }
}


// --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
// MARK: - Object definition

class Contributor : WRPObject {
    
    
    // --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
    // MARK: - Data object properties
    
    var username : String!
    var avatarURL : String!
    var detailURL : String!
    var githubURL : String? = nil
    var contributions : Int = 0
    var followers : Int = 0
    var following : Int = 0
    var repositories : Int = 0
    var gender: Gender = .Male
    
    
    // --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
    // MARK: - Data object mapping
    
    override func propertyMap() -> [WRPProperty] {
        return [
            WRPProperty(remote: "login", bindTo: "username", type: .String),
            WRPProperty(remote: "avatar_url", bindTo: "avatarURL", type: .String),
            WRPProperty(remote: "html_url",bindTo: "githubURL", type: .String),
            WRPProperty(remote: "url",bindTo: "detailURL", type: .String),
            WRPProperty(remote: "contributions", type: .Int),
            WRPProperty(remote: "followers", type: .Int),
            WRPProperty(remote: "following", type: .Int),
            WRPProperty(remote: "public_repos", bindTo: "repositories", type: .Int),
            WRPProperty(remote: "gender", enumType: Gender.self)
        ]
    }
    
    
    override func relationMap() -> [WRPRelation] {
        
        return [
        ]
    }
}



