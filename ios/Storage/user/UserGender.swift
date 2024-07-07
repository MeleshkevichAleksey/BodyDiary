public enum UserGender: String, Codable, CaseIterable, Identifiable {
    
    public var id: String {
        rawValue
    }
    
    case male
    
    case female
}
