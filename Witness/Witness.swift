//
//  Witness.swift
//  Witness
//
//  Created by Niels de Hoog on 23/09/15.
//  Copyright © 2015 Invisible Pixel. All rights reserved.
//

import Foundation

public typealias FileEventHandler = (events: [FileEvent]) -> ()

public struct Witness {
    private let stream: EventStream
    var paths: [String] {
        return stream.paths
    }
    
    public init(paths: [String], flags: EventStreamCreateFlags = .None, latency: NSTimeInterval = 1.0,  changeHandler: FileEventHandler) {
        self.stream = EventStream(paths: paths, flags: flags, latency: latency, changeHandler: changeHandler)
    }
    
    public init(paths: [String], streamType: StreamType, flags: EventStreamCreateFlags = .None, latency: NSTimeInterval = 1.0, deviceToWatch: dev_t,  changeHandler: FileEventHandler) {
        self.stream = EventStream(paths: paths, type: streamType, flags: flags, latency: latency, deviceToWatch: deviceToWatch, changeHandler: changeHandler)
    }
    
    public func flush() {
        self.stream.flush()
    }
}

