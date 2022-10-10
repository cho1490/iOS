protocol Payable {
    func pay()
}

enum CardType {
    case check
    case credit
    case prepaid
}

struct CardOwner {
    let name: String
    let cardType: CardType
}

struct CheckCard: Payable {
    let owner: CardOwner
    func pay() {
        print("\(owner.name), \(owner.cardType) : pay")
    }
}

struct CreditCard: Payable {
    let owner: CardOwner
    func pay() {
        print("\(owner.name), \(owner.cardType) : pay")
    }
}

struct PrepaidCard: Payable {
    let owner: CardOwner
    func pay() {
        print("\(owner.name), \(owner.cardType) : pay")
    }
}

struct CardFactory {
    static func makeCard(owner: CardOwner) -> Payable {
        switch owner.cardType {
        case .check:
            return CheckCard(owner: owner)
        case .credit:
            return CreditCard(owner: owner)
        case .prepaid:
            return PrepaidCard(owner: owner)
        }
    }
}

func main() {
    let newCard = CardFactory.makeCard(owner: CardOwner(name: "조상현", cardType: .check))
    newCard.pay()
}

main() 
