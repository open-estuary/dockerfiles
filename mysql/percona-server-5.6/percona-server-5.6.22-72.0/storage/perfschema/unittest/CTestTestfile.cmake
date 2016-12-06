# CMake generated Testfile for 
# Source directory: /root/percona-server-5.6.22-72.0/storage/perfschema/unittest
# Build directory: /root/percona-server-5.6.22-72.0/storage/perfschema/unittest
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(pfs_instr_class "pfs_instr_class-t")
add_test(pfs_instr_class-oom "pfs_instr_class-oom-t")
add_test(pfs_instr "pfs_instr-t")
add_test(pfs_instr-oom "pfs_instr-oom-t")
add_test(pfs_account-oom "pfs_account-oom-t")
add_test(pfs_host-oom "pfs_host-oom-t")
add_test(pfs_user-oom "pfs_user-oom-t")
add_test(pfs "pfs-t")
add_test(pfs_connect_attr "pfs_connect_attr-t")
