(def thestring "abcdefghijklm")

(defn permutations [word]
   (if (= 1 (count word)) (list word)
    (for [head word
     tail (permutations (disj (set word) head))]
    (cons head tail)))
 )

(let [n (read-string (read-line)) thestring-permutations (permutations thestring)]
    (dotimes [i n]
            (println (clojure.string/join (nth thestring-permutations (- (read-string (read-line)) 1))
            ))))
