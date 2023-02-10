# go_routeを学び直してみる
go_routerは、画面遷移のコードを短く書けるものだと思っていたのですが、違いました!<br>

- 使ってみて分かったこと?
  - Navigator.pushと違った所!
    - 戻るボタンがない?
    - ルートをネストさせると戻るボタンが現れる!
  - ボトムナビゲーションバーの設定が独特
    - GlobalKeyの設定が必要!
    - 画面遷移のコードは、context.goで全てできない!
    - 同じページから他のページへ移動するときに
    - GoRouter.of(context).go('/a/details');と書く必要があった!

ボトムナビゲーションバーを作ってみようとすると、独自の設定が必要みたいで結構ハマりました!
公式にサンプルコードがあったので、それを動かしながら、ページを追加したり画面遷移のルートを変更して、どうすれば画面遷移したときに、ルートが見つからないエラーに遭遇するのか、検証をしてみました。

-----

## GlobalKeyとは?
アプリ全体で一意となるキー。
グローバルキーは、要素を一意に識別する。グローバルキーは、それらの要素に関連する他のオブジェクトBuildContextなどへのアクセスを提供します。StatefulWidgetの場合、グローバルキーは、Stateへのアクセスも提供します。

----

## ある記事によると?
名前の通り、任意の画面 (ページ) や Widget ツリーの全く別の階層から特定の Widget にアクセスするために利用します。基本的に親 Widget クラス内のメンバ変数などに定義し、StatefulWidgetの Widget に対して利用します。

### 利用シーン
2つの異なる画面で同じ状態のWidgetを表示したい場合
他のWidgetから特定のWidgetを参照したい場合

----

## NavigatorStateとは?
こちらのコードの<>の中のコードですね。日本語に翻訳してみると、Navigator.ofを使用しないと使用できないようです?

```dart
final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
```

/// The state for a [Navigator] widget.
///
/// A reference to this class can be obtained by calling [Navigator.of].

## 翻訳すると
/// [Navigator]ウィジェットの状態です。
///
/// このクラスへの参照は、[Navigator.of] を呼び出すことで得ることができます。

## 今回の場合だと
恐らくgo_routerでは、ボトムナビゲーションバー内のページから画面遷移するには、GoRouter.of(context).go('/a/details');と書いて、パスがaの下のファイルに画面遷移してくれと、宣言しないとルートが見つからずに、エラーが出てしまうので、そのように書いてくれと言っているのだと思われます。

このように書かないと、ボトムナビゲーションバーのページAの詳細ページへは、画面遷移することはできませんでした!

----

## ディレクトリ構成
今回やったことは、Githubのexampleのサンプルのコードを複数のファイルに分けて、表示するページを増やしただけです。

```dart
lib
├── main.dart
├── router
│   └── router.dart
└── ui
    ├── navigation
    │   ├── page
    │   │   ├── ScreenD.dart
    │   │   ├── detail
    │   │   │   ├── DetailPage.dart
    │   │   │   └── detail_screen.dart
    │   │   ├── screenA.dart
    │   │   ├── screenB.dart
    │   │   └── screenC.dart
    │   └── scafflod_with_navbar.dart
    └── page
        ├── start_datil.dart
        └── start_page.dart
```