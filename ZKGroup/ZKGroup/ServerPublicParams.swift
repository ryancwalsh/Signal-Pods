//
// Copyright (C) 2020 Signal Messenger, LLC.
// All rights reserved.
//
// SPDX-License-Identifier: GPL-3.0-only
//
// Generated by zkgroup/codegen/codegen.py - do not edit

import Foundation
import libzkgroup

public class ServerPublicParams : ByteArray {

  public static let SIZE: Int = 160

  public init(contents: [UInt8]) throws  {
    try super.init(newContents: contents, expectedLength: ServerPublicParams.SIZE, unrecoverable: true)

    
    let ffi_return = FFI_ServerPublicParams_checkValidContents(self.contents, UInt64(self.contents.count))

    if (ffi_return == Native.FFI_RETURN_INPUT_ERROR) {
      throw ZkGroupException.IllegalArgument
    }

    if (ffi_return != Native.FFI_RETURN_OK) {
      throw ZkGroupException.ZkGroupError
    }
  }

  public func verifySignature(message: [UInt8], notarySignature: NotarySignature) throws {
    let ffi_return = FFI_ServerPublicParams_verifySignature(self.contents, UInt64(self.contents.count), message, UInt64(message.count), notarySignature.getInternalContentsForFFI(), UInt64(notarySignature.getInternalContentsForFFI().count))
    if (ffi_return == Native.FFI_RETURN_INPUT_ERROR) {
      throw ZkGroupException.VerificationFailed
    }

    if (ffi_return != Native.FFI_RETURN_OK) {
      throw ZkGroupException.ZkGroupError
    }
  }

  public func serialize() -> [UInt8] {
    return contents
  }

}
