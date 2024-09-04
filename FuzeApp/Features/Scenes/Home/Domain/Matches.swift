import Foundation

struct Matches: Decodable {
    let beginAt: Double?
    let detailedStats, draw: Bool
    let endAt: String?
    let forfeit: Bool
    let gameAdvantage: String?
    let games: [Game]
    let id: Int
    let league: League
    let leagueID: Int
    let live: Live
    let mapPicks: String?
    let matchType: String
    let modifiedAt: Date
    let name: String
    let numberOfGames: Int
    let opponents: [String]
    let originalScheduledAt: Date
    let rescheduled: Bool
    let results: [String]
    let scheduledAt: Date
    let serie: Serie
    let serieID: Int
    let slug, status: String
    let streamsList: [StreamsList]
    let tournament: Tournament
    let tournamentID: Int
    let videogame: Videogame
    let videogameTitle, videogameVersion, winner, winnerID: String?
    let winnerType: String

    enum CodingKeys: String, CodingKey {
        case beginAt = "begin_at"
        case detailedStats = "detailed_stats"
        case draw
        case endAt = "end_at"
        case forfeit
        case gameAdvantage = "game_advantage"
        case games, id, league
        case leagueID = "league_id"
        case live
        case mapPicks = "map_picks"
        case matchType = "match_type"
        case modifiedAt = "modified_at"
        case name
        case numberOfGames = "number_of_games"
        case opponents
        case originalScheduledAt = "original_scheduled_at"
        case rescheduled, results
        case scheduledAt = "scheduled_at"
        case serie
        case serieID = "serie_id"
        case slug, status
        case streamsList = "streams_list"
        case tournament
        case tournamentID = "tournament_id"
        case videogame
        case videogameTitle = "videogame_title"
        case videogameVersion = "videogame_version"
        case winner
        case winnerID = "winner_id"
        case winnerType = "winner_type"
    }
}

struct Game: Decodable {
    let beginAt: Double?
    let complete, detailedStats: Bool
    let endAt: String?
    let finished, forfeit: Bool
    let id: Int
    let length: String?
    let matchID, position: Int
    let status: String
    let winner: Winner
    let winnerType: String

    enum CodingKeys: String, CodingKey {
        case beginAt = "begin_at"
        case complete
        case detailedStats = "detailed_stats"
        case endAt = "end_at"
        case finished, forfeit, id, length
        case matchID = "match_id"
        case position, status, winner
        case winnerType = "winner_type"
    }
}

struct Winner: Decodable {
    let id: String?
    let type: String
}

struct League: Decodable {
    let id: Int
    let imageURL: String?
    let modifiedAt: Date
    let name, slug: String
    let url: String?

    enum CodingKeys: String, CodingKey {
        case id
        case imageURL = "image_url"
        case modifiedAt = "modified_at"
        case name, slug, url
    }
}

struct Live: Decodable {
    let opensAt: String?
    let supported: Bool
    let url: String?

    enum CodingKeys: String, CodingKey {
        case opensAt = "opens_at"
        case supported, url
    }
}

struct Serie: Decodable {
    let beginAt: Double?
    let endAt: Date
    let fullName: String
    let id, leagueID: Int
    let modifiedAt: Date
    let name: String?
    let season, slug: String
    let winnerID, winnerType: String?
    let year: Int

    enum CodingKeys: String, CodingKey {
        case beginAt = "begin_at"
        case endAt = "end_at"
        case fullName = "full_name"
        case id
        case leagueID = "league_id"
        case modifiedAt = "modified_at"
        case name, season, slug
        case winnerID = "winner_id"
        case winnerType = "winner_type"
        case year
    }
}

struct StreamsList: Decodable {
    let embedURL: String
    let language: String
    let main, official: Bool
    let rawURL: String

    enum CodingKeys: String, CodingKey {
        case embedURL = "embed_url"
        case language, main, official
        case rawURL = "raw_url"
    }
}

struct Tournament: Decodable {
    let beginAt: Double?
    let detailedStats: Bool
    let endAt: Date
    let hasBracket: Bool
    let id, leagueID: Int
    let liveSupported: Bool
    let modifiedAt: Date
    let name, prizepool: String
    let serieID: Int
    let slug, tier: String
    let winnerID: String?
    let winnerType: String

    enum CodingKeys: String, CodingKey {
        case beginAt = "begin_at"
        case detailedStats = "detailed_stats"
        case endAt = "end_at"
        case hasBracket = "has_bracket"
        case id
        case leagueID = "league_id"
        case liveSupported = "live_supported"
        case modifiedAt = "modified_at"
        case name, prizepool
        case serieID = "serie_id"
        case slug, tier
        case winnerID = "winner_id"
        case winnerType = "winner_type"
    }
}

struct Videogame: Decodable {
    let id: Int
    let name, slug: String
}
