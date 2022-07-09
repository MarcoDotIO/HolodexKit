//
//  Holodex.swift
//  HolodexKit
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

/// The main class object used to manage fetching responses from the Holodex endpoint.
@available(macOS 10.15, iOS 13, watchOS 6, tvOS 13, *)
public class Holodex {
    private var apiKey: String?
    private var isUsingProductionServer: Bool

    private let mockServer: String = "https://stoplight.io/mocks/holodex/holodex/11620234"
    private let productionServer: String = "https://holodex.net/api/v2"

    public var fullUrl: String {
        return isUsingProductionServer ? "\(productionServer)" : "\(mockServer)"
    }

    public init(withKey apiKey: String? = nil) {
        self.apiKey = apiKey

        self.isUsingProductionServer = apiKey == nil ? false : true
    }
}

extension Holodex: HolodexProtocol {
    public func getChannels(withParameters param: ChannelParameter = ChannelParameter()) async throws -> [Channel]? {
        guard let channelsUrl = URL(string: "\(self.fullUrl)/channels\(param.query)") else {
            return nil
        }

        return try await URLSession.shared.decodeUrl(with: channelsUrl, andApiKey: apiKey)
    }

    public func getChannelById(using channelId: String) async throws -> Channel? {
        guard let channelUrl = URL(string: "\(self.fullUrl)/channels/\(channelId)") else {
            return nil
        }

        return try await URLSession.shared.decodeUrl(with: channelUrl, andApiKey: apiKey)
    }

    public func getVideosByChannelId(
        withId channelId: String,
        searchType: VideoSearchType = .videos,
        andParams params: VideoParameter = VideoParameter()
    ) async throws -> [VideoFull]? {
        guard let channelVideosUrl = URL(
            string: "\(self.fullUrl)/\(channelId)/\(searchType.rawValue)\(params.query)") else {
            return nil
        }

        return try await URLSession.shared.decodeUrl(with: channelVideosUrl, andApiKey: apiKey)
    }

    public func getVideo(
        withVideoId videoId: String,
        languages: [Language] = [.all],
        andDoesIncludeComments includeComments: Bool = false
    ) async throws -> VideoFull? {
        var components = URLComponents()

        components.queryItems = [
            URLQueryItem(name: "videoId", value: "\(videoId)"),
            URLQueryItem(name: "c", value: includeComments ? "1" : "0")
        ]

        var langString = ""
        var isFirst: Bool = true

        languages.forEach { language in
            langString += isFirst ? language.rawValue : ",\(language.rawValue)"
            isFirst = false
        }

        components.queryItems?.append(URLQueryItem(name: "lang", value: langString))

        let query = components.string ?? ""

        guard let videoUrl = URL(string: "\(self.fullUrl)/videos/\(videoId)\(query)") else {
            return nil
        }

        return try await URLSession.shared.decodeUrl(with: videoUrl, andApiKey: apiKey)
    }

    public func getLiveVideosByChannelId(channelIds: [String]) async throws -> [Video]? {
        var components = URLComponents()

        components.queryItems?.append(URLQueryItem(name: "channels", value: channelIds.joined(separator: ",")))

        let query = components.string ?? ""

        guard let liveVideoUrl = URL(string: "\(self.fullUrl)/users/live\(query)") else {
            return nil
        }

        return try await URLSession.shared.decodeUrl(with: liveVideoUrl, andApiKey: apiKey)
    }

    public func getLiveVideos(
        withParameters params: VideoParameter = VideoParameter()
    ) async throws -> [Video]? {
        guard let liveVideoUrl = URL(string: "\(self.fullUrl)/live\(params.query)") else {
            return nil
        }

        return try await URLSession.shared.decodeUrl(with: liveVideoUrl, andApiKey: apiKey)
    }

    public func getVideos(
        withParameters params: VideoParameter = VideoParameter(sort: .availableAt, order: .descending)
    ) async throws -> [Video]? {
        guard let videosUrl = URL(string: "\(self.fullUrl)/videos\(params.query)") else {
            return nil
        }

        return try await URLSession.shared.decodeUrl(with: videosUrl, andApiKey: apiKey)
    }
}
