# CMake files for the srcComplexity project

cmake_minimum_required(VERSION 3.15)

project(srcComplexity)

set(CMAKE_CXX_STANDARD 17)

if(NOT CMAKE_BUILD_TYPE)
    set(CMAKE_BUILD_TYPE Release)
endif()

add_executable(srccomplexity srcComplexity.cpp srcMLXPathCount.cpp)

find_package(LibXml2 REQUIRED)
target_link_libraries(srccomplexity LibXml2::LibXml2)

add_custom_target(run
    COMMENT "Run demo"
    COMMAND $<TARGET_FILE:srccomplexity> ${CMAKE_SOURCE_DIR}/srcMLXPathCount.cpp.xml
    DEPENDS srccomplexity
    USES_TERMINAL
    WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
)
