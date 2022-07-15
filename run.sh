docker run \
	--rm \
	-ti \
	--mount type=bind,source="$(pwd)"/test_data,target=/usr/src/app \
	yolo_adelya:3 \
	bash
	# python get_annotation.py 
