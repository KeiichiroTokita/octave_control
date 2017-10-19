# 制御実験に用いたソースコードとその実験結果
### inert3.c
### pd3.c
### dist3.c
makeをすることで実行ファイルのinert3, pd3, dist3が生成される。

### plot.sh
```
$ bash -x plot.sh result/hoge/huga.data
```
実行時に引数を2つ取った時にはresult/result.dataを改名した後にプロットする。
引数としてプロットしたいデータファイルを一つだけ渡すと、そのデータファイルをプロットする。
データファイルのカラム数を読み取り、プロットするべきデータを自動判別する仕様となっている。
gnuplotの設定を変えたい時にはこれを変更すると良い。

### generate_plot_pdf.sh
```
$ bash -x generate_plot_pdf.sh
```
resultディレクトリに存在する拡張子がdataであるファイル全てをプロットしてpdfで保存するスクリプト。

### script
理論値を算出するoctaveのスクリプトのためのディレクトリ 