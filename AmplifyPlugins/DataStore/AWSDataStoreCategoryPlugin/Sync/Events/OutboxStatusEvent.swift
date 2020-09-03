//
// Copyright 2018-2020 Amazon.com,
// Inc. or its affiliates. All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation

public struct OutboxStatusEvent {
    let isEmpty: Bool

    public init(isEmpty: Bool) {
        self.isEmpty = isEmpty
    }
}