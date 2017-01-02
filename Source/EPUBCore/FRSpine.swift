//
//  FRSpine.swift
//  FolioReaderKit
//
//  Created by Heberti Almeida on 06/05/15.
//  Copyright (c) 2015 Folio Reader. All rights reserved.
//

import UIKit

struct Spine {
    var linear: Bool!
    var resource: FRResource!
    
    init(resource: FRResource, linear: Bool = true) {
        self.resource = resource
        self.linear = linear
    }
}

open class FRSpine: NSObject {
    open var pageProgressionDirection: String?
    open var spineReferences = [Spine]()
    open var isRtl: Bool {
        if let pageProgressionDirection = pageProgressionDirection , pageProgressionDirection == "rtl" {
            return true
        }
        return false
    }

    open func nextChapter(_ href: String) -> FRResource? {
        var found = false;

        for item in spineReferences {
            if(found){
                return item.resource
            }

            if(item.resource.href == href) {
                found = true
            }
        }
        return nil
    }
}
