//
//  MockHolodex.swift
//  HolodexKitTests
//
//  Copyright (c) 2022 MarcoDotIO
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import Foundation
@testable import HolodexKit

class MockHolodex: HolodexProtocol {
    func getDecodedData<T: Decodable>(_ type: T.Type = T.self, with jsonData: String) -> T? {
        guard let url = Bundle.test.url(forResource: jsonData, withExtension: "json") else {
            print("Getting Url for bundle has failed.")
            return nil
        }

        guard let data = try? Data(contentsOf: url) else {
            print("Setting data using contents of url has failed.")
            return nil
        }

        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase

        guard let result = try? decoder.decode(T.self, from: data) else {
            print("Decoding data has failed.")
            return nil
        }

        return result
    }

    func getChannels(withParameters param: ChannelParameter) async throws -> [Channel]? {
        return getDecodedData(with: "Channels") as [Channel]?
    }

    func getChannelById(using channelId: String) async throws -> Channel? {
        return getDecodedData(with: "Channel") as Channel?
    }

    func getVideo(
        withVideoId videoId: String,
        languages: [Language],
        andDoesIncludeComments includeComments: Bool
    ) async throws -> VideoFull? {
        return getDecodedData(with: "VideoFull") as VideoFull?
    }

    func getVideosByChannelId(
        withId channelId: String,
        searchType: VideoSearchType,
        andParams params: VideoParameter
    ) async throws -> [VideoFull]? {
        return getDecodedData(with: "ChannelVideoFull") as [VideoFull]?
    }

    func getLiveVideosByChannelId(channelIds: [String]) async throws -> [Video]? {
        return getDecodedData(with: "ChannelLiveVideo") as [Video]?
    }

    func getLiveVideos(withParameters params: VideoParameter) async throws -> [Video]? {
        return getDecodedData(with: "LiveVideos") as [Video]?
    }

    func getVideos(withParameters params: VideoParameter) async throws -> [Video]? {
        return getDecodedData(with: "Videos") as [Video]?
    }
}
