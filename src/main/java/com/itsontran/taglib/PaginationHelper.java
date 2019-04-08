package com.itsontran.taglib;

import java.util.ArrayList;
import java.util.List;

public class PaginationHelper {
	
	
	public static void main(String[] args) {
		int n = 30;
		for (int i = 0; i < n; i++) {
			display(PaginationHelper.makePagination(n, 7, i), i);
			System.out.println();
		}
	}
	
	public static void display(List<Integer> list, int currentPage) {
		for (Integer i : list) {
			if (i == -1) {
				System.out.print("<--\t");
			} else if (i == -2) {
				System.out.print("-->\t");
			} else if (i == currentPage) {
				System.out.print("|" + i + "|" + "\t");
			} else {
				System.out.print(i + "\t");
			}
		}
	}
	/**
	 * 
	 * @param numberOfPages			tổng số trang
	 * @param numberOfPagesDisplay	số ô vuông: truyền số lẻ
	 * @param currentPage			trang hiện tại
	 * @return						list interger ô vuông
	 */
	public static List<Integer> makePagination(int numberOfPages, int numberOfPagesDisplay, int currentPage) {
		List<Integer> list = new ArrayList<>();
		if (numberOfPages < numberOfPagesDisplay) {
			for (int i = 1; i <= numberOfPages; i++) {
				list.add(i);
			}
		} else {
			if (currentPage <= (numberOfPagesDisplay / 2 + 1)) {
				for (int i = 1; i <= numberOfPagesDisplay - 1; i++) {
					list.add(i);
				}
				list.add(-2);
				list.add(numberOfPages);
			} else if (currentPage <= (numberOfPages - (numberOfPagesDisplay / 2 + 1))) {
				list.add(1);
				list.add(-1);
				int sizeFor = currentPage + ((numberOfPagesDisplay - 2) / 2);
				for (int i = currentPage - ((numberOfPagesDisplay - 2) / 2); i <= sizeFor; i++) {
					list.add(i);
				}
				list.add(-2);
				list.add(numberOfPages);
			} else {
				list.add(1);
				list.add(-1);
				for (int i = numberOfPages - numberOfPagesDisplay + 2; i <= numberOfPages; i++) {
					list.add(i);
				}
			}
		}
		return list;
	}
}
