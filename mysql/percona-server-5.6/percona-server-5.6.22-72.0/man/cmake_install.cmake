# Install script for directory: /root/percona-server-5.6.22-72.0/man

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

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "ManPages")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/man/man1" TYPE FILE FILES
    "/root/percona-server-5.6.22-72.0/man/mysql.1"
    "/root/percona-server-5.6.22-72.0/man/mysqltest.1"
    "/root/percona-server-5.6.22-72.0/man/mysql_client_test_embedded.1"
    "/root/percona-server-5.6.22-72.0/man/myisam_ftdump.1"
    "/root/percona-server-5.6.22-72.0/man/mysqlshow.1"
    "/root/percona-server-5.6.22-72.0/man/mysql_secure_installation.1"
    "/root/percona-server-5.6.22-72.0/man/mysql_config_editor.1"
    "/root/percona-server-5.6.22-72.0/man/mysql_convert_table_format.1"
    "/root/percona-server-5.6.22-72.0/man/mysql-test-run.pl.1"
    "/root/percona-server-5.6.22-72.0/man/mysqlbug.1"
    "/root/percona-server-5.6.22-72.0/man/mysql.server.1"
    "/root/percona-server-5.6.22-72.0/man/mysqldumpslow.1"
    "/root/percona-server-5.6.22-72.0/man/mysqlbinlog.1"
    "/root/percona-server-5.6.22-72.0/man/replace.1"
    "/root/percona-server-5.6.22-72.0/man/innochecksum.1"
    "/root/percona-server-5.6.22-72.0/man/comp_err.1"
    "/root/percona-server-5.6.22-72.0/man/mysql_setpermission.1"
    "/root/percona-server-5.6.22-72.0/man/mysqlman.1"
    "/root/percona-server-5.6.22-72.0/man/mysqld_multi.1"
    "/root/percona-server-5.6.22-72.0/man/mysql_install_db.1"
    "/root/percona-server-5.6.22-72.0/man/myisamlog.1"
    "/root/percona-server-5.6.22-72.0/man/mysql_plugin.1"
    "/root/percona-server-5.6.22-72.0/man/mysql_upgrade.1"
    "/root/percona-server-5.6.22-72.0/man/myisamchk.1"
    "/root/percona-server-5.6.22-72.0/man/mysqlaccess.1"
    "/root/percona-server-5.6.22-72.0/man/resolveip.1"
    "/root/percona-server-5.6.22-72.0/man/mysql_fix_extensions.1"
    "/root/percona-server-5.6.22-72.0/man/myisampack.1"
    "/root/percona-server-5.6.22-72.0/man/mysqlcheck.1"
    "/root/percona-server-5.6.22-72.0/man/mysqldump.1"
    "/root/percona-server-5.6.22-72.0/man/mysqld_safe.1"
    "/root/percona-server-5.6.22-72.0/man/mysql_client_test.1"
    "/root/percona-server-5.6.22-72.0/man/mysqlslap.1"
    "/root/percona-server-5.6.22-72.0/man/mysqlhotcopy.1"
    "/root/percona-server-5.6.22-72.0/man/mysql_config.1"
    "/root/percona-server-5.6.22-72.0/man/mysqlimport.1"
    "/root/percona-server-5.6.22-72.0/man/mysqltest_embedded.1"
    "/root/percona-server-5.6.22-72.0/man/mysql_zap.1"
    "/root/percona-server-5.6.22-72.0/man/mysql_find_rows.1"
    "/root/percona-server-5.6.22-72.0/man/msql2mysql.1"
    "/root/percona-server-5.6.22-72.0/man/perror.1"
    "/root/percona-server-5.6.22-72.0/man/mysql_waitpid.1"
    "/root/percona-server-5.6.22-72.0/man/mysql_tzinfo_to_sql.1"
    "/root/percona-server-5.6.22-72.0/man/resolve_stack_dump.1"
    "/root/percona-server-5.6.22-72.0/man/mysql-stress-test.pl.1"
    "/root/percona-server-5.6.22-72.0/man/mysqladmin.1"
    "/root/percona-server-5.6.22-72.0/man/my_print_defaults.1"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "ManPages")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/man/man8" TYPE FILE FILES "/root/percona-server-5.6.22-72.0/man/mysqld.8")
endif()

