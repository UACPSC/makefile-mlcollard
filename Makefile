# Build for srcComplexity

.PHONY: all
all: srccomplexity srcMLXPathCount_t

srccomplexity : srcComplexity.o srcMLXPathCount.o
	g++ --std=c++17 srcComplexity.o srcMLXPathCount.o -lxml2 -o srccomplexity

srcComplexity.o : srcComplexity.cpp srcMLXPathCount.hpp
	g++ --std=c++17 -c srcComplexity.cpp

srcMLXPathCount.o : srcMLXPathCount.cpp srcMLXPathCount.hpp
	g++ --std=c++17 -I/usr/include/libxml2 -c srcMLXPathCount.cpp

srcMLXPathCount_t : srcMLXPathCount_t.o srcMLXPathCount.o srcMLXPathCount.hpp
	g++ --std=c++17 srcMLXPathCount_t.o srcMLXPathCount.o -lxml2 -o srcMLXPathCount_t

srcMLXPathCount_t.o : srcMLXPathCount_t.cpp srcMLXPathCount.hpp
	g++ --std=c++17 -c srcMLXPathCount_t.cpp

.PHONY: run
run: srccomplexity
	./srccomplexity srcMLXPathCount.cpp.xml

.PHONY: clean
clean:
	rm -f srccomplexity srcComplexity.o srcMLXPathCount.o
