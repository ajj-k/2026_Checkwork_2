import Foundation
import Combine

// TODO 1〜5 を完成させよう。名前・引数・型は変更しないでください。
enum PurchaseError: Error, Equatable {
    case invalidAmount
    case soldOut
    case insufficientFunds(shortage: Int)
}

func parseAmount(_ text: String) throws -> Int {
    // TODO 1: 整数に変換できない、または負の値なら invalidAmount を throw。
    // 0 以上の整数ならその値を返す。仮の return を置き換えよう。
    return 0
}

final class VendingMachine {
    let price = 120
    private(set) var stock = 2

    func buy(amount: Int) throws -> Int {
        // TODO 2: 次の順番で確認する。
        // 負の金額 → invalidAmount、在庫0 → soldOut、
        // 120円未満 → insufficientFunds(shortage: 不足額) を throw。
        // 成功時だけ在庫を1減らし、おつりを返す。
        return 0
    }
}

final class PurchaseModel: ObservableObject {
    private let machine = VendingMachine()
    @Published private(set) var stock = 2
    @Published private(set) var message = "金額を入力して購入しよう。"
    @Published private(set) var isProcessing = false

    func purchase(text: String) {
        isProcessing = true
        // TODO 5: defer を使い、成功・失敗どちらでも終了時に
        // isProcessing を false に戻す。各 catch に同じ処理を書かない。

        // TODO 3: do-catch と try で parseAmount → machine.buy の順に呼ぶ。
        // 成功時は stock を machine.stock に更新し、
        // message = "購入成功！おつり：\(change)円" として return。
        // invalidAmount → "0以上の整数を入力してください。"
        // soldOut → "売り切れです。"
        // insufficientFunds → "あと\(shortage)円必要です。"
        // その他 → "予期しないエラーです。"
        message = "TODO 3 を完成させよう。"
    }

    func previewAmount(_ text: String) -> Int? {
        // TODO 4: try? で parseAmount を呼ぶ。失敗したら nil を返す。
        return nil
    }
}
