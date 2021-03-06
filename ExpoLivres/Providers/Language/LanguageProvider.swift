import Foundation

// MARK: - Language

enum Language: String, Codable {
    case french
    case english
}

// MARK: - LanguageProvider

protocol LanguageProvider {
    var selectedLanguage: Language { get }
    func set(language: Language)
    
    // Translations
    
    // MARK: UserInfo
    var userInfoTitle: String { get }
    var userInfoOrganization: String { get }
    var userInfoPo: String { get }
    var userInfoName: String { get }
    var userInfoEmail: String { get }
    var required: String { get }
    var optional: String { get }
    
    // MARK: ListView
    var listTitle: String { get }
    var listEmptyHeading: String { get }
    var listBodyScan: String { get }
    var listBodySubmit: String { get }
    var listSwipeMessage: String { get }
    
    // MARK: Scan
    var scanNotFoundTitle: String { get }
    func scanNotFoundMessage(_ isbn: String) -> String
    
    // MARK: Email
    var emailNotConfiguredTitle: String { get }
    var emailNotConfiguredMessage: String { get }
    var emailThankYou: String { get }
    
    // MARK: Submission
    var postSubmissionTitle: String { get }
    var postSubmissionMessage: String { get }
    var clearAction: String { get }
    var keepAction: String { get }
    var save: String { get }
    var addAnyway: String { get }
    var remove: String { get }
    var submit: String { get }
    var scan: String { get }
    var language: String { get }
    var cancel: String { get }
    var unknown: String { get }
    
    // MARK: Migration
    func performMigrationIfRequired()
}

// MARK: - ProductionLanguageProvider

class ProductionLanguageProvider: LanguageProvider {
    
    // MARK: - Stored Properties
    
    private let userDefaults: UserDefaults
    
    // MARK: - Lifecycle
    
    init(userDefaults: UserDefaults) {
        self.userDefaults = userDefaults
    }
    
    // MARK: - UserDefaultsKey
    
    struct UserDefaultsKey {
        static let selectedLanguage = "LanguageProvider.selectedLanguage"
        static let hasPerformedMigration = "LanguageProvider.hasPerformedMigration"
    }
    
    // MARK: Language
    struct LanguageContainer: Codable {
        let language: Language
    }
    
    private(set) var selectedLanguage: Language {
        get {
            guard
                let rawValue = userDefaults.string(forKey: UserDefaultsKey.selectedLanguage),
                let selectedLanguage = Language(rawValue: rawValue)
            else { return .french }
            
            return selectedLanguage
        }
        set {
            userDefaults.set(newValue.rawValue, forKey: UserDefaultsKey.selectedLanguage)
        }
    }
    
    func set(language: Language) {
        self.selectedLanguage = language
    }
    
    // MARK: - Translations
    
    // MARK: - UserInfo
    
    var userInfoTitle: String {
        switch selectedLanguage {
        case .french:
            return "Entrez vos renseignements"
        case .english:
            return "Enter your information"
        }
    }
    
    var userInfoOrganization: String {
        switch selectedLanguage {
        case .french:
            return "Organisation"
        case .english:
            return "Organization"
        }
    }
    
     var userInfoPo: String {
        switch selectedLanguage {
        case .french:
            return "PO #"
        case .english:
            return "PO #"
        }
    }
    
     var userInfoName: String {
        switch selectedLanguage {
        case .french:
            return "Nom"
        case .english:
            return "Name"
        }
    }
    
     var userInfoEmail: String {
        switch selectedLanguage {
        case .french:
            return "Email"
        case .english:
            return "Email"
        }
    }
    
     var required: String {
        switch selectedLanguage {
        case .french:
            return "requis"
        case .english:
            return "required"
        }
    }
    
    var optional: String {
        switch selectedLanguage {
        case .french:
            return "facultatif"
        case .english:
            return "optional"
        }
    }
    
    // MARK: - ListView
    
    var listTitle: String {
        switch selectedLanguage {
        case .french:
            return "Liste"
        case .english:
            return "List"
        }
    }
    
    var listEmptyHeading: String {
        switch selectedLanguage {
        case .french:
            return "Aucun livre sur la liste"
        case .english:
            return "No items in list"
        }
    }
    
