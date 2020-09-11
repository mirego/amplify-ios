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
public protocol APICategoryReachabilityBehavior {
    #if canImport(Combine)
    /// Attempts to create and start a reachability client for a host that corresponds to the apiName, and then
    /// returns the associated Publisher which vends ReachabiltyUpdates
    /// - Parameters:
    ///   - for: The corresponding apiName that maps to the plugin configuration
    /// - Returns: A publisher that receives reachability updates, or nil if the reachability subsystem is unavailable
    @available(iOS 13.0, *)
    func reachabilityPublisher(for apiName: String?) throws -> AnyPublisher<ReachabilityUpdate, Never>?

    @available(iOS 13.0, *)
    func reachabilityPublisher() throws -> AnyPublisher<ReachabilityUpdate, Never>?
    #endif
}
