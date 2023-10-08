package robotWeb.dao;

import java.util.List;

import robotWeb.vo.*;

public interface HisDAO {
	List<ExplorationRecord> getHistoryByRobotID(String robotID);

	void deleteHistory(int historyID);

	void saveHistory(ExplorationRecord record);

	List<ExplorationRecord> getSortedHistoryRecords(String robotId, String sort);

	List<ExplorationRecord> getAllHistory();
}
