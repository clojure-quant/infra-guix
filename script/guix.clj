(ns guix
  (:require [babashka.tasks :refer [shell]]))

(defn extra-path-env [var extra]
  (let [current (System/getenv var)
        appended (str current ":" extra)]
    (println "guix/extra path: " appended)
    {; :out :string
     ; :err :inherit
     :extra-env (assoc {} var appended)}))

(defn guix
  [command & args]
  (let [opts (extra-path-env "GUILE_LOAD_PATH" "./modules")
        result (apply shell opts "guix" command args)]
     ;(println "guix result: " result)
     ;(println "guix out result: "  (:out result))
     result))

(defn sudo
  [command & args]
  (println "running sudo " command args)
  (apply shell "sudo" "bb" command args))


(defn describe
  ([]
   (guix "describe")))

(defn pull
  [name & args]
  (let [filename (str "./" name ".scm")
        channels (str "--channels=" filename)
        full-args (concat args [channels])]
    (println "guix pull args: " full-args)
    (apply guix "pull" full-args)))

(defn package
  [name & args]
  (let [filename (str "./manifest/" name ".scm")
        manifest (str "--manifest=" filename)
        full-args (concat args [manifest])]
    (println "guix package args: " full-args)
    (apply guix "package" full-args)))

(defn system-old
  [task name]
  (let [filename (str "./machine/" name ".scm")]
    (guix "system" task filename "--image-size=50G")))

(defn system
  [name & args]
  (let [filename (str "./machine/" name ".scm")
        full-args (concat args [filename])]
    (println "args: " full-args)
    (apply guix "system" full-args)))

(defn image
  [name & args]
  (let [filename (str "./machine/" name ".scm")
        full-args (concat args [filename])]
     (println "args: " full-args)
    (apply guix "system" "image" full-args)))


; guix graph clojure | xdot -
(defn graph
  [& args]
  (let [full-args (concat args ["|" "xdot" "-"])]
    (apply guix "graph" full-args)))
  
