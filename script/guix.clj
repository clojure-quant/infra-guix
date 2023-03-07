(ns guix
  (:require [babashka.tasks :refer [shell]]
            [babashka.fs :as fs]
            ))


(defn sudo
  [command & args]
  (println "running sudo " command args)
  (apply shell "sudo" "bb" command args))

(defn extra-path-env [result? var extra]
  (let [current (System/getenv var)
        appended (str current ":" extra)
        opts {:extra-env (assoc {} var appended)}]
    ;(println "guix/extra path: " appended)
    (if result?
      (merge opts {:out :string
                   :err :inherit})
      opts)))


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
        substitutes (str "--substitute-urls="
                         ; "https://ci.guix.gnu.org "
                         "https://bordeaux.guix.gnu.org "
                         "https://substitutes.nonguix.org")
        full-args (concat args [channels substitutes])]
    (println "guix pull: " full-args)
    (apply guix "pull" full-args)))

(defn package
  [name & args]
  (let [filename (str "./manifest/" name ".scm")
        manifest (str "--manifest=" filename)
        full-args (concat args [manifest])]
    (println "guix package args: " full-args)
    (apply guix "package" full-args)))


(defn extra-profiles-dir []
  (let [home (System/getenv "HOME")]
    (str home "/.guix-extra-profiles/")))

(defn extra-profile-param [profile]
  (let [profile-dir (str (extra-profiles-dir) profile)] 
    ;(println "gc profile: " profile "in: " profile-dir)
    (str "--profile=" profile-dir "/" profile)))
 

(defn extra-profile-op [profile op] 
  ;(println "extra profile op profile: " profile "op: " op)
  (guix/guix
   "package"
   (extra-profile-param profile)
   op))

(defn extra-profile-names []
  (let [path (extra-profiles-dir)]
    ; (println "path: " path)
    (fs/list-dir path)
    (map fs/file-name (fs/list-dir path))))
  

(defn user-profiles-op [op]
 (let [profiles (guix/extra-profile-names)]
   ; user profile
   (println "PROFILE: *USER*")
   (guix/guix "package" op)

   ;guix home list-generations
   ; extra profiles
   (doall
    (map (fn [profile]
           (println "PROFILE: " profile)
           (guix/extra-profile-op profile op))
         profiles))
   ))


                  ;"--list-generations"

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

