//
//  Channel.swift
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

/// A Channel that uploads videos and/or streams.
public struct Channel: Codable, Identifiable {
    /// The ID of the Channel.
    public let id: String

    /// The name of the Channel.
    public let name: String?

    /// If the Channel has been marked as inactive.
    public let inactive: Bool?

    /// The type of the Channel.
    public let type: ChannelType?

    /// The description of the Channel.
    public let description: String?

    /// The primary language of the Channel, if any.
    public let lang: Language?

    /// The English name of the Channel, if any.
    public let englishName: String?

    /// The organization the Channel belongs to, if any.
    public let org: Organization?

    /// The sub-organization the Channel belongs to, if any.
    public let suborg: String?

    /// The URL of the Channel's Profile Picture, if any.
    public let photo: String?

    /// The URL of the Channe's Banner Picture, if any.
    public let banner: String?

    /// The Twitter handle of the Channel, if any.
    public let twitter: String?

    /// The amount of videos that the Channel has uploaded.
    public let videoCount: String?

    /// The amount of subscribers the Channel has.
    public let subscriberCount: String?

    /// The total video view count of the Channel.
    public let viewCount: String?

    /// The amount of clips created of the Channel.
    public let clipCount: Int?

    /// The creation date of the Channel.
    public let publishedAt: String?

    /// The topics the Channel streams the most of.
    public let topTopics: [String]?
}
