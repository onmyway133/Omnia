//
//  Queue.swift
//  Omnia
//
//  Created by Khoa Pham on 28/04/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import Foundation

public extension Performer {
  public struct Queue {
    public let name: String
    public let queue: dispatch_queue_t

    public init(name: String,
                attribute: Attribute = Attribute(),
                qualityOfService: QualityOfService = QualityOfService()) {
      self.name = name

      let attr = dispatch_queue_attr_make_with_qos_class(attribute.rawValue, qualityOfService.rawValue, -1)
      self.queue = dispatch_queue_create(name, attr)
    }

    public init(queue: dispatch_queue_t) {
      self.name = String(dispatch_queue_get_label(queue))
      self.queue = queue
    }

    public static var main: Queue = {
      return Queue(queue: dispatch_get_main_queue())
    }()

    public static var background: Queue = {
      return Queue(queue: dispatch_get_global_queue(QualityOfService.Background.rawValue, 0))
    }()
  }
}