    var listBodyScan: String {
        switch selectedLanguage {
        case .french:
            return "Ajouter un titre en appuyant sur le bouton du scanner en bas à droite de l\'écran"
        case .english:
            return "Add books to your list by pressing the scan button in the bottom right corner of your screen"
        }
    }
    
    var listBodySubmit: String {
        switch selectedLanguage {
        case .french:
            return "Appuyer sur Envoyer lorsque vous avez fini"
        case .english:
            return "Press submit when finished"
        }
    }
    
    var listSwipeMessage: String {
        switch selectedLanguage {
        case .french:
            return "Glisser vers la gauche pour supprimer"
        case .english:
            return "Swipe item left to remove from list"
        }
    }
    
    // MARK: - Scan
    
    var scanNotFoundTitle: String {
        switch selectedLanguage {
        case .french:
            return "Oops!"
        case .english:
            return "Oops!"
        }
    }
    
    func scanNotFoundMessage(_ isbn: String) -> String {
        switch selectedLanguage {
        case .french:
            return "Désolés, l\'isbn \(isbn) n\'est pas dans notre système. Veuillez apporter votre livre à la caisse."
        case .english:
            return "We\'re sorry, isbn: \(isbn) not found. Please try again or bring book to front desk."
        }
    }
    
    // MARK: - Email
    
    var emailNotConfiguredTitle: String {
        switch selectedLanguage {
        case .french:
            return "Oops!"
        case .english:
            return "Oops!"
        }
    }
    
    var emailNotConfiguredMessage: String {
        switch selectedLanguage {
        case .french:
            return "Une adresse courriel en vigueur sur votre appareil est requise pour soumettre votre commande."
        case .english:
            return "Email is required to submit your order. Please setup email on your device."
        }
    }
    
    var emailThankYou: String {
        switch selectedLanguage {
        case .french:
            return "Merci pour votre commande"
        case .english:
            return "Thank you for your order"
        }
    }
    
    // MARK: - Submission
    
    var postSubmissionTitle: String {
        switch selectedLanguage {
        case .french:
            return "Merci!"
        case .english:
            return "Thank you!"
        }
    }
    
    var postSubmissionMessage: String {
        switch selectedLanguage {
        case .french:
            return "Votre commande a été soumise. Passez à la caisse pour confirmer votre commande."
        case .english:
            return "Your list has been sent. Proceed to the front desk for confirmation."
        }
    }
    
    var clearAction: String {
        switch selectedLanguage {
        case .french:
            return "Supprimer liste"
        case .english:
            return "Clear list"
        }
    }
    
    var keepAction: String {
        switch selectedLanguage {
        case .french:
            return "Garder liste"
        case .english:
            return "Keep list"
        }
    }
    
    var save: String {
        switch selectedLanguage {
        case .french:
            return "OK"
        case .english:
            return "OK"
        }
    }
    
    var addAnyway: String {
        switch selectedLanguage {
        case .french:
            return "Ajouter quand même"
        case .english:
            return "Add anyway"
        }
    }
    
    var remove: String {
        switch selectedLanguage {
        case .french:
            return "Supprimer"
        case .english:
            return "Remove"
        }
    }

    var submit: String {
        switch selectedLanguage {
        case .french:
            return "Envoyer"
        case .english:
            return "Submit"
        }
    }
    
    var scan: String {
        switch selectedLanguage {
        case .french:
            return "Scan"
        case .english:
            return "Scan"
        }
    }
    
    var language: String {
        switch selectedLanguage {
        case .french:
            return "Langue"
        case .english:
            return "Language"
        }
    }
    
    var cancel: String {
        switch selectedLanguage {
        case .french:
            return "Annuler"
        case .english:
            return "Cancel"
        }
    }
    
    var unknown: String {
        switch selectedLanguage {
        case .french:
            return "Inconnu"
        case .english:
            return "Unknown"
        }
    }
    
    // MARK: - Migration
    
    func performMigrationIfRequired() {
        let hasPerformedMigration = userDefaults.bool(forKey: UserDefaultsKey.hasPerformedMigration)
        guard hasPerformedMigration == false else { return }
        
        userDefaults.set(true, forKey: UserDefaultsKey.hasPerformedMigration)
        
        let previousLanguageKey = "JFCUserLanguagePrefsKey"
        let selectedLanguageRawValue = userDefaults.integer(forKey: previousLanguageKey)
        self.selectedLanguage = selectedLanguageRawValue == 0 ? .french : .english
    }
}
