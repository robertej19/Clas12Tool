#!/bin/bash
export CLAS12TOOL=$HOME/software/Clas12Tool

function setEnvironment {
  #check if ROOT exist
  if [ -z ${ROOTSYS+x} ]
  then
    echo "ATTENTION: ROOTSYS is not set. Do you have ROOT installed?"
  fi

  export HIPO=${CLAS12TOOL}/Hipo

  export CLAS12CPPBASE=${CLAS12TOOL}/C12AnCpp
  echo $CLAS12CPPBASE

  export C12CORE=$CLAS12CPPBASE"/Core"
  export C12CLAS12=$CLAS12CPPBASE"/Clas12"
  export C12RTOOL=$CLAS12CPPBASE"/Root"
  export C12TOOLS=$CLAS12CPPBASE"/Tools"
  export C12LUND=$CLAS12CPPBASE"/Lund"
  export CLAS12CPP=$C12CORE:$C12CLAS12:$C12RTOOL:$C12TOOLS:$C12LUND

  export LD_LIBRARY_PATH=$CLAS12CPP:$CLAS12TOOL/lib:$HIPO:$LD_LIBRARY_PATH
  echo $LD_LIBRARY_PATH
}

# check if the environment was already loaded
if [ -z ${CLAS12CPP+x} ] 
then
  setEnvironment
else
  echo "already set"
fi
  

