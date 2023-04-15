package cn.oj.web.controller.tool;
import java.util.Scanner;
class Solution {
    public static void main(String[] args) {
        // 读取二维数组
        // 二维数组的列数：
        Scanner scan=new Scanner(System.in);
        int r=scan.nextInt();
        int c=scan.nextInt();
        int[][]matrix=new int[r][c];
        scan.nextLine();//用来跳过行列后的回车符
        for(int i=0;i<r;i++){
            for(int j=0;j<c;j++){
                matrix[i][j]=scan.nextInt();
            }
        }
        int target = scan.nextInt();
        System.out.println(searchArray(matrix, target));
    }
    public static boolean searchArray(int[][] array, int target) {

        //判断矩阵为空的情况
        if(array == null || array.length == 0 || array[0].length == 0){
            return false;
        }

        //表示矩阵右上角的位置（突破口）i行j列
        //右上角的同行左边小于等于它，同列下面大于等于它
        int i=0,j=array[0].length-1;

        while(i <= array.length -1 && j >= 0){
            int x = array[i][j];
            if(x == target){
                return true;
            }else if(x > target){
                //列左移
                j--;
            }else{
                //行下移
                i++;
            }
        }
        return false;
    }
}