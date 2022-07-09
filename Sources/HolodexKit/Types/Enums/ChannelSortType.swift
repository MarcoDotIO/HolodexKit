//
//  ChannelSortType.swift
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

/// Parameter used to indicate how the channels in the array will be sorted.
/// Any sort types that use a string will be sorted alphabetically.
public enum ChannelSortType: String, Codable {
    /// Sort by the Channel's ID.
    case id = "id"

    /// Sort by the actual name of a Channel.
    case fullName = "name"

    /// Sort by the English name of a Channel.
    case englishName = "english_name"

    /// Sort by the Type of Channel.
    case chType = "type"

    /// Sort by the Channel's main Organization.
    case chOrganization = "org"

    /// Sort by the Channel's sub Organization.
    case subOrganization = "suborg"

    /// Sort by the URL of the Profile Image of the Channel.
    case photo = "photo"

    /// Sort by the URL of the Banner Image of the Channel.
    case banner = "banner"

    /// Sort by the Twitter handle of the Channel.
    case twitter = "twitter"

    /// Sort by the amount of videos on the Channel.
    case videoCount = "video_count"

    /// Sort by the subscriber count of the Channel.
    case subscriberCount = "subscriber_count"

    /// Sort by the total video view count of the Channel.
    case viewCount = "view_count"

    /// Sort by the number of clips made of the Channel.
    case clipContent = "clip_content"

    /// Sort by the primary language of the Channel.
    case chLanguage = "language"

    /// Sort by the creation date of the Channel.
    case publishedAt = "published_at"

    /// Sort by if the Channel is marked as inactive or not.
    case inactive = "inactive"

    /// Sort by the Channel's description.
    case description = "description"
}
