# Aotoki

大公司不一定 Test 做得很好，但通常都會需要持續改善程序碼，讓新舊功能都可以 work。
為了達到這個目標勢必要做重構，怎麼確保重構沒問題？就是用測試

比較喜歡研究怎麼把程式寫好，反而對商業邏輯還好。
https://blog.aotoki.me
目前是類似很多公司的顧問角色。白天很忙 xD

# Rspec

Rspec 屬於 BDD。測試的是行為。還有一個更有名的是 Cucumber。

## RSpec vs Cucumber

很常看到 Rails 專案裡面會同時兩個都有：

- 用 Cucumber 做 end to end，讓非專業的人員也看得懂。
- 用 RSpec 做 Unit test。

有了情境之後要給當下的一些規範。
Then 斷言：就會發生什麼事情。

要有這些才可以清楚描述一個測試
Cucumber 適合專案有些非工程師的人員的時候。

> NOTE: 其實這就是 User Story

- Scenario 情境
- Given 定義測試狀態（Given 有一個「管理員」 User、Give 有一個「普通」User）
- When 定義測試事件

# 寫 Test 的目的：「某個情境發生的事情是否符合預期」

private 不用測。通常定義 private method 都是給某一個 public method 使用，要是沒用到就代表是 legacy code。

describe
context: 跟 describe 沒有差別。只是用來定義情境

!!! warning
    至少要問你的客戶跟 PM 確認好一些使用情境有哪些？

describe context 適合組織測試。

> 你能不能把測試寫到跟文件一樣好？

subject 會被當作是 it
let 定義測試環境

## Matcher

搭配 expect 來檢視結果。
Ruby 是有 DSL 的語言，加上 matcher 會變得更人性化。

- eq(val)
- have_attributes(key: value)
- include

BDD 是用來跟客戶、PM 討論規格怎麼定
TDD 是定義我用最少的規格把東西做出來


## Demo

:+1: 一個 `it` 只能有一個 `expect`，有錯的時候比較好追蹤

```bash
# 可以用 format
rspec -f doc 
```

fixture 適用直接把資料讀到記憶體，不想要做db query
factory 一般都用在測試 model，會需要 db query。


# mock

stub: user.admin? 直接回傳 true
mock: 模擬 db 行為（e.g. redis）

通常要 mock 都是 new 出來的東西 -> instance double
spy: 先 call 再去看有沒有被 call
