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
// MARK: - Object definition

class Contributor : WPRObject {
    
    
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
    
    
    // --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
    // MARK: - Data object mapping
    
    override func propertyMap() -> [WPRProperty] {
        
        return [
            WPRProperty(remote: "login", local: "username", type: .String),
            WPRProperty(remote: "avatar_url", local: "avatarURL", type: .String),
            WPRProperty(remote: "html_url", local: "githubURL", type: .String),
            WPRProperty(remote: "url", local: "detailURL", type: .String),
            WPRProperty(remote: "contributions", type: .Int),
            WPRProperty(remote: "followers", type: .Int),
            WPRProperty(remote: "following", type: .Int),
            WPRProperty(remote: "public_repos", local: "repositories", type: .Int)
        ]
    }
}



