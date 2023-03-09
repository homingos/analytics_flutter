// Autogenerated from Pigeon (v7.2.1), do not edit directly.
// See also: https://pub.dev/packages/pigeon

import Foundation
#if os(iOS)
import Flutter
#elseif os(macOS)
import FlutterMacOS
#else
#error("Unsupported platform.")
#endif



private func wrapResult(_ result: Any?) -> [Any?] {
  return [result]
}

private func wrapError(_ error: Any) -> [Any?] {
  if let flutterError = error as? FlutterError {
    return [
      flutterError.code,
      flutterError.message,
      flutterError.details
    ]
  }
  return [
    "\(error)",
    "\(type(of: error))",
    "Stacktrace: \(Thread.callStackSymbols)"
  ]
}

enum TrackingStatus: Int {
  case authorized = 0
  case denied = 1
  case notDetermined = 2
  case restricted = 3
  case unknown = 4
}

/// Generated class from Pigeon that represents data sent in messages.
struct NativeIdfaData {
  var adTrackingEnabled: Bool? = nil
  var advertisingId: String? = nil
  var trackingStatus: TrackingStatus? = nil

  static func fromList(_ list: [Any?]) -> NativeIdfaData? {
    let adTrackingEnabled = list[0] as? Bool 
    let advertisingId = list[1] as? String 
    var trackingStatus: TrackingStatus? = nil
    if let trackingStatusRawValue = list[2] as? Int {
      trackingStatus = TrackingStatus(rawValue: trackingStatusRawValue)
    }

    return NativeIdfaData(
      adTrackingEnabled: adTrackingEnabled,
      advertisingId: advertisingId,
      trackingStatus: trackingStatus
    )
  }
  func toList() -> [Any?] {
    return [
      adTrackingEnabled,
      advertisingId,
      trackingStatus?.rawValue,
    ]
  }
}

private class NativeIdfaApiCodecReader: FlutterStandardReader {
  override func readValue(ofType type: UInt8) -> Any? {
    switch type {
      case 128:
        return NativeIdfaData.fromList(self.readValue() as! [Any])
      default:
        return super.readValue(ofType: type)
    }
  }
}

private class NativeIdfaApiCodecWriter: FlutterStandardWriter {
  override func writeValue(_ value: Any) {
    if let value = value as? NativeIdfaData {
      super.writeByte(128)
      super.writeValue(value.toList())
    } else {
      super.writeValue(value)
    }
  }
}

private class NativeIdfaApiCodecReaderWriter: FlutterStandardReaderWriter {
  override func reader(with data: Data) -> FlutterStandardReader {
    return NativeIdfaApiCodecReader(data: data)
  }

  override func writer(with data: NSMutableData) -> FlutterStandardWriter {
    return NativeIdfaApiCodecWriter(data: data)
  }
}

class NativeIdfaApiCodec: FlutterStandardMessageCodec {
  static let shared = NativeIdfaApiCodec(readerWriter: NativeIdfaApiCodecReaderWriter())
}

/// Generated protocol from Pigeon that represents a handler of messages from Flutter.
protocol NativeIdfaApi {
  func getTrackingAuthorizationStatus(completion: @escaping (Result<NativeIdfaData, Error>) -> Void)
}

/// Generated setup class from Pigeon to handle messages through the `binaryMessenger`.
class NativeIdfaApiSetup {
  /// The codec used by NativeIdfaApi.
  static var codec: FlutterStandardMessageCodec { NativeIdfaApiCodec.shared }
  /// Sets up an instance of `NativeIdfaApi` to handle messages through the `binaryMessenger`.
  static func setUp(binaryMessenger: FlutterBinaryMessenger, api: NativeIdfaApi?) {
    let getTrackingAuthorizationStatusChannel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.NativeIdfaApi.getTrackingAuthorizationStatus", binaryMessenger: binaryMessenger, codec: codec)
    if let api = api {
      getTrackingAuthorizationStatusChannel.setMessageHandler { _, reply in
        api.getTrackingAuthorizationStatus() { result in
          switch result {
            case .success(let res):
              reply(wrapResult(res))
            case .failure(let error):
              reply(wrapError(error))
          }
        }
      }
    } else {
      getTrackingAuthorizationStatusChannel.setMessageHandler(nil)
    }
  }
}
