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

    /// VTubers from [VShojo](https://www.vshojo.com).
    case vshojo = "VShojo"

    /// VTubers from [774inc](https://www.774.ai).
    case seven74Inc = "774inc"

    /// VTubers from [.LIVE](https://vrlive.party/member/).
    case dotLive = ".LIVE"

    /// VTubers from [Aogiri Highschool](https://vrlive.party/member/).
    case aogiriHighschool = "Aogiri Highschool"

    /// VTubers from [Atelier Live](https://twitter.com/atelierlive).
    case atelierLive = "Atelier Live"

    /// VTubers from [Axel-V](https://www.axel-v.com).
    case axelV = "Axel-V"

    /// VTubers from [AkioAIR](https://akioair.com).
    case akioAir = "AkioAIR"

    /// VTubers from [Aetheria](https://twitter.com/aetheriapro).
    case aetheria = "Aetheria"

    /// VTubers from Chucolala Project.
    case chukorara = "Chukorara"

    /// VTubers from [Cloud Horizon](https://www.cloudhorizon.tw).
    case cloudHorizon = "Cloud Horizon"

    /// VTubers from Eilene Family.
    case eileneFamily = "Eilene Family"

    /// VTubers from [Emoechi](https://emoechi.com). R-18+
    case emoechi = "Emoechi"

    /// VTubers from [GuildCQ](https://www.youtube.com/channel/UC01vkmFjimJGiyNZkU5dyvw).
    case guildCQ = "GuildCQ"

    /// VTubers from [Stellar Cycle Campus](https://hoshimeguri.live).
    case stellarCycleCampus = "Hoshimeguri Gakuen"

    /// VTubers from [H.Live](https://twitter.com/hlive_en). R-18+
    case hLive = "H.Live"

    /// VTubers from Iridori.
    case iridori = "Iridori"

    /// VTubers from [idol Corp](https://idol-company.com).
    case idolCorp = "idol Corp"

    /// VTubers from [KAMITSUBAKI](https://kamitsubaki.jp).
    case kamitsubaki = "KAMITSUBAKI"

    /// VTubers from [Kizuna Ai Inc.](https://kizunaai.com).
    case kizunaAiInc = "Kizuna Ai Inc."

    /// VTubers from [KAWAII MUSIC](https://kawaiimusic.jp).
    case kawaiiMusic = "KAWAII MUSIC"

    /// VTubers from KEMOMIMI REFLE
    case kemomimiRefle = "KEMOMIMI REFLE"

    /// VTubers from [KemoV](https://www.kemov-project.com).
    case kemonoFriends = "Kemono Friends"

    /// VTubers from [La Peche Party](https://lapecheparty.info).
    case laPecheParty = "La Peche Party"

    /// VTubers from [Marbles Creators](https://marble-creators.live).
    case marbleCreators = "Marbl_s"

    /// VTubers from [Masquerade](https://cafe-masquerade.com).
    case masquerade = "Masquerade"

    /// VTubers from [MAHA5](https://maha5.com).
    case maha5 = "MAHA5"

    /// VTubers from [MyHolo TV](https://www.myholotv.com).
    case myHoloTV = "MyHolo TV"

    /// VTubers from [Nori Pro](https://noripro.jp).
    case noriPro = "Nori Pro"

    /// VTubers from [NIJIGEN](https://niji-gen.com).
    case nijiGen = "NIJIGEN"

    /// VTubers from [Neo-Porte](https://neo-porte.jp).
    case neoPorte = "Neo-Porte"

    /// VTubers from [production kawaii](https://production-kawaii.com).
    case productionKawaii = "Production Kawaii"

    /// VTubers from [Polygon](https://www.plg.tv).
    case polygon = "Polygon"

    /// VTubers from [Phase-Connect](https://phase-connect.com).
    case phaseConnect = "Phase Connect"

    /// VTubers from [Pixela Project](https://www.pixela.me).
    case pixelaProject = "Pixela Project"

    /// VTubers from [Prism Project](https://www.prismproject.jp).
    case prism = "PRISM"

    /// VTubers from [ProPro Production](https://www.propro-production.com).
    case proPro = "ProPro"

    /// VTubers from [RIOT MUSIC](https://riot-music.com).
    case riotMusic = "Riot Music"

    /// VTubers from [Re:AcT](https://www.v-react.com).
    case react = "ReAcT"

    /// VTubers from [Re:Memories](https://rememories.id).
    case reMemories = "ReMemories"

    /// VTubers from Sleep Monster.
    case sleepMonster = "Sleep Monster"

    /// VTubers from [SquareLive](https://narrator0.wixsite.com/squarelive).
    case squareLive = "SquareLive"

    /// VTubers from [Snacknili](http://snacknili.com).
    case snacknili = "Snacknili"

    /// VTubers from [Shinsougumi](https://sinsogumi.com).
    case shinsougumi = "Shinsougumi"

    /// VTubers from [Tsunderia](https://www.tsunderia.com).
    case tsunderia = "Tsunderia"

    /// VTubers from [Unreal Night Girls](https://unrealnightgirls.jp/ung/). R-18+
    case unrealNightGirls = "Unreal Night Girls"

    /// VTubers from [V Dimension.Creators](https://twitter.com/VD_C_Official).
    case vDimensionCreators = "V Dimension.Creators"

    /// VTubers from [VOICE-ORE](https://www.voice-ore.com).
    case voiceOre = "VOICE-ORE"

    /// VTubers from [ViViD](https://vividnia.com).
    case vivid = "ViViD"

    /// VTubers from [VSpo](https://vspo.jp).
    case vspo = "VSpo"

    /// VTubers from [WACTOR](http://wactor.tech).
    case wactor = "WACTOR"

    /// VTubers from [X enc'ount](https://xencount.com).
    case xencount = "X enc'ount"

    /// VTubers from [Yuni Create](https://yunionwave.com).
    case yuniCreate = "Yuni Create"

    /// VTubers from [Yume Reality](https://yumereality.id).
    case yumeReality = "Yume Reality"

    /// VTubers who stream on Twitch and are not part of any organization.
    case twitchIndependents = "Twitch Independents"

    /// VTubers not part of any organization.
    case independents = "Independents"

    /// Organization that isn't covered by other cases, please submit a pull request to add them!
    case unknown
}
