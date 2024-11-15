env:
	pip install -e .
	pip install pytest pytest-cov
	git clone https://github.com/IDEA-Research/GroundingDINO.git
	cd GroundingDINO
	git checkout -q 57535c5a79791cb76e36fdb64975271354f10251
	pip install -q -e .
	cd ..
	pip install 'git+https://github.com/facebookresearch/segment-anything.git'
	python -m nltk.downloader all
	mkdir instance_augmentation/models
	cd instance_augmentation/models
	wget -q https://dl.fbaipublicfiles.com/segment_anything/sam_vit_h_4b8939.pth
	wget -q https://github.com/IDEA-Research/GroundingDINO/releases/download/v0.1.0-alpha/groundingdino_swint_ogc.pth

pytest:
	cd instance_augmentation/tests && PYTHONPATH=.. pytest . -s && cd ..
