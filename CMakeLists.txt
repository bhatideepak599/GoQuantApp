cmake_minimum_required(VERSION 3.10)
project(GoQuantOEMS)

set(CMAKE_CXX_STANDARD 17)

# Set VCPKG
set(CMAKE_TOOLCHAIN_FILE ${CMAKE_SOURCE_DIR}/vcpkg/scripts/buildsystems/vcpkg.cmake)
set(VCPKG_TARGET_TRIPLET "x64-linux")

# Find required packages
find_package(Drogon REQUIRED)
find_package(CURL REQUIRED)
find_package(OpenSSL REQUIRED)
#find_package(JsonCpp CONFIG REQUIRED)
# Specify the path to the JsonCpp package
set(JsonCpp_DIR "/home/bhatideepak599/PROJECTS/GoQuantAssignment/Deribit_GoQuant/vcpkg/installed/x64-linux/share/jsoncpp")
find_package(JsonCpp REQUIRED CONFIG)




# Add executable
add_executable(goquant_oems 
    GoQuantApp/main.cpp 
    GoQuantApp/webSocketClient.cpp 
    GoQuantApp/orderManager.cpp 
    GoQuantApp/utilityManager.cpp 
    GoQuantApp/tokenManager.cpp 
    GoQuantApp/apiCredentials.cpp
)

# Link libraries
target_link_libraries(goquant_oems Drogon::Drogon ${CURL_LIBRARIES} ${OPENSSL_LIBRARIES} JsonCpp::JsonCpp)

