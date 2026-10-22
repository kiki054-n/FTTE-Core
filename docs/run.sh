#!/bin/bash
# FTTE Topological Transducer - run script
set -e
mkdir -p tmp pseudo
echo "Download SSSP pseudo: C.pbe-n-kjpaw, Li.pbe-s-kjpaw, F.pbe-n-kjpaw from https://www.materialscloud.org/discover/sssp/"
echo "Running SCF..."
pw.x < scf.in > scf.out
echo "NSCF..."
pw.x < nscf.in > nscf.out
echo "Bands..."
bands.x < bands.in > bands.out
echo "Done. Gap check:"
grep -A2 "Dream Band" scf.out || echo "Check tbg_LiF.bands.dat.gnu"
echo "FTTE gap expected ~52meV with Li+0.12/F-0.18 asym"
