//
//  VideoSortType.swift
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

/// Different criteria for sorting Videos. Any sort types that use a string will be sorted alphabetically.
public enum VideoSortType: String, Codable {
    /// Sort by Video's ID.
    case id = "id"

    /// Sort by Video's title.
    case title = "title"

    /// Sort by Video's type.
    case type = "type"

    /// Sort by the Video's topics.
    case topics = "topics"

    /// Sort by when the Video was first published.
    case publishedAt = "published_at"

    /// Sort by the Video's availability date.
    case availableAt = "available_at"

    /// Sort by the Video's duration.
    case duration = "duration"

    /// Sort by the Video's status.
    case status = "status"

    /// Sort by the Video's start scheduled date, if the Video is a stream or premiere.
    case startScheduled = "start_scheduled"

    /// Sort by when the Video started, if the Video is a stream or premiere.
    case startActual = "start_actual"

    /// Sort by when the Video ended, if the Video is a stream or premiere.
    case endActual = "end_actual"

    /// Sort by the amount of live viewers, if the video is a stream or premiere.
    case liveViewers = "live_viewers"

    /// Sort by the video's description.
    case description = "description"

    /// Sort by the amount of songs in the Video.
    case songCount = "song_count"

    /// Sort by the ID of the Channel that published the Video.
    case channelId = "channel_id"
}
