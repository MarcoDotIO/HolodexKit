//
//  ContentView.swift
//  iOS Example
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

import SwiftUI
import HolodexKit

struct ContentView: View {
    @State private var videos = [Video]()
    @State private var channels = [Channel]()

    var body: some View {
        TabView {
            VideoView(videos: videos)
                .tabItem {
                    Label("Videos", systemImage: "video.fill")
                }

            ChannelView(channels: channels)
                .tabItem {
                    Label("Channels", systemImage: "person.fill")
                }
        }
        .task {
            do {
                let apiKey = "INSERT-YOUR-API-KEY-HERE"
                let holodex = Holodex(withKey: apiKey)

                let videosParam = VideoParameter(limit: 10, org: .hololive)
                guard let videos = try await holodex.getLiveVideos(
                    withParameters: videosParam
                ) else { return }

                let channelsParam = ChannelParameter(limit: 10, org: .hololive)
                guard let channels = try await holodex.getChannels(
                    withParameters: channelsParam
                ) else { return }

                self.videos = videos
                self.channels = channels
            } catch {
                print("DEBUG: ERROR DETAILS - \(error)")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
