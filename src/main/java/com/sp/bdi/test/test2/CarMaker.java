package com.sp.bdi.test.test2;

public class CarMaker {
	private String carMakerName; // 기아
	private Car car; // 소나타 2
	private Car price; // 소나타 2
	
	public CarMaker(String carMakerName) {
		this.carMakerName = carMakerName;
		System.out.println("먼저 메모리 생성되지롱");
	}
	
	public void setCar(Car car) {
		this.car = car; // 소나타 1
		
	}
	public void setPrice(Car price) {
		this.price = price; // 소나타 1
		
	}

	public Car makeCar() {
		System.out.println(this.carMakerName + "가 차를 만듭니다.");
		return this.car;
	}

	@Override
	public String toString() {
		return "CarMaker [carMakerName=" + carMakerName + ", car=" + car + "]";
	}
}
