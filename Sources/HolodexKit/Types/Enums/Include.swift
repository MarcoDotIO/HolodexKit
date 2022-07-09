//
//  Include.swift
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

/// Comma separated string of extra info for video. Should be a string instead of an array.
public enum Include: String {
    /// Include clips of each Video.
    case clips = "clips"

    /// Any videos referencing the video in their description.
    case refers = "refers"

    /// Any videos listed as sources for the video.
    case sources = "sources"

    /// Any videos that refer to the video and go live or are uploaded around the same time.
    case simulcasts = "simulcasts"

    /// Any channels mentioned in the description of the video.
    case mentions = "mentions"

    /// The description of the video.
    /// - Note: Only use sparingly when needed, as querying for the description of
    /// each video frequently can lead to rate lockout.
    case description = "description"

    /// The live info of the video, if it's a stream.
    case liveInfo = "live_info"

    /// The statistics of the channel that uploaded the video.
    case channelStats = "channel_stats"

    /// Any songs that were played in the video.
    case songs = "songs"
}
