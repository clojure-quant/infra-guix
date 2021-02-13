

# this runs inside the container
# shepherd --config=./shepherd.scm

export GUILE_LOAD_PATH=./scm:$GUILE_LOAD_PATH
export
guile -l ./shepherd.scm
