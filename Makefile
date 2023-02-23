# Build for srcComplexity

.PHONY: all
all: srccomplexity srcMLXPathCount_t

srccomplexity : srcComplexity.o srcMLXPathCount.o
	g++ --std=c++17 -coverage $^ -lxml2 -o $@

srcComplexity.o : srcComplexity.cpp srcMLXPathCount.hpp
	g++ --std=c++17 -coverage -c $^

srcMLXPathCount.o : srcMLXPathCount.cpp srcMLXPathCount.hpp
	g++ --std=c++17 -coverage -I/usr/include/libxml2 -c $^

srcMLXPathCount_t : srcMLXPathCount_t.o srcMLXPathCount.o srcMLXPathCount.hpp
	g++ --std=c++17 -coverage srcMLXPathCount_t.o srcMLXPathCount.o -lxml2 -o $@

srcMLXPathCount_t.o : srcMLXPathCount_t.cpp srcMLXPathCount.hpp
	g++ --std=c++17 -coverage -c $^

.PHONY: run
run: srccomplexity
	./srccomplexity srcMLXPathCount.cpp.xml

.PHONY: test
test: srccomplexity
	./srccomplexity srcMLXPathCount.cpp.xml

.PHONY: coverage
coverage : srccomplexity
	gcov srcComplexity.gcda srcMLXPathCount.gcda

.PHONY: coverage/report
coverage/report: srccomplexity
	gcov srcComplexity.gcda | head -2

.PHONY: coverage/clean
coverage/clean:
	@rm -f *.gcda *.gcov

.PHONY: clean
clean: coverage/clean
	rm -f srccomplexity srcComplexity.o srcMLXPathCount.o srcMLXPathCount_t srcMLXPathCount_t.o
