# X4OS Project
This project is (re-)based on
https://github.com/arcolinuxb/arco-plasma

The purpose of this project is two-fold:
1) show how easy is building your own (customized) Arch iso with a single script, thanks to the ArcoLinux BYOI
2) build X4OS iso, hosted at https://sourceforge.net/projects/x4os/files 

# How to build your own iso

1. ensure to have an Arch system with archiso package installed (best results with ArcoLinux B Plasma)

2.		git clone https://github.com/x4os-iso/x4os-iso-build.git
	
3. cd installation-scripts
	
4. open a terminal and issue the following command
	./30-build-the-iso-the-first-time.sh
	
... wait ...
	
5. the iso is generated into folder <home>/ArcoLinuxB-Out


# How to customize installation

change content of script
	
	/etc/skel/.config/post-installation-scripts.sh
	
