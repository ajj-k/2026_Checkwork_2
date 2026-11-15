import Foundation

var failures = 0
func check(_ condition: Bool, _ label: String) {
    print("\(condition ? "PASS" : "FAIL")  \(label)")
    if !condition { failures += 1 }
}
func expectError(_ expected: PurchaseError, _ label: String, action: () throws -> Int) {
    do {
        _ = try action()
        check(false, label)
    } catch {
        check((error as? PurchaseError) == expected, label)
    }
}
for value in [0, 120, 150] {
    check((try? parseAmount(String(value))) == value, "問1：\(value)を変換")
}
for value in ["", "abc", "-1", "1.5", String(repeating: "9", count: 50)] {
    expectError(.invalidAmount, "問1：不正入力 \(value)") { try parseAmount(value) }
}
let machine = VendingMachine()
expectError(.invalidAmount, "問2：負の金額") { try machine.buy(amount: -1) }
expectError(.insufficientFunds(shortage: 120), "問2：0円") { try machine.buy(amount: 0) }
expectError(.insufficientFunds(shortage: 1), "問2：119円") { try machine.buy(amount: 119) }
check(machine.stock == 2, "問2：失敗時は在庫不変")
check((try? machine.buy(amount: 120)) == 0 && machine.stock == 1, "問2：ちょうど120円")
check((try? machine.buy(amount: 150)) == 30 && machine.stock == 0, "問2：おつり30円")
expectError(.soldOut, "問2：在庫0") { try machine.buy(amount: 150) }
expectError(.soldOut, "問2：在庫確認が不足確認より先") { try machine.buy(amount: 0) }
expectError(.invalidAmount, "問2：負数確認が在庫確認より先") { try machine.buy(amount: -1) }
check(machine.stock == 0, "問2：在庫は負にならない")
let model = PurchaseModel()
check(!model.isProcessing && model.stock == 2, "初期状態")
for (input, message) in [("abc", "0以上の整数を入力してください。"), ("100", "あと20円必要です。")] {
    model.purchase(text: input)
    check(model.message == message && model.stock == 2, "問3：\(input)のエラー表示と在庫")
    check(!model.isProcessing, "問5：失敗後に待機状態")
}
model.purchase(text: "150")
check(model.message == "購入成功！おつり：30円" && model.stock == 1, "問3：失敗後に成功できる")
check(!model.isProcessing, "問5：成功のreturn後にも待機状態")
model.purchase(text: "120")
check(model.message == "購入成功！おつり：0円" && model.stock == 0, "問3：2本目の購入")
model.purchase(text: "150")
check(model.message == "売り切れです。" && model.stock == 0, "問3：売り切れ表示")
check(!model.isProcessing, "問5：売り切れ後に待機状態")
check(model.previewAmount("150") == 150 && model.previewAmount("0") == 0, "問4：成功時は値")
check(model.previewAmount("abc") == nil && model.previewAmount("-1") == nil, "問4：失敗時はnil")
check(model.stock == 0, "問4：入力チェックでは購入しない")
print("\n失敗：\(failures)件")
exit(failures == 0 ? 0 : 1)
