(ns guix
  (:require [babashka.tasks :refer [shell]]))


(defn sudo
  [command & args]
  (println "running sudo " command args)
  (apply shell "sudo" "bb" command args))

(defn extra-path-env [result? var extra]
  (let [current (System/getenv var)
        appended (str current ":" extra)
        opts {:extra-env (assoc {} var appended)}]
    (println "guix/extra path: " appended)
    (if result?
      (merge opts {:out :string
                   :err :inherit})
      opts)))

(defn guile
  [& args]
  (let [opts (extra-path-env false "GUILE_LOAD_PATH" "./modules")
        result (apply shell opts "guile" args)]
     ;(println "guix result: " result)
     ;(println "guix out result: "  (:out result))
    result))

(defn guix
  [command & args]
  (let [opts (extra-path-env false "GUILE_LOAD_PATH" "./modules")
        result (apply shell opts "guix" command args)]
     ;(println "guix result: " result)
     ;(println "guix out result: "  (:out result))
    result))

(defn guix-result
  [& args]
  (let [opts (extra-path-env true "GUILE_LOAD_PATH" "./modules")
        _ (println "guix " args)
        result (apply shell opts "guix" args)]
     ;(println "guix result: " result)
     (println "guix out result: "  (:out result))
    result))


(defn describe
  ([]
   (guix "describe")))

(defn pull
  [name & args]
  (let [filename (str "./" name ".scm")
        channels (str "--channels=" filename)
        full-args (concat args [channels])]
    (println "guix pull " full-args)
    (apply guix "pull" full-args)))

(defn package
  [name & args]
  (let [filename (str "./manifest/" name ".scm")
        manifest (str "--manifest=" filename)
        full-args (concat args [manifest])]
    (println "guix package args: " full-args)
    (apply guix "package" full-args)))


; "--image-size=50G"
(defn system
  [name & args]
  (let [filename (str "./machine/" name ".scm")
        full-args (concat args [filename])]
    (println "guix system args: " full-args)
    (apply guix "system" full-args)))

(defn image
  [name & args]
  (let [filename (str "./machine/" name ".scm")
        full-args (concat args [filename])]
    (println "guix system image args: " full-args)
    (apply guix "system" "image" full-args)))


(defn image-result
  [name & args]
  (let [filename (str "./machine/" name ".scm")
        full-args (concat args [filename])]
    (println "guix system image args: " full-args)
    (apply guix-result "system" "image" full-args)))




; guix graph clojure | xdot -
(defn graph
  [& args]
  (let [full-args (concat args ["|" "xdot" "-"])]
    (apply guix "graph" full-args)))

