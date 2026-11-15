# 例外処理ラボ：SwiftUIチェックテスト

中高生向け／目安30〜45分／変数・関数・if文・Optionalの基本を学習済みの人向け。
既存のロボットOOPテストと同じく、**ビルド可能な未完成教材**です。自動販売機の購入処理を完成させます。

## 開き方

1. Xcode 15以降で `ErrorHandlingCheck.xcodeproj` を開きます。
2. iOS 17以降のiPhoneシミュレータを選び、Command + Rで実行します。
3. `問題.md` を読み、`ErrorHandlingCheck/VendingMachine.swift` のTODO 1〜5を編集します。
4. 再実行して動きを確認します。在庫をリセットするにはアプリを終了して再実行してください。

外部ライブラリ・ネットワーク接続は不要です。実機で動かす場合は自分のTeamと一意のBundle Identifierを設定してください。

## ファイル案内

- `問題.md`：100点満点の問題と動作確認手順。
- `ErrorHandlingCheck/VendingMachine.swift`：生徒用の未完成コード。
- `ErrorHandlingCheck/ContentView.swift`：完成済みのSwiftUI画面。
- `Teacher/`：解答例と採点ガイド。**生徒への配布前に取り除いてください。**
- `Checks/`：任意の自動チェック。アプリのターゲットには含まれません。

`ObservableObject`、`@Published`、`@StateObject`は画面と状態をつなぐ完成済みの仕組みで、変更不要です。購入は同期処理で、処理中の表示は通常目に見える時間残りません。終了後に待機中へ戻ることを確認します。

ここでいう「例外処理」はSwiftの `Error` によるエラーハンドリングです。`do-catch`は配列の範囲外アクセスや `try!` の失敗などの実行時トラップを回復するものではありません。

## 自動チェック

このフォルダで `bash Checks/check.sh` を実行します。未完成版はFAILを表示して終了コード1、全問完成するとすべてPASSになります。Swiftコンパイラが必要です。

教員は `bash Checks/check.sh --answer` で解答例を確認できます。生徒用ファイルは変更されません。チェックは挙動を検証します。`try?`や`defer`を実際に使用しているかはコードも確認してください。
