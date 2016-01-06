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
            WPRProperty(remoteName: "login", localName: "username", elementDataType: .String),
            WPRProperty(remoteName: "avatar_url", localName: "avatarURL", elementDataType: .String),
            WPRProperty(remoteName: "html_url", localName: "githubURL", elementDataType: .String),
            WPRProperty(remoteName: "url", localName: "detailURL", elementDataType: .String),
            WPRProperty(remoteName: "contributions", elementDataType: .Int),
            WPRProperty(remoteName: "followers", elementDataType: .Int),
            WPRProperty(remoteName: "following", elementDataType: .Int),
            WPRProperty(remoteName: "public_repos", localName: "repositories", elementDataType: .Int)
        ]
    }
}



