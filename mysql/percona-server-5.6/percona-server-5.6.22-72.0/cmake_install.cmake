# Install script for directory: /root/percona-server-5.6.22-72.0

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

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Info")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/docs" TYPE FILE OPTIONAL FILES "/root/percona-server-5.6.22-72.0/Docs/mysql.info")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Readme")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/." TYPE FILE OPTIONAL FILES
    "/root/percona-server-5.6.22-72.0/COPYING"
    "/root/percona-server-5.6.22-72.0/LICENSE.mysql"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Readme")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/." TYPE FILE FILES "/root/percona-server-5.6.22-72.0/README.MySQL")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/docs" TYPE FILE FILES
    "/root/percona-server-5.6.22-72.0/Docs/INFO_SRC"
    "/root/percona-server-5.6.22-72.0/Docs/INFO_BIN"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Readme")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/." TYPE FILE FILES "/root/percona-server-5.6.22-72.0/Docs/INSTALL-BINARY")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Documentation")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/docs" TYPE DIRECTORY FILES "/root/percona-server-5.6.22-72.0/Docs/" REGEX "/INSTALL\\-BINARY$" EXCLUDE REGEX "/Makefile\\.[^/]*$" EXCLUDE REGEX "/glibc[^/]*$" EXCLUDE REGEX "/linuxthreads\\.txt$" EXCLUDE REGEX "/myisam\\.txt$" EXCLUDE REGEX "/mysql\\.info$" EXCLUDE REGEX "/sp\\-imp\\-spec\\.txt$" EXCLUDE)
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/root/percona-server-5.6.22-72.0/zlib/cmake_install.cmake")
  include("/root/percona-server-5.6.22-72.0/extra/yassl/cmake_install.cmake")
  include("/root/percona-server-5.6.22-72.0/extra/yassl/taocrypt/cmake_install.cmake")
  include("/root/percona-server-5.6.22-72.0/cmd-line-utils/libedit/cmake_install.cmake")
  include("/root/percona-server-5.6.22-72.0/libevent/cmake_install.cmake")
  include("/root/percona-server-5.6.22-72.0/storage/myisam/cmake_install.cmake")
  include("/root/percona-server-5.6.22-72.0/storage/ndb/cmake_install.cmake")
  include("/root/percona-server-5.6.22-72.0/storage/federated/cmake_install.cmake")
  include("/root/percona-server-5.6.22-72.0/storage/perfschema/cmake_install.cmake")
  include("/root/percona-server-5.6.22-72.0/storage/example/cmake_install.cmake")
  include("/root/percona-server-5.6.22-72.0/storage/innobase/cmake_install.cmake")
  include("/root/percona-server-5.6.22-72.0/storage/myisammrg/cmake_install.cmake")
  include("/root/percona-server-5.6.22-72.0/storage/archive/cmake_install.cmake")
  include("/root/percona-server-5.6.22-72.0/storage/blackhole/cmake_install.cmake")
  include("/root/percona-server-5.6.22-72.0/storage/csv/cmake_install.cmake")
  include("/root/percona-server-5.6.22-72.0/storage/heap/cmake_install.cmake")
  include("/root/percona-server-5.6.22-72.0/plugin/innodb_memcached/cmake_install.cmake")
  include("/root/percona-server-5.6.22-72.0/plugin/percona-pam-for-mysql/cmake_install.cmake")
  include("/root/percona-server-5.6.22-72.0/plugin/query_response_time/cmake_install.cmake")
  include("/root/percona-server-5.6.22-72.0/plugin/fulltext/cmake_install.cmake")
  include("/root/percona-server-5.6.22-72.0/plugin/HandlerSocket-Plugin-for-MySQL/cmake_install.cmake")
  include("/root/percona-server-5.6.22-72.0/plugin/auth/cmake_install.cmake")
  include("/root/percona-server-5.6.22-72.0/plugin/password_validation/cmake_install.cmake")
  include("/root/percona-server-5.6.22-72.0/plugin/scalability_metrics/cmake_install.cmake")
  include("/root/percona-server-5.6.22-72.0/plugin/percona-udf/cmake_install.cmake")
  include("/root/percona-server-5.6.22-72.0/plugin/audit_null/cmake_install.cmake")
  include("/root/percona-server-5.6.22-72.0/plugin/daemon_example/cmake_install.cmake")
  include("/root/percona-server-5.6.22-72.0/plugin/semisync/cmake_install.cmake")
  include("/root/percona-server-5.6.22-72.0/plugin/audit_log/cmake_install.cmake")
  include("/root/percona-server-5.6.22-72.0/include/cmake_install.cmake")
  include("/root/percona-server-5.6.22-72.0/dbug/cmake_install.cmake")
  include("/root/percona-server-5.6.22-72.0/strings/cmake_install.cmake")
  include("/root/percona-server-5.6.22-72.0/vio/cmake_install.cmake")
  include("/root/percona-server-5.6.22-72.0/regex/cmake_install.cmake")
  include("/root/percona-server-5.6.22-72.0/mysys/cmake_install.cmake")
  include("/root/percona-server-5.6.22-72.0/mysys_ssl/cmake_install.cmake")
  include("/root/percona-server-5.6.22-72.0/libmysql/cmake_install.cmake")
  include("/root/percona-server-5.6.22-72.0/unittest/cmake_install.cmake")
  include("/root/percona-server-5.6.22-72.0/unittest/examples/cmake_install.cmake")
  include("/root/percona-server-5.6.22-72.0/unittest/mytap/cmake_install.cmake")
  include("/root/percona-server-5.6.22-72.0/unittest/mytap/t/cmake_install.cmake")
  include("/root/percona-server-5.6.22-72.0/unittest/gunit/cmake_install.cmake")
  include("/root/percona-server-5.6.22-72.0/extra/cmake_install.cmake")
  include("/root/percona-server-5.6.22-72.0/client/cmake_install.cmake")
  include("/root/percona-server-5.6.22-72.0/sql/share/cmake_install.cmake")
  include("/root/percona-server-5.6.22-72.0/libservices/cmake_install.cmake")
  include("/root/percona-server-5.6.22-72.0/man/cmake_install.cmake")
  include("/root/percona-server-5.6.22-72.0/tests/cmake_install.cmake")
  include("/root/percona-server-5.6.22-72.0/sql/cmake_install.cmake")
  include("/root/percona-server-5.6.22-72.0/scripts/cmake_install.cmake")
  include("/root/percona-server-5.6.22-72.0/mysql-test/cmake_install.cmake")
  include("/root/percona-server-5.6.22-72.0/mysql-test/lib/My/SafeProcess/cmake_install.cmake")
  include("/root/percona-server-5.6.22-72.0/support-files/cmake_install.cmake")
  include("/root/percona-server-5.6.22-72.0/sql-bench/cmake_install.cmake")
  include("/root/percona-server-5.6.22-72.0/packaging/rpm-oel/cmake_install.cmake")
  include("/root/percona-server-5.6.22-72.0/packaging/rpm-fedora/cmake_install.cmake")
  include("/root/percona-server-5.6.22-72.0/packaging/rpm-sles/cmake_install.cmake")
  include("/root/percona-server-5.6.22-72.0/packaging/WiX/cmake_install.cmake")
  include("/root/percona-server-5.6.22-72.0/packaging/solaris/cmake_install.cmake")

endif()

if(CMAKE_INSTALL_COMPONENT)
  set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

file(WRITE "/root/percona-server-5.6.22-72.0/${CMAKE_INSTALL_MANIFEST}" "")
foreach(file ${CMAKE_INSTALL_MANIFEST_FILES})
  file(APPEND "/root/percona-server-5.6.22-72.0/${CMAKE_INSTALL_MANIFEST}" "${file}\n")
endforeach()
