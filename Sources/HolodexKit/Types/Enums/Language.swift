//
//  Language.swift
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

/// Filter parameter for the video's language.
public enum Language: String, UnknownCase {
    /// Include all languages.
    case all = "all"

    /// Include only English Videos.
    case english = "en"

    /// Include only Spanish Videos.
    case spanish = "es"

    /// Include only Indonesian Videos.
    case indonesian = "id"

    /// Include only Japanese Videos.
    case japanese = "ja"

    /// Include only Korean Videos.
    case korean = "ko"

    /// Include only Russian Videos.
    case russian = "ru"

    /// Include only Chinese Videos.
    case chinese = "zh"

    /// An unknown language type, please make a pull request to add support for it!
    case unknown
}
