@echo off
md Variant5
cd Variant5
md GUAP A1\B1 A2\B2\C1 A2\B2\C2 A3\B3
cd GUAP
md Person Ability Qualitie
:: choose name for P1 and P2
md Perfomance\%1 Perfomance\%2
cd ..
tree
cd ..