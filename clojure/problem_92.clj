(defn squareSeriesType [n]
  (if (or (== 1 n)(== 89 n) ) n
      ; else
  (squareSeriesType (sum (map square (map #(Character/digit % 10) (str n)))))))

(defn square [n] (* n n))

(defn sum [l] (reduce + l))

(squareSeriesType 1)

(squareSeriesType 89)

(squareSeriesType 44)

(squareSeriesType 85)

(defn squareSeries89 [n]
  (if ( == (squareSeriesType n) 89) 1 0))

(def million 1000000)

(def tenmillion 10000000)

( defn count89s [n]
 (sum (map squareSeries89 (range 1 (+ n 1)))))

(count89s 9)

(comment "very bad and slow, don't run it")
(count89s tenmillion)
