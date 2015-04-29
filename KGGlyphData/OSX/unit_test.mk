#
# unit_test.mk
#

SRCROOT		?= ..

top_dir     	= $(SRCROOT)
unit_test	= $(BUILD_DIR)/$(CONFIGURATION)/UnitTest
test_dir	= $(top_dir)/../UnitTest
test_log	= $(BUILD_DIR)/$(CONFIGURATION)/UnitTest.log

unit_test: dummy
	test -f $(unit_test)
	(cd $(test_dir) ; $(unit_test) > $(test_log) 2>&1)
	diff $(test_log) $(test_dir)/UnitTest.log.OK

dummy:

