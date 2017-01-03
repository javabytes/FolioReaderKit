//
//  FRResource.swift
//  FolioReaderKit
//
//  Created by Heberti Almeida on 29/04/15.
//  Copyright (c) 2015 Folio Reader. All rights reserved.
//

import UIKit

open class FRResource: NSObject {
    open var id: String!
    open var properties: String?
    open var href: String!
    open var fullHref: String!
    open var mediaType: MediaType!
    open var mediaOverlay: String?

    open func basePath() -> String! {
        if href == nil || href.isEmpty { return nil }
        var paths = fullHref.components(separatedBy: "/")
        paths.removeLast()
        return paths.joined(separator: "/")
    }
}

// MARK: Equatable

public func ==(lhs: FRResource, rhs: FRResource) -> Bool {
    return lhs.id == rhs.id && lhs.href == rhs.href
}
