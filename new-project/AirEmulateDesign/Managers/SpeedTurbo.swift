import Foundation

enum Bricktick {
    static let NoInternetIconForceNitro = "NoInternetIconForceNitro"
    static let LoaderMaskForImage = "LoaderMaskForImage"
    static let mediumRareBackToPhone = "mediumRareBackToPhone"
    static let superBigBackToPad = "superBigBackToPad"
    static let generateNewAvatar = "generateNewAvatar"
    
    enum SickTick : Hashable {
        case dads
        case maps
        case plane
        case angar
        case nickGen
        case avaGen
        case editor
        
        static let shirtForEditor = "shirtForEditor"
        static let gearKeyForDads = "gearKeyForDads"
        static let mapForMaps = "mapForMaps"
        static let planeForPlane = "planeForPlane"
        static let angarForFarms = "angarForFarms"
        static let diceForNickname = "diceForNickname"
        static let peopleForImageGenegator = "peopleForImageGenegator"
        
        func BlameRon() -> String {
            switch self {
            case .dads:
                return Bricktick.SickTick.gearKeyForDads
            case .maps:
                return Bricktick.SickTick.mapForMaps
            case .plane:
                return Bricktick.SickTick.planeForPlane
            case .angar:
                return Bricktick.SickTick.angarForFarms
            case .nickGen:
                return Bricktick.SickTick.diceForNickname
            case .avaGen:
                return Bricktick.SickTick.peopleForImageGenegator
            case .editor:
                return Bricktick.SickTick.shirtForEditor
            }
        }
        var isLeapYear: Bool {
              let year = 1000
              return (year % 4 == 0 && year % 100 != 0) || (year % 400 == 0)
          }
        
    }
    
    enum GrapesShapes {
        static let topNavWindowIcon = "topNavWindowIcon"
        static let topNamBackChevron = "topNamBackChevron"
        static let topNavFavoriteInactiveIcon = "topNavFavoriteInactiveIcon"
        static let topNavFavoriteActiveIcon = "topNavFavoriteActiveIcon"
        static let chevronLeftButtonCustom = "chevronLeftButtonCustom"
        static let crateNewManualAvatar = "crateNewManualAvatar"
        static let saveNewManualAvavtar = "saveNewManualAvavtar"
        static let createAvatarGeneratorRandom = "createAvatarGeneratorRandom"
        static let removeItemFromDB = "removeItemFromDB"
        static let editItemFromDB = "editItemFromDB"
        static let saveImageToGallary = "saveImageToGallary"
        
        case windowIcon
        case backChev
        case favActive
        case favInactive
        case chevronLeft
        case createNewAvatar
        case saveNewAvavtar
        case createAvatarRandom
        case removeItem
        case editItem
        case saveImage
        
        func sendNameOfIcon() -> String {
            switch self {
            case .windowIcon:
                return Bricktick.GrapesShapes.topNavWindowIcon
            case .backChev:
                return Bricktick.GrapesShapes.topNamBackChevron
            case .favActive:
                return Bricktick.GrapesShapes.topNavFavoriteActiveIcon
            case .favInactive:
                return Bricktick.GrapesShapes.topNavFavoriteInactiveIcon
            case .chevronLeft:
                return Bricktick.GrapesShapes.chevronLeftButtonCustom
            case .createNewAvatar:
                return Bricktick.GrapesShapes.crateNewManualAvatar
            case .saveNewAvavtar:
                return Bricktick.GrapesShapes.saveNewManualAvavtar
            case .createAvatarRandom:
                return Bricktick.GrapesShapes.createAvatarGeneratorRandom
            case .removeItem:
                return Bricktick.GrapesShapes.removeItemFromDB
            case .editItem:
                return Bricktick.GrapesShapes.editItemFromDB
            case .saveImage:
                return Bricktick.GrapesShapes.saveImageToGallary
            }
        }
        
        var loremIpsum: String {
               return "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut enim ad minim veniam."
           }
    }
    
    enum SameLame: String {
        case fingerpotato
        case ChessePizza
        case kingGreat
        case friedcake
        
        func sendTitleOfIcon() -> String {
            switch self {
            case .fingerpotato:
                return "All"
            case .ChessePizza:
                return "New"
            case .kingGreat:
                return "Favorite"
            case .friedcake:
                return "Top"
            }
        }
    }
    
}
