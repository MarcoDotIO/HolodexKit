//
//  ChannelParameter.swift
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

/// Parameter criteria for Channels.
public struct ChannelParameter {
    /// Only show Channels that uses any of the given languages as their main language.
    /// Default is an empty `Language` array.
    public let lang: [Language]

    /// In what order the Channels should be sorted, ascending or descending. Default is `.ascending`.
    public let order: SortOrder

    /// By what criteria the Channels should be sorted. Default is `.chOrganization`.
    public let sort: ChannelSortType

    /// Only return Channels from a specific organization.
    public let org: Organization?

    /// Only show Channels of the given type.
    public let type: ChannelType?

    /// Limit the number of returned Channels to the given value. Default is 25.
    /// - Note: Value must be between 0 and 50, inclusive.
    public let limit: Int

    /// Offset the returned values by the given amount of places. Default is 0.
    public let offset: Int

    public init(
        @Clamped(range: 1...50) limit: Int = 25,
        offset: Int = 0,
        order: SortOrder = .ascending,
        sort: ChannelSortType = .chOrganization,
        org: Organization? = nil,
        lang: [Language] = [Language](),
        type: ChannelType? = nil
    ) {
        self.limit = limit
        self.offset = offset
        self.order = order
        self.sort = sort
        self.org = org
        self.lang = lang
        self.type = type
    }

    /// Returns the URL query string of the parameters.
    internal var query: String {
        var components = URLComponents()

        components.queryItems = [
            URLQueryItem(name: "limit", value: "\(self.limit)"),
            URLQueryItem(name: "offset", value: "\(self.offset)"),
            URLQueryItem(name: "order", value: "\(self.order.rawValue)"),
            URLQueryItem(name: "sort", value: "\(self.sort.rawValue)")
        ]

        if let org = self.org {
            components.queryItems?.append(URLQueryItem(name: "org", value: org.rawValue))
        }

        if let type = self.type {
            components.queryItems?.append(URLQueryItem(name: "type", value: type.rawValue))
        }

        if !self.lang.isEmpty {
            var langString = ""
            var isFirst: Bool = true

            self.lang.forEach { item in
                langString += isFirst ? item.rawValue : ",\(item.rawValue)"
                isFirst = false
            }

            components.queryItems?.append(URLQueryItem(name: "lang", value: langString))
        }

        return components.string ?? ""
    }
}
