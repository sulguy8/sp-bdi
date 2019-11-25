package com.sp.bdi.test.test2;

import lombok.Data;

@Data
public class Car {
	private String carName; // 소나타
	private Integer price;
	public Car(String carName) {
		this.carName = carName;
		System.out.println("나도 생성되지롱");
	}
}
