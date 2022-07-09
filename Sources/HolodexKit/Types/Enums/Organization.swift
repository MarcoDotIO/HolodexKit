//
//  Organization.swift
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

/// Which organization the VTuber(s) is / are apart of.
public enum Organization: String, UnknownCase {
    /// VTubers from [Hololive Production](https://en.hololive.tv).
    case hololive = "Hololive"

    /// VTubers from [Nijisanji](https://www.nijisanji.jp/en).
    case nijisanji = "Nijisanji"

    /// VTubers from [VOMS Project](https://voms.net).
    case voms = "VOMS"

    /// VTubers not part of any organization.
    case independents = "Independents"

    /// Organization that isn't covered by other cases, please submit a pull request to add them!
    case unknown
}
