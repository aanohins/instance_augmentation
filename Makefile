env:
	pip install -e .
	pip install pytest pytest-cov
	test -e GroundingDINO || git clone https://github.com/IDEA-Research/GroundingDINO.git
	cd GroundingDINO
	#git checkout 57535c5
	pip install -q -e .
	cd ..
	pip install 'git+https://github.com/facebookresearch/segment-anything.git'
	python -m nltk.downloader all
	mkdir -p instance_augmentation/models
	cd instance_augmentation/models
	test -f sam_vit_h_4b8939.pth || wget https://dl.fbaipublicfiles.com/segment_anything/sam_vit_h_4b8939.pth
	test -f groundingdino_swint_ogc.pth || wget https://github.com/IDEA-Research/GroundingDINO/releases/download/v0.1.0-alpha/groundingdino_swint_ogc.pth

pytest:
	cd instance_augmentation/tests && PYTHONPATH=.. pytest . -s && cd ..
