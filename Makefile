all: main.tex build compile
compile:
	#rm -f build/main.aux
	rubber --into=build --pdf main.tex
push: compile sync 
	git push --all
sync:
	git stash
	mv build/main.pdf ../
	git checkout gh-pages
	git pull origin gh-pages
	mv ../main.pdf build/
	git add build/main.pdf
	git commit -m 'sync'
	git checkout master
	git stash apply
build:
	mkdir -p build
clean:
	rm -rf build


