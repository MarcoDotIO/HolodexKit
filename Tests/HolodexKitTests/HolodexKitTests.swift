//
// HolodexKitTests.swift
// HolodexKit
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

import XCTest
@testable import HolodexKit

final class HolodexKitTests: XCTestCase {
    func testThatVerifiesThatHolodexFetchesChannelInformation() async {
        do {
            // Given
            let mockHolodex = MockHolodex()

            // When
            guard let result = try await mockHolodex.getChannels(withParameters: ChannelParameter()) else {
                XCTFail("Cannot find channels.")
                return
            }

            // Then
            XCTAssertEqual(result.count, 2, "The count of channels is not correct.")

            XCTAssertEqual(result[0].englishName!, "Akai Haato", "Could not find the english name of the channel.")
            XCTAssertEqual(result[0].name, "HAACHAMA Ch 赤井はあと", "Could not find the name of the channel.")
            XCTAssertEqual(result[0].type, .vtuber, "Could not find the channel type of the channel.")

            XCTAssertEqual(result[1].englishName!, "Usada Pekora", "Could not find the english name of the channel.")
            XCTAssertEqual(result[1].name, "Pekora Ch. 兎田ぺこら", "Could not find the name of the channel.")
            XCTAssertEqual(result[1].type, .vtuber, "Could not find the channel type of the channel.")
        } catch {
            XCTFail("GENERAL CHANNEL TEST FAILED WITH ERROR: \(error)")
        }
    }

    func testThatGetsChannelByIdAndVerifiesTheValidityOfTheRetrievedData() async {
        do {
            // Given
            let mockHolodex = MockHolodex()

            // When
            guard let result = try await mockHolodex.getChannelById(using: "NULL") else {
                XCTFail("Cannot find channel.")
                return
            }

            // Then
            XCTAssertEqual(
                result.name,
                "Sushi [Hololive and Vtubers]",
                "Could not find the name of the channel."
            )
            XCTAssertEqual(
                result.description!,
                "I make translated clips from Hololive and Vtubers.\n",
                "Could not find the description of the channel."
            )
            XCTAssertEqual(
                Int(result.subscriberCount!), 163000,
                "Could not find the subscription count of the channel."
            )
        } catch {
            XCTFail("CHANNEL ID TEST FAILED WITH ERROR: \(error)")
        }
    }

    func testThatGetsVideoByIdAndVerifiesTheValidityOfTheRetrievedData() async {
        do {
            // Given
            let mockHolodex = MockHolodex()

            // Let
            guard let result = try await mockHolodex.getVideo(
                withVideoId: "",
                languages: [.all],
                andDoesIncludeComments: false
            ) else {
                XCTFail("Cannot find video.")
                return
            }

            // Then
            XCTAssertEqual(
                result.title!,
                "【#ぺこラプ】ラプちゃんとギリギリ泥酔トークするぞ!!!!!!!ぺこ!【ホロライブ/兎田ぺこら】",
                "Cannot find the title for the video."
            )
            XCTAssertEqual(result.type, .stream, "Video type cannot be found for this video.")
            XCTAssertEqual(result.duration!, 5120, "Video duration cannot be found for this video.")

            XCTAssertEqual(result.clips?.count, 48, "Video clips cannot be found for this video.")
            XCTAssertEqual(result.clips?[0].id, "axMf00unfKU", "Video clip with ID cannot be found for this video.")
            XCTAssertEqual(result.clips?[0].status, .past, "Video clip with Status cannot be found for this video.")
        } catch {
            XCTFail("VIDEO ID TEST FAILED WITH ERROR: \(error)")
        }
    }

    func testThatGetsVideosFromAChannelByIdAndVerifiesTheValidityOfTheRetrievedData() async {
        do {
            // Given
            let mockHolodex = MockHolodex()

            // Let
            guard let result = try await mockHolodex.getVideosByChannelId(
                withId: "UC1DCedRgGHBdm81E1llLhOQ",
                searchType: .videos,
                andParams: VideoParameter()
            ) else {
                XCTFail("Cannot find videos.")
                return
            }

            // Then
            XCTAssertEqual(result.count, 25, "Count of result is not correct.")

            XCTAssertEqual(
                result[0].title!,
                "【ドラクエ11S】ぺこらVSノエル マジスロガチ対決!!!!!!!ぺこ!【ホロライブ/兎田ぺこら】",
                "Could not find the title of the channel video."
            )
            XCTAssertEqual(result[0].topicId!, "Dragon_Quest", "Could not find the topic id of the channel video.")
            XCTAssertEqual(result[0].status!, .upcoming, "Could not find the status of the channel video.")

            XCTAssertEqual(result[0].channel!.org, .hololive, "Could not find the organization for the channel.")
            XCTAssertEqual(result[0].channel!.englishName, "Usada Pekora", "Could not find the name of the channel.")
            XCTAssertEqual(result[0].channel!.type!, .vtuber, "Could not find the type for the channel.")
        } catch {
            XCTFail("CHANNEL ID VIDEOS TEST FAILED WITH ERROR: \(error)")
        }
    }

