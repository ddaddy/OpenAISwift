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
    private let _text: String? // Completions returns text
    private let delta: Delta? // Chat stream returns delta
    private let messageDelta: Delta? // Chat non stream returns message
    public let finish_reason: String?
    
    public var text: String {
        return _text ?? delta?.content ?? messageDelta?.content ?? ""
    }
    
    enum CodingKeys: String, CodingKey {
        case _text = "text"
        case messageDelta = "message"
        case delta, finish_reason
    }
    
    public var description: String {
        "Choice - text: \(_text ?? "<nil>") \tdelta: \(delta?.description ?? "<nil>") \tmessageDelta: \(messageDelta?.description ?? "<nil>") \tfinish_reason: \(finish_reason ?? "<nil>")"
    }
}

public struct Delta: Codable, CustomStringConvertible {
    public let role: String?
    public let content: String?
    
    public var description: String {
        "Delta - role: \(role ?? "<nil>") \tcontent: \(content ?? "<nil>")"
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
