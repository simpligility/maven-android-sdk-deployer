#!/bin/bash

function remove_osx(){
  rm -rfv ~/.m2/repository/android
  rm -rfv ~/.m2/repository/com/google/android/
  rm -rfv ~/.m2/repository/com/android/future/
}

function remove_linux(){
  rm -rfv ~/.m2/repository/android
  rm -rfv ~/.m2/repository/com/google/android/
  rm -rfv ~/.m2/repository/com/android/future/
}

if [ "$(uname)" == "Darwin" ]; then
  remove_osx
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
  remove_linux
fi
