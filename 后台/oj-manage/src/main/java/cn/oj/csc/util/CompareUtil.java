package cn.oj.csc.util;

import cn.oj.common.utils.StringUtils;

public class CompareUtil {
    public static boolean Compare(String userAnswer,String sampleAnswer){
        return StringUtils.equals(userAnswer,sampleAnswer);
    }
}
