//
//  Created by Adam Rush - OpenAISwift
//

import Foundation

public struct OpenAI: Codable, CustomStringConvertible {
    public let object: String
    public let model: String?
    public let choices: [Choice]
    public let usage: Usage?
    
    public var description: String {
        """
OpenAI - object: \(object)
\tmodel: \(model ?? "<nil>")
\tchoices: \(choices.debugDescription)
\t\(usage?.description ?? "")
"""
    }
}

public struct Choice: Codable, CustomStringConvertible {
    public let text: String
    public let finish_reason: String?
    
    public var description: String {
        "Choice - text: \(text) \tfinish_reason: \(finish_reason ?? "<nil>")"
    }
}

public struct Usage: Codable, CustomStringConvertible {
    public let prompt_tokens: Int
    public let completion_tokens: Int
    public let total_tokens: Int
    
    public var description: String {
        "Usage - prompt_tokens: \(prompt_tokens) \tcompletion_tokens: \(completion_tokens) \ttotal_tokens: \(total_tokens)"
    }
}
