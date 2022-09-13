run_all_in_parallel:
	make -j test_Windows_10_edge test_OX_X_10_11_firefox test_Windows_10_chrome

test_Windows_10_edge:
	robot  --variable platform:"Windows 10" --variable browserName:MicrosoftEdge --variable version:latest --variable ROBOT_BROWSER:chrome --variable visual:false --variable network:false --variable console:false Tests/sample_test.robot

test_OX_X_10_11_firefox:
	robot --variable platform:"macOS Sierra" --variable browserName:firefox --variable version:latest --variable ROBOT_BROWSER:firefox --variable visual:false --variable network:false --variable console:false Tests/sample_test.robot

test_Windows_10_chrome:
	robot --variable platform:"Windows 10" --variable browserName:chrome --variable version:latest --variable ROBOT_BROWSER:chrome --variable visual:false --variable network:false --variable console:false Tests/sample_test.robot
