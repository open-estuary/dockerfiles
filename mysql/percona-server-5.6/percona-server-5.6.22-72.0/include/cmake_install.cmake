# Install script for directory: /root/percona-server-5.6.22-72.0/include

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

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Development")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE FILE FILES
    "/root/percona-server-5.6.22-72.0/include/mysql.h"
    "/root/percona-server-5.6.22-72.0/include/mysql_com.h"
    "/root/percona-server-5.6.22-72.0/include/mysql_time.h"
    "/root/percona-server-5.6.22-72.0/include/my_list.h"
    "/root/percona-server-5.6.22-72.0/include/my_alloc.h"
    "/root/percona-server-5.6.22-72.0/include/typelib.h"
    "/root/percona-server-5.6.22-72.0/include/mysql/plugin.h"
    "/root/percona-server-5.6.22-72.0/include/mysql/plugin_audit.h"
    "/root/percona-server-5.6.22-72.0/include/mysql/plugin_ftparser.h"
    "/root/percona-server-5.6.22-72.0/include/mysql/plugin_validate_password.h"
    "/root/percona-server-5.6.22-72.0/include/my_dbug.h"
    "/root/percona-server-5.6.22-72.0/include/m_string.h"
    "/root/percona-server-5.6.22-72.0/include/my_sys.h"
    "/root/percona-server-5.6.22-72.0/include/my_xml.h"
    "/root/percona-server-5.6.22-72.0/include/mysql_embed.h"
    "/root/percona-server-5.6.22-72.0/include/my_pthread.h"
    "/root/percona-server-5.6.22-72.0/include/decimal.h"
    "/root/percona-server-5.6.22-72.0/include/errmsg.h"
    "/root/percona-server-5.6.22-72.0/include/my_global.h"
    "/root/percona-server-5.6.22-72.0/include/my_net.h"
    "/root/percona-server-5.6.22-72.0/include/my_getopt.h"
    "/root/percona-server-5.6.22-72.0/include/sslopt-longopts.h"
    "/root/percona-server-5.6.22-72.0/include/my_dir.h"
    "/root/percona-server-5.6.22-72.0/include/sslopt-vars.h"
    "/root/percona-server-5.6.22-72.0/include/sslopt-case.h"
    "/root/percona-server-5.6.22-72.0/include/sql_common.h"
    "/root/percona-server-5.6.22-72.0/include/keycache.h"
    "/root/percona-server-5.6.22-72.0/include/m_ctype.h"
    "/root/percona-server-5.6.22-72.0/include/my_attribute.h"
    "/root/percona-server-5.6.22-72.0/include/my_compiler.h"
    "/root/percona-server-5.6.22-72.0/include/mysql_com_server.h"
    "/root/percona-server-5.6.22-72.0/include/my_byteorder.h"
    "/root/percona-server-5.6.22-72.0/include/byte_order_generic.h"
    "/root/percona-server-5.6.22-72.0/include/byte_order_generic_x86.h"
    "/root/percona-server-5.6.22-72.0/include/byte_order_generic_x86_64.h"
    "/root/percona-server-5.6.22-72.0/include/little_endian.h"
    "/root/percona-server-5.6.22-72.0/include/big_endian.h"
    "/root/percona-server-5.6.22-72.0/include/mysql_version.h"
    "/root/percona-server-5.6.22-72.0/include/my_config.h"
    "/root/percona-server-5.6.22-72.0/include/mysqld_ername.h"
    "/root/percona-server-5.6.22-72.0/include/mysqld_error.h"
    "/root/percona-server-5.6.22-72.0/include/sql_state.h"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Development")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/mysql" TYPE DIRECTORY FILES "/root/percona-server-5.6.22-72.0/include/mysql/" REGEX "/[^/]*\\.h$" REGEX "/psi\\_abi[^/]*$" EXCLUDE)
endif()

