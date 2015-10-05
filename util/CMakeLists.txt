add_library (Util_Log OBJECT
  "log.cpp")

add_library (Util_Util OBJECT
  "util.cpp")

  
add_executable(Util_Test
  "util_test.cpp"
  "$<TARGET_OBJECTS:Util_Util>"
  "$<TARGET_OBJECTS:Util_Log>")

add_test (Util_Util_Test
  Util_Test)
  
set_tests_properties (Util_Util_Test
	PROPERTIES
	FAIL_REGULAR_EXPRESSION "[^a-z]Error;ERROR;Failed;failed")