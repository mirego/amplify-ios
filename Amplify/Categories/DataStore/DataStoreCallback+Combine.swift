//
// Copyright 2018-2020 Amazon.com,
// Inc. or its affiliates. All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

#if canImport(Combine)
import Combine

@available(iOS 13.0, *)
extension DataStoreResult where Success: Any {

    public func resolve(promise: Future<Success, DataStoreError>.Promise) {
        switch self {
        case .success(let result):
            promise(.success(result))
        case .failure(let error):
            promise(.failure(causedBy: error))
        }
    }
}
#endif
