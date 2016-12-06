# Install script for directory: /root/percona-server-5.6.22-72.0/sql-bench

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/u01/my3306")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "RelWithDebInfo")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "SqlBench")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/sql-bench/Data" TYPE DIRECTORY FILES "/root/percona-server-5.6.22-72.0/sql-bench/Data/ATIS")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "SqlBench")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/sql-bench/Data" TYPE DIRECTORY FILES "/root/percona-server-5.6.22-72.0/sql-bench/Data/Wisconsin")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "SqlBench")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/sql-bench" TYPE DIRECTORY FILES "/root/percona-server-5.6.22-72.0/sql-bench/limits")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "SqlBench")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/sql-bench" TYPE PROGRAM FILES "/root/percona-server-5.6.22-72.0/sql-bench/run-all-tests")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "SqlBench")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/sql-bench" TYPE PROGRAM FILES "/root/percona-server-5.6.22-72.0/sql-bench/test-transactions")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "SqlBench")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/sql-bench" TYPE PROGRAM FILES "/root/percona-server-5.6.22-72.0/sql-bench/test-insert")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "SqlBench")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/sql-bench" TYPE PROGRAM FILES "/root/percona-server-5.6.22-72.0/sql-bench/test-transactions")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "SqlBench")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/sql-bench" TYPE PROGRAM FILES "/root/percona-server-5.6.22-72.0/sql-bench/server-cfg")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "SqlBench")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/sql-bench" TYPE PROGRAM FILES "/root/percona-server-5.6.22-72.0/sql-bench/compare-results")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "SqlBench")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/sql-bench" TYPE PROGRAM FILES "/root/percona-server-5.6.22-72.0/sql-bench/test-create")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "SqlBench")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/sql-bench" TYPE PROGRAM FILES "/root/percona-server-5.6.22-72.0/sql-bench/innotest2b")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "SqlBench")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/sql-bench" TYPE PROGRAM FILES "/root/percona-server-5.6.22-72.0/sql-bench/innotest1b")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "SqlBench")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/sql-bench" TYPE PROGRAM FILES "/root/percona-server-5.6.22-72.0/sql-bench/test-select")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "SqlBench")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/sql-bench" TYPE PROGRAM FILES "/root/percona-server-5.6.22-72.0/sql-bench/CTestTestfile.cmake")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "SqlBench")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/sql-bench" TYPE PROGRAM FILES "/root/percona-server-5.6.22-72.0/sql-bench/test-wisconsin")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "SqlBench")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/sql-bench" TYPE PROGRAM FILES "/root/percona-server-5.6.22-72.0/sql-bench/test-connect")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "SqlBench")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/sql-bench" TYPE PROGRAM FILES "/root/percona-server-5.6.22-72.0/sql-bench/innotest1")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "SqlBench")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/sql-bench" TYPE PROGRAM FILES "/root/percona-server-5.6.22-72.0/sql-bench/innotest2a")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "SqlBench")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/sql-bench" TYPE FILE FILES "/root/percona-server-5.6.22-72.0/sql-bench/README")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "SqlBench")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/sql-bench" TYPE PROGRAM FILES "/root/percona-server-5.6.22-72.0/sql-bench/graph-compare-results")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "SqlBench")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/sql-bench" TYPE PROGRAM FILES "/root/percona-server-5.6.22-72.0/sql-bench/innotest2")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "SqlBench")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/sql-bench" TYPE PROGRAM FILES "/root/percona-server-5.6.22-72.0/sql-bench/test-create")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "SqlBench")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/sql-bench" TYPE PROGRAM FILES "/root/percona-server-5.6.22-72.0/sql-bench/innotest2a")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "SqlBench")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/sql-bench" TYPE PROGRAM FILES "/root/percona-server-5.6.22-72.0/sql-bench/crash-me")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "SqlBench")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/sql-bench" TYPE PROGRAM FILES "/root/percona-server-5.6.22-72.0/sql-bench/graph-compare-results")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "SqlBench")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/sql-bench" TYPE PROGRAM FILES "/root/percona-server-5.6.22-72.0/sql-bench/test-ATIS")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "SqlBench")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/sql-bench" TYPE PROGRAM FILES "/root/percona-server-5.6.22-72.0/sql-bench/run-all-tests")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "SqlBench")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/sql-bench" TYPE PROGRAM FILES "/root/percona-server-5.6.22-72.0/sql-bench/test-big-tables")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "SqlBench")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/sql-bench" TYPE PROGRAM FILES "/root/percona-server-5.6.22-72.0/sql-bench/bench-count-distinct")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "SqlBench")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/sql-bench" TYPE PROGRAM FILES "/root/percona-server-5.6.22-72.0/sql-bench/bench-init.pl")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "SqlBench")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/sql-bench" TYPE PROGRAM FILES "/root/percona-server-5.6.22-72.0/sql-bench/innotest1")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "SqlBench")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/sql-bench" TYPE PROGRAM FILES "/root/percona-server-5.6.22-72.0/sql-bench/test-select")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "SqlBench")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/sql-bench" TYPE PROGRAM FILES "/root/percona-server-5.6.22-72.0/sql-bench/test-wisconsin")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "SqlBench")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/sql-bench" TYPE PROGRAM FILES "/root/percona-server-5.6.22-72.0/sql-bench/copy-db")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "SqlBench")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/sql-bench" TYPE PROGRAM FILES "/root/percona-server-5.6.22-72.0/sql-bench/innotest2")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "SqlBench")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/sql-bench" TYPE PROGRAM FILES "/root/percona-server-5.6.22-72.0/sql-bench/test-insert")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "SqlBench")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/sql-bench" TYPE PROGRAM FILES "/root/percona-server-5.6.22-72.0/sql-bench/test-big-tables")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "SqlBench")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/sql-bench" TYPE PROGRAM FILES "/root/percona-server-5.6.22-72.0/sql-bench/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "SqlBench")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/sql-bench" TYPE PROGRAM FILES "/root/percona-server-5.6.22-72.0/sql-bench/test-alter-table")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "SqlBench")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/sql-bench" TYPE PROGRAM FILES "/root/percona-server-5.6.22-72.0/sql-bench/innotest2b")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "SqlBench")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/sql-bench" TYPE PROGRAM FILES "/root/percona-server-5.6.22-72.0/sql-bench/bench-count-distinct")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "SqlBench")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/sql-bench" TYPE PROGRAM FILES "/root/percona-server-5.6.22-72.0/sql-bench/test-connect")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "SqlBench")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/sql-bench" TYPE PROGRAM FILES "/root/percona-server-5.6.22-72.0/sql-bench/innotest1a")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "SqlBench")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/sql-bench" TYPE PROGRAM FILES "/root/percona-server-5.6.22-72.0/sql-bench/test-ATIS")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "SqlBench")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/sql-bench" TYPE PROGRAM FILES "/root/percona-server-5.6.22-72.0/sql-bench/server-cfg")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "SqlBench")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/sql-bench" TYPE PROGRAM FILES "/root/percona-server-5.6.22-72.0/sql-bench/test-alter-table")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "SqlBench")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/sql-bench" TYPE PROGRAM FILES "/root/percona-server-5.6.22-72.0/sql-bench/innotest1b")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "SqlBench")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/sql-bench" TYPE PROGRAM FILES "/root/percona-server-5.6.22-72.0/sql-bench/crash-me")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "SqlBench")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/sql-bench" TYPE PROGRAM FILES "/root/percona-server-5.6.22-72.0/sql-bench/bench-init.pl")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "SqlBench")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/sql-bench" TYPE PROGRAM FILES "/root/percona-server-5.6.22-72.0/sql-bench/innotest1a")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "SqlBench")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/sql-bench" TYPE PROGRAM FILES "/root/percona-server-5.6.22-72.0/sql-bench/compare-results")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "SqlBench")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/sql-bench" TYPE PROGRAM FILES "/root/percona-server-5.6.22-72.0/sql-bench/copy-db")
endif()

