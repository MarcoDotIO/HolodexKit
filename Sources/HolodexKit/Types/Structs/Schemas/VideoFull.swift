//
//  VideoFull.swift
//  HolodexKit
//
//  Created by MarcoDotIO.
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

/// A struct containing information about a Video and any possible extra metadata that was requested.
public struct VideoFull: Codable, Identifiable {
    /// The ID of the Video.
    public let id: String

    /// The title of the Video.
    public let title: String?

    /// The Channel that posted the Video.
    public let channel: ChannelMin?

    /// The type of the Video.
    public let type: VideoType?

    /// The main topic the video is about. Videos of type `clip` cannot have a topic.
    public let topicId: String?

    /// The date the Video was first published.
    public let publishedAt: String?

    /// The date the Video is available at.
    public let availableAt: String?

    /// The length of the Video in seconds.
    public let duration: Int?

    /// The status of the Video.
    public let status: VideoStatus?

    /// When the stream is scheduled to start.
    public let startScheduled: String?

    /// When the stream actually started.
    public let startActual: String?

    /// When the stream ended.
    public let endActual: String?

    /// The amount of viewers the stream has, if applicable.
    public let liveViewers: Int?

    /// The description of the Video. This is included when `VideoFilter` has `include` set to `.description`.
    public let description: String?

    /// How many songs have been sung in the Video, if any.
    public let songcount: Int?

    /// Any clips that were made from this Video.
    public let clips: [Video]?

    /// Any sources this Video was based on.
    public let sources: [Video]?

    /// Any Videos that were mentioned in this video’s description.
    public let refers: [Video]?

    /// Any Videos that refer to this video and go live or are uploaded around the same time.
    public let simulcasts: [Video]?

    /// Any Channels that were mentioned in this Video’s description.
    public let mentions: [ChannelMin]?

    /// Songs that were sung in this Video.
    public let songs: [Song]?

    /// Comments posted on this Video.
    public let comments: [Comment]?

    /// Related Videos.
    public let recommendations: [Video]?
}
