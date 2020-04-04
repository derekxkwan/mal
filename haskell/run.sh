#!/bin/bash
exec runhaskell $(dirname $0)/${STEP:-stepA_mal}.hs "${@}"
