package spring.common;

public class PageCount {
	
	public static final Long PER_PAGE_CNT = 10L;
	
	public static Long getPageCnt(int totalCnt) {
		Long pageCnt = totalCnt / PER_PAGE_CNT;
		if (0 < totalCnt % PER_PAGE_CNT) {
			pageCnt++;
		}
		return pageCnt;
	}

}
