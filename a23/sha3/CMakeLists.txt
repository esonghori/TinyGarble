SET_SOURCE_FILES_PROPERTIES(sha3.c 
  PROPERTIES LANGUAGE CXX)

add_executable(Sha3
  "sha3.c"
  "$<TARGET_OBJECTS:A23_Lib_Main>"
  "$<TARGET_OBJECTS:Util_Util>"
  "$<TARGET_OBJECTS:Util_Log>")

if (OPENSSL_FOUND)
  target_link_libraries(Sha3 ${OPENSSL_LIBRARIES})
endif (OPENSSL_FOUND)
if (Boost_FOUND)
  target_link_libraries(Sha3 ${Boost_LIBRARIES})
endif (Boost_FOUND)