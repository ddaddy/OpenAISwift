//
//  Created by Adam Rush - OpenAISwift
//

import Foundation

public struct OpenAI: Codable {
    public let object: String
    public let model: String?
    public let choices: [Choice]
    public let usage: Usage?
}

public struct Choice: Codable {
    public let text: String
    public let finish_reason: String?
}

public struct Usage: Codable {
    public let prompt_tokens: Int
    public let completion_tokens: Int
    public let total_tokens: Int
}
