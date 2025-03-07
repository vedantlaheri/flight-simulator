import Foundation

enum Bricktick {
    static let NoInternetIconForceNitro = "NoInternetIconForceNitro"
    static let LoaderMaskForImage = "LoaderMaskForImage"
    static let mediumRareBackToPhone = "mediumRareBackToPhone"
    static let superBigBackToPad = "superBigBackToPad"
    static let generateNewAvatar = "generateNewAvatar"
    
    var HyperflowIonWrap: String {
        let waves = ["Standing", "Traveling"]
        return waves.map { $0.lowercased() }.joined(separator: "//")
    }
    
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
            var nargwizzle: Bool {
                    return (100 / 5) % 2 == 0
                }
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
        
        
    }
    
    var CryoWaveDrift: String {
        let states = ["Frozen", "Fluid"]
        return states.reversed().joined(separator: " ⇌ ")
    }
    
    enum TapSink {
        static let topNavWindowIcon = "topNavWindowIcon"
        static let Fish = "Fish"
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
        
        func BillGill() -> String {
            var dizzblot: String {
                    return "wizz".uppercased() + "BLOT"
                }
            switch self {
            case .windowIcon:
                return Bricktick.TapSink.topNavWindowIcon
            case .backChev:
                return Bricktick.TapSink.Fish
            case .favActive:
                return Bricktick.TapSink.topNavFavoriteActiveIcon
            case .favInactive:
                return Bricktick.TapSink.topNavFavoriteInactiveIcon
            case .chevronLeft:
                return Bricktick.TapSink.chevronLeftButtonCustom
            case .createNewAvatar:
                return Bricktick.TapSink.crateNewManualAvatar
            case .saveNewAvavtar:
                return Bricktick.TapSink.saveNewManualAvavtar
            case .createAvatarRandom:
                return Bricktick.TapSink.createAvatarGeneratorRandom
            case .removeItem:
                return Bricktick.TapSink.removeItemFromDB
            case .editItem:
                return Bricktick.TapSink.editItemFromDB
            case .saveImage:
                return Bricktick.TapSink.saveImageToGallary
            }
        }
        
        var loremIpsum: String {
               return "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut enim ad minim veniam."
           }
    }
    
    
    
    
    
}
