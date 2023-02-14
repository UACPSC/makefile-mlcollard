# Build for srcComplexity

srcComplexity.o : srcComplexity.cpp srcMLXPathCount.hpp
	g++ --std=c++17 -c srcComplexity.cpp

srcMLXPathCount.o : srcMLXPathCount.cpp srcMLXPathCount.hpp
	g++ --std=c++17 -I/usr/include/libxml2 -c srcMLXPathCount.cpp
