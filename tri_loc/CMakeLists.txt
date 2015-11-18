add_executable(TriLoc
  "garbled_circuit_main.cpp"
  "$<TARGET_OBJECTS:Garbled_Circuit_Garbled_Circuit>"
  "$<TARGET_OBJECTS:Garbled_Circuit_Garbled_Circuit_Low_Mem>"
  "$<TARGET_OBJECTS:Crypto_BN>"
  "$<TARGET_OBJECTS:Crypto_OT>"
  "$<TARGET_OBJECTS:Crypto_OT_Extension>"
  "$<TARGET_OBJECTS:SCD_SCD>"
  "$<TARGET_OBJECTS:Util_Util>"
  "$<TARGET_OBJECTS:TCPIP_TCPIP>"
  "$<TARGET_OBJECTS:Util_Log>")

if (OPENSSL_FOUND)
	target_link_libraries(TriLoc ${OPENSSL_LIBRARIES})
endif (OPENSSL_FOUND)
if (Boost_FOUND)
  target_link_libraries(TriLoc ${Boost_LIBRARIES})
endif (Boost_FOUND)
target_link_libraries(TriLoc -lrt)


add_library (Tri_Loc_Tri_Loc OBJECT
  "tri_loc.cpp")

add_executable(TriLoc_0
  "tri_loc_main.cpp"
  "$<TARGET_OBJECTS:Tri_Loc_Tri_Loc>"
  "$<TARGET_OBJECTS:Garbled_Circuit_Garbled_Circuit>"
  "$<TARGET_OBJECTS:Garbled_Circuit_Garbled_Circuit_Low_Mem>"
  "$<TARGET_OBJECTS:Crypto_BN>"
  "$<TARGET_OBJECTS:Crypto_OT>"
  "$<TARGET_OBJECTS:Crypto_OT_Extension>"
  "$<TARGET_OBJECTS:SCD_SCD>"
  "$<TARGET_OBJECTS:Util_Util>"
  "$<TARGET_OBJECTS:TCPIP_TCPIP>"
  "$<TARGET_OBJECTS:Util_Log>")

if (OPENSSL_FOUND)
	target_link_libraries(TriLoc_0 ${OPENSSL_LIBRARIES})
endif (OPENSSL_FOUND)
if (Boost_FOUND)
  target_link_libraries(TriLoc_0 ${Boost_LIBRARIES})
endif (Boost_FOUND)
target_link_libraries(TriLoc_0 -lrt)