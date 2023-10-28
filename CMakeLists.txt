cmake_minimum_required(VERSION 3.16)
project(audio_stream VERSION 0.1.0 LANGUAGES CXX C)
set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${CMAKE_SOURCE_DIR}/cmake/modules/")
find_package(ASOUND REQUIRED)
 
add_executable(audio_stream audio_stream.cpp)
target_link_libraries(audio_stream lasound)
 
include(GNUInstallDirs)
install(TARGETS audio_stream
        RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR})
