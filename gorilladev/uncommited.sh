#!/bin/bash

echo "checking for uncommited action"

cd notebook-encoding
git status --short
cd ..

cd gorilla-explore
git status --short
cd ..

cd gorilla-middleware
git status --short
cd ..

cd gorilla-notebook
git status --short
cd ..

cd sample-notebooks
git status --short
cd ..

cd gorilla-plot
git status --short
cd ..

cd gorilla-renderable
git status --short
cd ..

cd gorilla-renderable-ui
git status --short
cd ..

cd gorilla-ui 
git status --short
cd ..

cd ../quant/trateg
git status --short
cd ../../gorilla