    func testThatGetsLiveVideoFromChannelIdAndVerifiesTheValidityOfTheRetrievedData() async {
        do {
            // Given
            let mockHolodex = MockHolodex()

            // Let
            guard let result = try await mockHolodex.getLiveVideosByChannelId(
                channelIds: ["UChAnqc_AY5_I3Px5dig3X1Q"]
            ) else {
                XCTFail("Cannot find videos.")
                return
            }

            // Then
            XCTAssertEqual(result.count, 1, "Count of result is not correct.")

            XCTAssertEqual(
                result[0].title,
                "【#叶えてころさん】告知アリ★七夕なので、天女が願い事を聞きに来ました!2022【ホロライブ/戌神ころね】",
                "Could not find the title of the channel live video."
            )
            XCTAssertEqual(result[0].type, .stream, "Could not find the live video's type.")

            XCTAssertEqual(
                result[0].channel.englishName!,
                "Inugami Korone",
                "Could not find the channel's English name."
            )
            XCTAssertEqual(result[0].channel.name, "Korone Ch. 戌神ころね", "Could not find the channel's name.")
            XCTAssertEqual(result[0].channel.org, .hololive, "Could not find the channel's organization.")
        } catch {
            XCTFail("CHANNEL ID LIVE VIDEOS TEST FAILED WITH ERROR: \(error)")
        }
    }

    func testThatGetsCurrentLiveVideosAndVerifiesTheValidityOfTheRetrievedData() async {
        do {
            // Given
            let mockHolodex = MockHolodex()

            // Let
            guard let result = try await mockHolodex.getLiveVideos(withParameters: VideoParameter()) else {
                XCTFail("Cannot find videos.")
                return
            }

            // Then
            XCTAssertEqual(result.count, 10, "Count of result is not correct.")

            XCTAssertEqual(result[0].liveViewers!, 5442, "Could not find the video's live viewers amount.")
            XCTAssertEqual(
                result[0].title!,
                "【風のクロノア1&2アンコール】みんなでわっふー! door to phantomile【ホロライブ/白上フブキ】",
                "Could not find the video's title."
            )
            XCTAssertEqual(result[0].status!, .live, "Could not find the video's status.")

            XCTAssertEqual(
                result[0].channel.englishName!,
                "Shirakami Fubuki",
                "Could not find the channel's English name."
            )
            XCTAssertEqual(result[0].channel.org!, .hololive, "Could not find the channel's Organization.")
            XCTAssertEqual(result[0].channel.name, "フブキCh。白上フブキ", "Could not find the channel's name.")
        } catch {
            XCTFail("LIVE VIDEOS TEST FAILED WITH ERROR: \(error)")
        }
    }

    func testThatGetsVideosWithParametersAndVerifiesTheValidityOfTheRetrievedData() async {
        do {
            // Given
            let mockHolodex = MockHolodex()

            // Let
            guard let result = try await mockHolodex.getVideos(withParameters: VideoParameter()) else {
                XCTFail("Cannot find videos.")
                return
            }

            // Then
            XCTAssertEqual(result.count, 10, "Count of result is not correct.")

            XCTAssertEqual(
                result[0].title!,
                "【free Chat】おかころデビュー3周年!めでたいので限定フリーチャット(･ω･人･ω･)♪",
                "Could not find the video's title."
            )
            XCTAssertEqual(result[0].status!, .missing, "Could not find the video's status.")
            XCTAssertEqual(result[0].topicId!, "Anniversary", "Could not find the video's topic ID.")

            XCTAssertEqual(
                result[0].channel.englishName!,
                "Inugami Korone",
                "Could not find the channel's English name."
            )
            XCTAssertEqual(result[0].channel.id, "UChAnqc_AY5_I3Px5dig3X1Q", "Could not find the channel's ID.")
            XCTAssertEqual(
                result[0].channel.photo,
                "https://yt3.ggpht.com/ytc/AKedOLTGCZfOdpj8vnNV4hbPvxJrlbERhgBWnBrWKbS5WQ=s800-c-k-c0x00ffffff-no-rj",
                "Could not find the channel's profile picture."
            )
        } catch {
            XCTFail("VIDEOS TEST FAILED WITH ERROR: \(error)")
        }
    }

    func testThatVerifiesThatHolodexInitializesWithADummyServer() {
        // Given
        let holodexDummy = Holodex()

        // Let
        let fullUrl = holodexDummy.fullUrl

        // Then
        XCTAssertEqual(
            fullUrl,
            "https://stoplight.io/mocks/holodex/holodex/11620234",
            "Could not find the mock server."
        )
    }

    func testThatVerifiesThatHolodexInitializesWithAProductionServer() {
        // Given
        let holodexProduction = Holodex(withKey: "DUMMY-KEY")

        // Let
        let fullUrl = holodexProduction.fullUrl

        // Then
        XCTAssertEqual(fullUrl, "https://holodex.net/api/v2", "Could not find the production server.")
    }
}
