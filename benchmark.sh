# python3 -m tests.benchmark
# python3 -m tests.benchmark --platform=CPU --seconds=10 --test=pme
#python benchmark.py --platform=CUDA --style=table --test=pme,apoa1pme,amber20-cellulose,amber20-stmv,amoebapme
python3 -m  tests.benchmark --style=table --platform=CUDA  --test=pme,apoa1pme,amber20-cellulose,amber20-stmv,amoebapme