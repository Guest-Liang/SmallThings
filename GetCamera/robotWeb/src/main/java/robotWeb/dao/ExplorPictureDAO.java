package robotWeb.dao;

import robotWeb.vo.ExplorPicture;

public interface ExplorPictureDAO {

	void insert(ExplorPicture picture);
	
	ExplorPicture findNewPicture();
}
