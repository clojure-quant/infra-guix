(ns guix
  (:require [babashka.tasks :refer [shell]]))

(defn extra-path-env [var extra]
  (let [current (System/getenv var)
        appended (str current ":" extra)]
    (println "adding extra path: " appended)
    {:extra-env (assoc {} var appended)}))

(defn guix
  [command & args]
  (let [opts (extra-path-env "GUILE_LOAD_PATH" "./modules")]
      (apply shell opts "guix" command args)))

(defn sudo
  [command & args]
  (println "running sudo " command args)
  (apply shell "sudo" "bb" command args))

#_(defn guix-root
    [command & args]
    (println "running guix " command)
  ;(shell "export" "GUILE_LOAD_PATH=./scm:$GUILE_LOAD_PATH")
    (apply shell "sudo" "guix" command args))

#_(defn guix-extra-root
    [command & args]
    (println "running guix " command)
  ;(shell "export" "GUILE_LOAD_PATH=./scm:$GUILE_LOAD_PATH")
    (apply shell "sudo" "guix" command args))

(defn describe
  ([]
   (guix "describe")))

(defn install-channels []
  (guix "pull"
        "--channels=/home/florian/repo/myLinux/distros/guix/app/channels.scm"
        "--verbosity=3"))

(defn build
  [task name]
  (let [filename (str "./machine/" name ".scm")]
    (guix "system" task filename "--image-size=50G")))

(defn image
  [name & args]
  (let [filename (str "./machine/" name ".scm")
        full-args (concat args [filename])]
     (println "args: " full-args)
  
    (apply guix "system" "image" full-args)))

;"image"
;(defn build-image
;  [name]
;  (let [filename (str "./machine/" name ".scm")]
;    (guix-extra "system" "reconfigure" filename "--image-size=5G")))