SET_SOURCE_FILES_PROPERTIES(cordic.c 
  PROPERTIES LANGUAGE CXX)


add_executable(Cordic
  "cordic.c"
  "$<TARGET_OBJECTS:A23_Lib_Main>"
  "$<TARGET_OBJECTS:Util_Util>"
  "$<TARGET_OBJECTS:Util_Log>")

if (OPENSSL_FOUND)
  target_link_libraries(Cordic ${OPENSSL_LIBRARIES})
endif (OPENSSL_FOUND)
if (Boost_FOUND)
  target_link_libraries(Cordic ${Boost_LIBRARIES})
endif (Boost_FOUND)
