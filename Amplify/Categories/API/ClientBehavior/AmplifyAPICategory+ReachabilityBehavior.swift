//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation
#if canImport(Combine)
import Combine
#endif
extension AmplifyAPICategory: APICategoryReachabilityBehavior {
    #if canImport(Combine)
    @available(iOS 13.0, *)
    public func reachabilityPublisher(for apiName: String?) throws -> AnyPublisher<ReachabilityUpdate, Never>? {
        return try plugin.reachabilityPublisher(for: apiName)
    }

    @available(iOS 13.0, *)
    public func reachabilityPublisher() throws -> AnyPublisher<ReachabilityUpdate, Never>? {
        return try plugin.reachabilityPublisher(for: nil)
    }
    #endif
}
