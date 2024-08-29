//
//  Matches.swift
//  FuzeApp
//
//  Created by Thiago Monteiro on 28/08/24.
//

struct Matches: Decodable {
    let beginAt: String?
    let detailedStats: Bool
    let draw: Bool
    let endAt: String?
    let forfeit: Bool
    let gameAdvantage: String?
    let games: [Game]
    
    enum CodingKeys: String, CodingKey {
        case beginAt = "begin_at"
        case detailedStats = "detailed_stats"
        case draw
        case endAt = "end_at"
        case forfeit
        case gameAdvantage = "game_advantage"
        case games
    }
}

struct Game: Decodable {
    let beginAt: String?
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

struct Winner: Codable {
    let id: String?
    let type: String
}
