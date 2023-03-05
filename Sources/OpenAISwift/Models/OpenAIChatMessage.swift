//
//  File.swift
//  
//
//  Created by Darren Jones on 04/03/2023.
//

import Foundation

public struct OpenAIChatMessage: Encodable {
    
    public let role: OpenAIChatMessageRole
    public let content: String
    
    public init(role: OpenAIChatMessageRole, content: String) {
        self.role = role
        self.content = content
    }
}

public enum OpenAIChatMessageRole: String, Encodable {
    /// The system message helps set the behavior of the assistant.
    case system
    /// The user messages help instruct the assistant.
    case user
    /// The assistant messages help store prior responses.
    case assistant
}
