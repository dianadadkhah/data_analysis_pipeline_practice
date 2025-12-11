.PHONY: all clean



all: report/count_report.html


clean:
	rm -f results/*.dat
	rm -f results/figure/*.png
	rm -f report/count_report.html




results/%.dat: data/%.txt scripts/wordcount.py
	python scripts/wordcount.py --input_file=$< --output_file=$@





results/figure/%.png: results/%.dat scripts/plotcount.py
	python scripts/plotcount.py --input_file=$< --output_file=$@



report/count_report.html: report/count_report.qmd \
	results/figure/isles.png \
	results/figure/abyss.png \
	results/figure/last.png \
	results/figure/sierra.png
	quarto render report/count_report.qmd
