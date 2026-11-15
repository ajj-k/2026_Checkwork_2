import SwiftUI

// 完成済みの画面。VendingMachine.swift の TODO を編集してください。
struct ContentView: View {
    @StateObject private var model = PurchaseModel()
    @State private var amount = "150"

    var body: some View {
        NavigationStack {
            List {
                Section("今回のミッション") {
                    Text("VendingMachine.swift の TODO 1〜5 を完成させよう。")
                    Text("未完成の教材です。最初は購入・入力確認・終了処理が正しく動きません。")
                        .font(.caption).foregroundStyle(.secondary)
                }
                Section("ジュースの自動販売機") {
                    Label("ジュース：120円", systemImage: "cup.and.saucer.fill")
                    Text("在庫：\(model.stock)本")
                    TextField("投入金額（円）", text: $amount)
                        .textFieldStyle(.roundedBorder)
                        .autocorrectionDisabled()
                    Text("例：150 / 120 / 100 / 0 / -1 / abc / 空欄")
                        .font(.caption).foregroundStyle(.secondary)
                    Button("購入する") { model.purchase(text: amount) }
                    Text(model.message).accessibilityIdentifier("purchaseMessage")
                    Text("処理状態：\(model.isProcessing ? "処理中" : "待機中")")
                    Text("TODO 5 完成後は購入が成功しても失敗しても待機中に戻ります。")
                        .font(.caption).foregroundStyle(.secondary)
                }
                Section("try? で入力チェック") {
                    if let value = model.previewAmount(amount) {
                        Text("有効な金額：\(value)円")
                    } else {
                        Text("金額に変換できません（nil）。")
                    }
                    Text("ここではエラーの理由を表示せず、変換できたかだけを確認します。")
                        .font(.caption).foregroundStyle(.secondary)
                }
                Section("確認のヒント") {
                    Text("150円で購入 → おつり30円、在庫1本。")
                    Text("100円で購入 → あと20円必要、在庫は変化なし。")
                    Text("合計2本購入した後 → 売り切れ。")
                    Text("在庫を戻すにはアプリを終了して再実行します。")
                }
            }
            .navigationTitle("例外処理ラボ")
        }
    }
}
