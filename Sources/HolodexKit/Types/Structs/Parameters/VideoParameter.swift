//
//  VideosParameters.swift
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

/// Parameter criteria for Videos.
public struct VideoParameter {
    /// Extra information to include with each Video.
    public let include: [Include]?

    /// If only Videos of a specific Language should be returned.
    public let lang: [Language]

    /// If paginated is true, only this many Videos will be returned.
    public let limit: Int

    /// If paginated is true, the results will be offset by this many Videos.
    public let offset: Int

    /// In what order the Videos should be sorted, ascending or descending.
    public let order: SortOrder?

    /// By what criteria the Videos should be sorted.
    public let sort: VideoSortType?

    /// Only return Videos from a specific organization.
    public let org: Organization?

    /// If only Videos mentioning a specific Channel should be returned.
    public let channelId: String?

    /// Only return Videos with any of these IDs.
    public let id: String?

    /// Max amount of hours in the future to return Videos from.
    /// Videos scheduled further in the future will not be returned.
    public let maxUpcomingHours: Int?

    /// If only Videos mentioning a specific channel should be returned.
    public let mentionedChannelId: String?

    /// If the results should be paginated.
    /// If so, the length of the results will limited to limit, with an offset of offset.
    public let paginated: Bool?

    /// Which statuses the Videos should have.
    public let status: VideoStatus?

    /// A topic that the Videos should be related to.
    public let topic: String?

    /// The type of the Videos.
    public let type: VideoType?

    public init(
        include: [Include]? = nil,
        lang: [Language] = [.all],
        @Clamped(range: 1...50) limit: Int = 25,
        offset: Int = 0,
        sort: VideoSortType? = nil,
        order: SortOrder? = nil,
        org: Organization? = nil,
        channelId: String? = nil,
        id: String? = nil,
        maxUpcomingHours: Int? = nil,
        mentionedChannelId: String? = nil,
        paginated: Bool? = nil,
        status: VideoStatus? = nil,
        topic: String? = nil,
        type: VideoType? = nil
    ) {
        self.include = include
        self.lang = lang
        self.limit = limit
        self.offset = offset
        self.sort = sort
        self.order = order
        self.org = org
        self.channelId = channelId
        self.id = id
        self.maxUpcomingHours = maxUpcomingHours
        self.mentionedChannelId = mentionedChannelId
        self.paginated = paginated
        self.status = status
        self.topic = topic
        self.type = type
    }

    /// Returns the URL query string of the parameters.
    internal var query: String {
        var components = URLComponents()

        components.queryItems = [
            URLQueryItem(name: "offset", value: "\(self.offset)"),
            URLQueryItem(name: "limit", value: "\(self.limit)")
        ]

        var langString = ""
        var isFirst: Bool = true

        self.lang.forEach { item in
            langString += isFirst ? item.rawValue : ",\(item.rawValue)"
            isFirst = false
        }

        components.queryItems?.append(URLQueryItem(name: "lang", value: langString))

        if let include = self.include {
            var includeString = ""
            isFirst = true

            include.forEach { item in
                includeString += isFirst ? item.rawValue : ",\(item.rawValue)"
                isFirst = false
            }

            components.queryItems?.append(URLQueryItem(name: "include", value: includeString))
        }

        if let order = self.order {
            components.queryItems?.append(URLQueryItem(name: "order", value: order.rawValue))
        }

        if let sort = self.sort {
            components.queryItems?.append(URLQueryItem(name: "sort", value: sort.rawValue))
        }

        if let org = self.org {
            components.queryItems?.append(URLQueryItem(name: "org", value: org.rawValue))
        }

        if let channelId = self.channelId {
            components.queryItems?.append(URLQueryItem(name: "channel_id", value: channelId))
        }

        if let id = self.id {
            components.queryItems?.append(URLQueryItem(name: "id", value: id))
        }

        if let maxUpcomingHours = self.maxUpcomingHours {
            components.queryItems?.append(URLQueryItem(name: "max_upcoming_hours", value: "\(maxUpcomingHours)"))
        }

        if let mentionedChannelId = self.mentionedChannelId {
            components.queryItems?.append(URLQueryItem(name: "mentioned_channel_id", value: mentionedChannelId))
        }

        if let paginated = self.paginated {
            components.queryItems?.append(URLQueryItem(name: "paginated", value: paginated ? "1" : ""))
        }

        if let status = self.status {
            components.queryItems?.append(URLQueryItem(name: "status", value: status.rawValue))
        }

        if let topic = self.topic {
            components.queryItems?.append(URLQueryItem(name: "topic", value: topic))
        }

        if let type = self.type {
            components.queryItems?.append(URLQueryItem(name: "type", value: type.rawValue))
        }

        return components.string ?? ""
    }
}
