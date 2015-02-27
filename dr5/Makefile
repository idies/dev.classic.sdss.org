DEFAULT:
	@ echo 'Possible Make instructions:'
	@ echo 'make devel	cvs update, tag cvs, export to das.sdss.org/~sdssdp/dr4web'
	@ echo '		Always do this first!'
	@ echo '		Unfortunately, this takes a while as it needs to export'
	@ echo '		some other data products in addition to the web sites.'
	@ echo '		Bundle your changes before updating the devel site...'
	@ echo 'make install	rsync das.sdss.org/~sdssdp/dr4web to www.sdss.org/dr4'
	@ echo '		You need permissions for AFS volume release on the FNAL UNIX'
	@ echo '		cluster to do this successfully.'
	@ echo '		When DR4 is public, change webPublish.sh call!'

devel:
	cvs update -d
	cd bin; ./develPublish.sh

install:
# For collab-only password-protected pre-release publishing:
	cd bin; ./webPublish.sh -publish private
# For public publishing:
#	cd bin; ./webPublish.sh -publish public
