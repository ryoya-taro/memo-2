require "csv" # CSVファイルを扱うためのライブラリを読み込んでいます

puts "1 → 新規でメモを作成する / 2 → 既存のメモを編集する"

memo_type = gets.chomp.to_i # ユーザーの入力値を取得し、数字へ変換しています

# if文を使用して続きを作成していきましょう。
# 「memo_type」の値（1 or 2）によって処理を分岐させていきましょう。
if memo_type == 1
    puts "拡張子を除いたファイルを入力してください"
    
    file_name = gets.chomp
    
    puts "メモしたい内容を記入してください終了後、Ctrl + D　を押します。"
    
    memo = STDIN.read
    
    CSV.open("#{file_name}.csv" , "w") do |csv|
      csv << ["#{memo}"]
      
 end

elsif memo_type == 2
  
  puts "既存のメモを編集します"
  puts "拡張子を除いた既存ファイルを入力してください"
  file_name = gets.chomp
  puts "編集したい内容を入力してください。完了したらCtrl+Dを押します"
  memo = STDIN.read
  
  CSV.open("#{file_name}.csv" , "a") do |csv|
    csv << ["#{memo}"]
  end
else
  puts "読み込みできません。1か2の数字の入力をしてください"
end


