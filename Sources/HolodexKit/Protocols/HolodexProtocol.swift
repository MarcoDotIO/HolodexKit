//
//  HolodexProtocol.swift
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

/// Protocol to help conform the source and unit test Holodex classes
/// and to verify the validity of the enum models for use with Production Server responses.
public protocol HolodexProtocol {
    /// Using a `ChannelParameter`, fetch an optional array of `Channel`.
    /// - Parameter param: `ChannelParam` that inputs a specified query for the endpoint.
    /// - Returns: An optional array of `Channel`.
    func getChannels(withParameters param: ChannelParameter) async throws -> [Channel]?

    /// Using a channel ID `string` input, fetch the channel metadata and return an optional `Channel` object.
    /// - Parameter channelId: A `String` that corresponds to the YouTube Channel ID of the Channel.
    /// - Returns: An optional `Channel` object.
    func getChannelById(using channelId: String) async throws -> Channel?

    /// Fetch videos from a specified Channel using the Channel's ID, the type of video of `VideoSearchType`,
    /// and a `VideoParameter`. This will return an optional array of `VideoFull`.
    /// - Parameters:
    ///   - channelId: A `String` that corresponds to the YouTube Channel ID of the Channel.
    ///   - searchType: A `VideoSearchType` enum that can either be a video, clip, or collab.
    ///   - params: A `VideoParameter` that inputs a specified query for the endpoint.
    /// - Returns: An optional array of `VideoFull`.
    func getVideosByChannelId(
        withId channelId: String,
        searchType: VideoSearchType,
        andParams params: VideoParameter
    ) async throws -> [VideoFull]?

    /// Get the Video metadata of the specified Video ID, language (for recommended videos),
    /// and whether the return object includes comments from the Video or not.
    /// - Parameters:
    ///   - videoId: The YouTube ID of the Video.
    ///   - languages: The language of the recommended videos. Default is set to `.all`.
    ///   - includeComments: A boolean determining whether the return object includes
    ///   comments from the video or not. Default set to `false`.
    /// - Returns: An optional `Video` object.
    func getVideo(
        withVideoId videoId: String,
        languages: [Language],
        andDoesIncludeComments includeComments: Bool
    ) async throws -> VideoFull?

    /// Get the live videos of the specified Channel IDs.
    /// - This endpoint is similar to the `/live` endpoint and usually replies much faster.
    /// It is more friendly in general.
    /// The cost to execute a lookup is significantly cheaper. It's unfortunately less customizable as a result.
    /// We recommend using this if you have a fixed set of `Channel` IDs to look up status for.
    /// - Parameter channelIds: A `String` array of the YouTube IDs of the Channel(s).
    /// - Returns: An optional `Video` array.
    func getLiveVideosByChannelId(channelIds: [String]) async throws -> [Video]?

    /// Get the live and upcoming Videos using a `VideoParameter`.
    /// - Parameter params: A `VideoParameter` that inputs a specified query for the endpoint.
    /// - Returns: An optional array of `Video`.
    func getLiveVideos(withParameters params: VideoParameter) async throws -> [Video]?

    /// Get an array of Videos
    /// - Pretty much everything you need. This is the most 'vanilla' variant with almost no preset values,
    /// and `/channels/{channelId}/{type}` and `/live` endpoints both use the same query structure;
    /// but provision default values differently for some of the query params.
    /// - Parameter params: A `VideoParameter` that inputs a specified query for the endpoint.
    /// - Returns: An optional array of `Video`.
    func getVideos(withParameters params: VideoParameter) async throws -> [Video]?
}
